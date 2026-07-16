# Deployment Notes

## Entry point

All HTTP traffic should flow through nginx. This provides one entrypoint, consistent headers, and a simpler access model.

## Container networking

The compose services attach to the external Docker network tar-cloud. That allows internal communication through Docker DNS rather than host IPs or published ports.

## Reverse proxy behavior

The nginx configuration routes:

- / to homepage
- /grafana/ to Grafana
- /prometheus/ to Prometheus
- /portainer/ to Portainer
- /kuma/ to Uptime Kuma
- /minio/ to MinIO Console

WebSocket-aware proxying is enabled where required for the dashboard-style applications.

## Service exposure

- Nginx: published on port 80
- SSH: published as needed
- PostgreSQL and Redis: internal only
- Homepage, Grafana, Prometheus, Portainer, MinIO Console, and Uptime Kuma: internal-only within Docker
