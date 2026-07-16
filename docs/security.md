# Security Policy

## Principles

Tar Cloud follows a security-first approach.

Sensitive information is never committed to version control.

---

# Secrets

The following must never be committed:

- API Keys
- Passwords
- Private Keys
- SSH Keys
- Database Credentials
- Access Tokens
- Environment Files (`.env`)

Instead:

- `.env.example` files are committed.
- Actual secrets are stored securely outside the repository.

---

# Authentication

Remote administration uses:

- SSH Key Authentication
- Tailscale

Password-based SSH access should remain disabled unless required for recovery.

---

# Infrastructure

Servers should:

- Receive regular security updates.
- Restrict unnecessary services.
- Use least-privilege principles where practical.
- Separate persistent data from application code.

---

# Networking

Services should only expose the ports required for operation.

Administrative services should remain accessible through secure remote networking rather than public exposure whenever possible.

---

# Docker

Containers should:

- Run official or trusted images.
- Use named volumes for persistent data.
- Restart automatically when appropriate.
- Store configuration separately from data.

---

# Repository Guidelines

The repository may remain public because it contains infrastructure definitions rather than sensitive configuration.

Public:

- Documentation
- Compose files
- Scripts
- Architecture

Private:

- Secrets
- Credentials
- Runtime configuration
- Backups

---

# Future Improvements

- Docker Secrets
- Automatic vulnerability scanning
- SSL/TLS certificates
- Backup encryption
- Secret management
- Role-based access control