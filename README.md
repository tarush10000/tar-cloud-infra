# Tar Cloud Infrastructure

This stack uses nginx as the single HTTP entrypoint for the self-hosted services.

## Architecture

- Nginx listens on port 80 and exposes the public HTTP surface.
- All web services run on the shared Docker network named tar-cloud.
- Internal service-to-service communication uses Docker DNS names such as homepage, grafana, prometheus, portainer, uptime-kuma, and minio.
- Browser access is routed through nginx to the appropriate container.

## Reverse proxy routes

- / -> homepage:3000
- /grafana/ -> grafana:3000
- /prometheus/ -> prometheus:9090
- /portainer/ -> portainer:9000
- /kuma/ -> uptime-kuma:3001
- /minio/ -> minio:9001

## Network and exposure model

- Keep nginx on host port 80.
- Keep SSH exposed on its host port.
- Keep PostgreSQL and Redis internal only.
- Expose the proxied web services only inside Docker; host ports are removed so the stack is routed through nginx.
