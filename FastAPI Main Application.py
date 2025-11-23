from fastapi import FastAPI, Request
from contextvars import ContextVar
from app.core.logging import configure_logging
from app.core.config import settings
from app.api import endpoints

# Initialize logging before app creation
configure_logging()
logger = structlog.get_logger()

app = FastAPI(
    title=settings.PROJECT_NAME,
    version=settings.API_VERSION,
    docs_url="/api/docs",
    redoc_url="/api/redoc",
    openapi_url="/api/openapi.json"
)

# Correlation ID middleware
correlation_id_var = ContextVar("correlation_id", default=None)

@app.middleware("http")
async def log_requests(request: Request, call_next):
    correlation_id = request.headers.get("X-Correlation-ID") or str(uuid.uuid4())
    correlation_id_var.set(correlation_id)
    
    structlog.contextvars.bind_contextvars(correlation_id=correlation_id)
    logger.info("request_started", method=request.method, path=request.url.path)
    
    response = await call_next(request)
    logger.info("request_completed", status_code=response.status_code)
    return response

# Include routers
app.include_router(endpoints.prediction.router, prefix="/api/v1")
app.include_router(endpoints.health.router, prefix="/api/health")