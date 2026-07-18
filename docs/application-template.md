# Tar Cloud Application Template

This document provides a standard template for any application that will be hosted on the Tar Cloud platform.

Every new application should follow this structure.

---

# Directory Structure

```text
my-app/
│
├── Dockerfile
├── compose.yml
├── .dockerignore
├── README.md
│
├── src/
│
└── .github/
    └── workflows/
        deploy.yml
```

---

# Dockerfile

## React Application

```Dockerfile
FROM node:22-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run build

FROM nginx:stable-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80
```

---

## Node / Express Application

```Dockerfile
FROM node:22-alpine

WORKDIR /app

COPY package*.json ./

RUN npm ci --omit=dev

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
```

---

# compose.yml

```yaml
services:

  tar-cloud-my-app:

    build: .

    container_name: tar-cloud-my-app

    restart: unless-stopped

    env_file:
      - /srv/docker/env/tar-cloud.env

    networks:
      - tar-cloud

networks:

  tar-cloud:
    external: true
```

---

# .dockerignore

```text
node_modules

build

.git

.github

.env

npm-debug.log
```

---

# GitHub Workflow

Location:

```text
.github/workflows/deploy.yml
```

Contents:

```yaml
---
name: Deploy

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: self-hosted

    steps:
      - uses: actions/checkout@v4

      - name: Deploy Application
        run: |
          /srv/tar-cloud-infra/scripts/deploy-app.sh my-app
```

Replace **my-app** with the repository directory inside `/srv/apps`.

---

# React Nginx Configuration

```nginx
server {

    listen 80;

    server_name _;

    root /usr/share/nginx/html;

    index index.html;

    location / {

        try_files $uri /index.html;

    }

}
```

---

# Tar Cloud Nginx Reverse Proxy

File:

```text
compose/nginx/conf.d/my-app.conf
```

```nginx
server {

    listen 80;

    server_name example.tarush.in;

    location / {

        proxy_pass http://tar-cloud-my-app:80;

        proxy_http_version 1.1;

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";

    }

}
```

---

# Cloudflare

Create a Public Hostname.

Example

```text
cloud.tarush.in

↓

http://nginx:80
```

---

# Environment Variables

Never commit secrets.

Store everything inside

```text
/srv/docker/env/tar-cloud.env
```

Example

```text
DATABASE_URL=

JWT_SECRET=

GEMINI_API_KEY=

OPENAI_API_KEY=

REDIS_PASSWORD=
```

---

# Naming Convention

Repository

```text
portfolio
```

↓

Directory

```text
/srv/apps/portfolio
```

↓

Container

```text
tar-cloud-portfolio
```

↓

Nginx

```text
portfolio.conf
```

↓

Domain

```text
cloud.tarush.in
```

---

# Deployment Flow

```text
git push

↓

GitHub Actions

↓

Self Hosted Runner

↓

deploy-app.sh

↓

git pull

↓

docker compose up -d --build

↓

Application Updated
```

---

# Pre-Deployment Checklist

Before hosting an application verify:

- Dockerfile exists
- compose.yml exists
- .dockerignore exists
- Uses env_file
- Uses tar-cloud network
- Uses restart: unless-stopped
- Uses tar-cloud-* container name
- GitHub workflow exists
- Repository cloned into /srv/apps
- Nginx configuration created
- Cloudflare hostname configured

---

# Optional Integrations

Applications should support the following whenever applicable.

- Homepage service entry
- Homepage widget
- Uptime Kuma monitor
- Prometheus metrics
- Grafana dashboard
- Health endpoint
- Docker HEALTHCHECK
- Structured logging
- Automated backups
- HTTPS through Cloudflare
