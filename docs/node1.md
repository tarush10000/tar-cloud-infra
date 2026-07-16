# Node 1

## Purpose

Node1 is the primary compute node within the Tar Cloud infrastructure.

Its responsibilities include:

- Running platform services
- Hosting application containers
- Receiving CI/CD deployments
- Acting as the primary development server

---

# Hardware

## Device

Dell Inspiron 3542

## Processor

Intel Core i5-4200U

- 2 Cores
- 4 Threads

## Memory

4 GB DDR3L 1600 MHz

Planned Upgrade:

- 8 GB DDR3L

## Storage

512 GB SATA SSD

---

# Operating System

Ubuntu Server LTS

Installed as a minimal server installation.

---

# Installed Software

Core

- OpenSSH Server
- Docker
- Docker Compose
- Git
- Tailscale

Utilities

- curl
- wget
- nano
- tree
- htop
- unzip

---

# Directory Structure

```
/srv
├── apps
├── backups
├── configs
├── data
├── docker
├── logs
└── scripts
```

---

# Planned Services

Infrastructure

- Nginx
- Portainer
- Homepage
- Uptime Kuma

Platform

- PostgreSQL
- MinIO

Monitoring

- Prometheus
- Grafana

Applications

- Portfolio
- Future Tar Cloud services

---

# Deployment Workflow

Applications are deployed automatically through GitHub Actions.

```
Developer

↓

Git Push

↓

GitHub Actions

↓

Node1

↓

Docker Compose
```

---

# Recovery Procedure

To rebuild Node1:

1. Install Ubuntu Server.
2. Install OpenSSH.
3. Install Docker.
4. Install Tailscale.
5. Clone the infrastructure repository.
6. Restore persistent volumes.
7. Deploy infrastructure stacks.
8. Verify service health.

---

# Future Expansion

Node1 will continue serving as the primary compute node while additional machines provide storage, monitoring, and specialized workloads.