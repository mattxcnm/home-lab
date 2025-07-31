# Docker Compose Services

This directory contains Docker Compose configurations for various homelab services.

## 📁 Directory Structure

```text
docker-compose/
├── README.md              # This file
├── monitoring/            # Monitoring stack (Grafana, Prometheus, etc.)
├── media/                 # Media services (Plex, Sonarr, Radarr, etc.)
├── productivity/          # Productivity tools (Nextcloud, Gitea, etc.)
├── security/              # Security services (VPN, Password manager, etc.)
├── development/           # Development tools (Jenkins, Registry, etc.)
├── home-automation/       # Home Assistant and IoT services
└── infrastructure/        # Core infrastructure services
```

## 🚀 Quick Start

### Prerequisites
- Docker and Docker Compose installed
- Sufficient disk space for services
- Network configuration completed
- DNS resolution configured

### Deployment Steps
1. **Choose a service category** (e.g., monitoring)
2. **Navigate to the directory** (`cd monitoring/`)
3. **Copy environment template** (`cp .env.example .env`)
4. **Edit configuration** (Update `.env` file with your settings)
5. **Deploy services** (`docker-compose up -d`)
6. **Verify deployment** (`docker-compose ps`)

### Common Commands
```bash
# Deploy all services in a directory
docker-compose up -d

# View service logs
docker-compose logs -f [service-name]

# Stop all services
docker-compose down

# Update services
docker-compose pull && docker-compose up -d

# Check service status
docker-compose ps
```

## 📊 Service Categories

### Monitoring Stack
- **Grafana**: Metrics visualization and dashboards
- **Prometheus**: Time-series metrics collection
- **Loki**: Log aggregation and querying
- **AlertManager**: Alert routing and notifications
- **Node Exporter**: System metrics collection
- **cAdvisor**: Container metrics collection

### Media Services
- **Plex**: Media server and streaming
- **Sonarr**: TV show management
- **Radarr**: Movie management
- **Lidarr**: Music management
- **qBittorrent**: Download client
- **Overseerr**: Media request management

### Productivity Tools
- **Nextcloud**: File sync and collaboration
- **Gitea**: Git repository hosting
- **BookStack**: Documentation and wiki
- **Vaultwarden**: Password management
- **Paperless-ng**: Document management

### Security Services
- **WireGuard**: VPN server
- **Pi-hole**: DNS filtering and ad blocking
- **Nginx Proxy Manager**: Reverse proxy with SSL
- **Fail2ban**: Intrusion prevention
- **ClamAV**: Antivirus scanning

### Development Tools
- **Jenkins**: CI/CD automation
- **Harbor**: Container registry
- **SonarQube**: Code quality analysis
- **Portainer**: Container management
- **Code Server**: Web-based VS Code

### Home Automation
- **Home Assistant**: Smart home hub
- **Mosquitto**: MQTT broker
- **Zigbee2MQTT**: Zigbee device management
- **Node-RED**: Flow-based automation
- **InfluxDB**: Time-series database for IoT

### Infrastructure Services
- **Traefik**: Reverse proxy and load balancer
- **Consul**: Service discovery
- **Vault**: Secrets management
- **Watchtower**: Automatic container updates
- **Dozzle**: Real-time log viewer

## 🔧 Configuration Management

### Environment Variables
Each service directory contains:
- **`.env.example`**: Template with all required variables
- **`.env`**: Your actual configuration (git-ignored)
- **`docker-compose.yml`**: Service definition
- **`README.md`**: Service-specific documentation

### Common Variables
```bash
# Network Configuration
DOMAIN=home.lab
INTERNAL_IP=192.168.1.100

# Storage Paths
DATA_ROOT=/opt/docker-data
CONFIG_ROOT=/opt/docker-config
MEDIA_ROOT=/mnt/media

# Database Credentials
DB_ROOT_PASSWORD=your-secure-password
DB_USER=homelab
DB_PASSWORD=another-secure-password

# Security
PUID=1000
PGID=1000
TZ=America/New_York
```

### Volume Management
- **Configuration**: `/opt/docker-config/{service}/`
- **Data**: `/opt/docker-data/{service}/`
- **Media**: `/mnt/media/` (if applicable)
- **Backups**: `/opt/backups/{service}/`

## 🌐 Network Configuration

### Default Networks
- **Internal**: Communication between services
- **Web**: Services accessible via reverse proxy
- **Monitoring**: Isolated monitoring network
- **Database**: Database access network

### Port Mapping Strategy
- **80/443**: Reverse proxy (Nginx/Traefik)
- **8000-8999**: Web interfaces
- **9000-9999**: Monitoring and metrics
- **3000-3999**: Development tools
- **1000-1999**: Database services

## 🔒 Security Best Practices

### Container Security
- Run containers as non-root user (PUID/PGID)
- Use read-only root filesystems where possible
- Implement proper secret management
- Regular image updates and vulnerability scanning
- Network isolation between service groups

### Access Control
- Reverse proxy with authentication
- VPN access for sensitive services
- Strong passwords and 2FA where supported
- Regular security audits and updates
- Proper firewall configuration

### Data Protection
- Encrypted storage for sensitive data
- Regular automated backups
- Backup encryption and offsite storage
- Database backup and recovery testing
- Configuration version control

## 📈 Monitoring & Maintenance

### Health Checks
- Container health monitoring
- Service availability checks
- Performance metrics collection
- Log aggregation and analysis
- Automated alerting for issues

### Maintenance Tasks
- **Daily**: Backup verification
- **Weekly**: Update container images
- **Monthly**: Security audit and cleanup
- **Quarterly**: Performance review and optimization

### Backup Strategy
```bash
# Example backup script
#!/bin/bash
BACKUP_DIR="/opt/backups/$(date +%Y-%m-%d)"
mkdir -p "$BACKUP_DIR"

# Backup docker-compose files
cp -r /opt/docker-compose "$BACKUP_DIR/"

# Backup configuration
cp -r /opt/docker-config "$BACKUP_DIR/"

# Backup databases (example for PostgreSQL)
docker exec postgres pg_dumpall -U postgres > "$BACKUP_DIR/postgres_backup.sql"
```

## 🚀 Deployment Automation

### Ansible Integration
```yaml
# Example Ansible task
- name: Deploy monitoring stack
  docker_compose:
    project_src: /opt/docker-compose/monitoring
    state: present
    pull: yes
```

### GitOps Workflow
1. **Development**: Test changes locally
2. **Version Control**: Commit to Git repository
3. **CI/CD**: Automated testing and validation
4. **Deployment**: Automatic deployment to production
5. **Monitoring**: Health checks and rollback if needed

### Update Strategy
- **Blue-Green Deployment**: Zero-downtime updates
- **Rolling Updates**: Gradual service updates
- **Canary Deployment**: Test with subset of traffic
- **Rollback Plan**: Quick rollback procedures

## 📋 Troubleshooting

### Common Issues
1. **Port Conflicts**: Check port availability
2. **Permission Issues**: Verify PUID/PGID settings
3. **Network Issues**: Check Docker networks
4. **Storage Issues**: Verify volume mounts
5. **DNS Issues**: Check container name resolution

### Debugging Commands
```bash
# Check container logs
docker-compose logs -f service-name

# Execute shell in container
docker-compose exec service-name bash

# Check container resource usage
docker stats

# Inspect container configuration
docker inspect container-name

# Check network connectivity
docker-compose exec service-name ping other-service
```

### Log Management
- Centralized logging with Loki/ELK
- Log rotation and retention policies
- Error alerting and notification
- Performance log analysis
- Security event logging

## 🎯 Service Recommendations

### Essential Services (Start Here)
1. **Nginx Proxy Manager**: SSL termination and routing
2. **Portainer**: Container management interface
3. **Uptime Kuma**: Basic service monitoring
4. **Pi-hole**: Network-wide ad blocking
5. **Vaultwarden**: Password management

### Intermediate Services
1. **Grafana + Prometheus**: Advanced monitoring
2. **Nextcloud**: Personal cloud storage
3. **Gitea**: Private Git repositories
4. **Plex**: Media streaming
5. **Home Assistant**: Home automation

### Advanced Services
1. **Kubernetes**: Container orchestration
2. **Vault**: Enterprise secrets management
3. **Jenkins**: CI/CD pipelines
4. **ELK Stack**: Advanced log analysis
5. **Istio**: Service mesh

---

*Last Updated: [Date]*
*Docker Compose Version: 3.8+*
