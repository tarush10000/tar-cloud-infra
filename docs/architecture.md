# Tar Cloud Architecture

## Overview

Tar Cloud is a self-hosted cloud platform designed to provide infrastructure, storage, deployment, monitoring, and developer services using commodity hardware.

The project focuses on building a reproducible, modular, and scalable platform where every component is containerized, documented, and deployable through Infrastructure as Code principles.

Rather than replicating commercial cloud providers feature-for-feature, Tar Cloud aims to replace the cloud services that are used daily while providing complete ownership over data and infrastructure.

---

# Design Principles

- Self-hosted
- Infrastructure as Code
- Container-first architecture
- Git-driven deployments
- Secure by default
- Modular design
- Horizontal scalability
- Documentation-first development

---

# High-Level Architecture

```
                   Developer Laptop
                          │
                Git / SSH / Tailscale
                          │
                     GitHub Repositories
                          │
                   GitHub Actions (CI/CD)
                          │
                  Deployment Pipeline
                          │
        ┌─────────────────────────────────┐
        │          Tar Cloud              │
        └─────────────────────────────────┘
                 │                  │
          Compute Nodes       Storage Nodes
                 │                  │
                 └──────────┬───────┘
                            │
                    Platform Services
```

---

# Core Infrastructure

The infrastructure layer provides the foundation for all hosted services.

Components include:

- Ubuntu Server
- Docker
- Docker Compose
- OpenSSH
- Tailscale
- Nginx
- Portainer
- Homepage
- Uptime Kuma

---

# Platform Services

These services support applications deployed on the platform.

Current:

- PostgreSQL
- MinIO

Planned:

- Redis
- Authentication Service
- Object Storage
- Reverse Proxy
- Internal APIs

---

# Application Layer

Applications are deployed independently from infrastructure.

Examples include:

- Portfolio
- Doccy
- ProDev.AI
- Hospital Management System

Each application owns its deployment pipeline while sharing platform services where appropriate.

---

# Storage

Persistent data is separated from applications.

Examples:

- Database volumes
- Uploaded files
- Application assets
- Backups

Storage is designed to migrate to dedicated storage nodes as the cluster expands.

---

# Monitoring

The monitoring stack provides visibility into system health.

Planned components:

- Prometheus
- Grafana
- Node Exporter
- cAdvisor

---

# CI/CD

Deployments follow a Git-driven workflow.

```
Developer

↓

Git Commit

↓

GitHub

↓

GitHub Actions

↓

Docker Compose

↓

Updated Services
```

---

# Long-Term Vision

Tar Cloud will gradually evolve into a unified personal cloud platform capable of providing:

- Compute
- Storage
- Deployment
- Monitoring
- AI Services
- Productivity Tools
- Personal Dashboard

while remaining lightweight enough to run on commodity hardware.

---

# Repository Structure

Infrastructure:

- tar-cloud-infra

Applications:

- tar-cloud

Individual applications remain independent repositories deployed through the infrastructure platform.