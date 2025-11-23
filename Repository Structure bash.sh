ai-automation-pipeline/
├── app/
│   ├── core/
│   │   ├── config.py          # Centralized configuration
│   │   ├── logging.py         # Advanced logging setup
│   │   └── security.py        # API key auth & rate limiting
│   ├── services/
│   │   ├── llm_service.py     # LLM abstraction layer
│   │   └── pipeline_service.py # Business logic orchestrator
│   ├── api/
│   │   ├── endpoints/
│   │   │   ├── prediction.py  # LLM prediction endpoint
│   │   │   └── health.py      # Health checks
│   │   └── __init__.py
│   ├── models/
│   │   ├── request.py         # Pydantic request models
│   │   └── response.py        # Pydantic response models
│   ├── utils/
│   │   └── metrics.py         # Prometheus metrics
│   ├── main.py                # FastAPI app factory
│   └── __init__.py
├── infrastructure/
│   ├── Dockerfile             # Multi-stage optimized build
│   ├── docker-compose.yml     # For local development
│   └── k8s/                   # Kubernetes manifests (optional)
├── tests/
│   ├── unit/
│   ├── integration/
│   └── conftest.py
├── scripts/
│   └── entrypoint.sh          # Container startup script
├── requirements/
│   ├── base.txt               # Core dependencies
│   ├── prod.txt               # Production extras
│   └── dev.txt                # Development tools
├── .github/
│   └── workflows/
│       └── ci-cd.yaml         # GitHub Actions pipeline
├── .dockerignore
├── .gitignore
├── LICENSE                    # MIT License
├── pyproject.toml             # Modern Python project config
└── README.md                  # Professional documentation