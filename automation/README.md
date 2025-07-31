# 🤖 Automation & Scripts

This directory contains automation scripts, configuration management, and infrastructure as code for the homelab.

## 📁 Directory Structure

```text
automation/
├── README.md                 # This file
├── ansible/                  # Ansible playbooks and roles
│   ├── playbooks/            # Automation playbooks
│   ├── roles/                # Reusable roles
│   ├── inventory/            # Host inventories
│   └── group_vars/           # Group variables
├── docker-compose/           # Docker Compose files
│   ├── monitoring/           # Monitoring stack
│   ├── media/                # Media services
│   ├── productivity/         # Productivity tools
│   └── development/          # Development tools
├── scripts/                  # Utility scripts
│   ├── backup/               # Backup scripts
│   ├── maintenance/          # Maintenance scripts
│   ├── monitoring/           # Monitoring helpers
│   └── setup/                # Initial setup scripts
├── terraform/                # Infrastructure as Code
│   ├── modules/              # Terraform modules
│   └── environments/         # Environment configs
└── kubernetes/               # Kubernetes manifests
    ├── monitoring/           # Monitoring namespace
    ├── media/                # Media namespace
    └── productivity/         # Productivity namespace
```

## 🚀 Quick Start

### Prerequisites
- Ansible installed on control machine
- Docker and Docker Compose on target hosts
- SSH key access to all servers
- Python 3.x for custom scripts

### Initial Setup
```bash
# Clone the repository
git clone https://github.com/mattxcnm/home-lab.git
cd home-lab/automation

# Install Ansible requirements
pip install -r ansible/requirements.txt
ansible-galaxy install -r ansible/requirements.yml

# Configure inventory
cp ansible/inventory/hosts.example ansible/inventory/hosts
# Edit the hosts file with your server details

# Run initial setup playbook
ansible-playbook -i ansible/inventory/hosts ansible/playbooks/initial-setup.yml
```

## 🔧 Ansible Automation

### Playbooks Overview
| Playbook | Purpose | Target | Frequency |
|----------|---------|--------|-----------|
| initial-setup.yml | Initial server configuration | All servers | Once |
| security-hardening.yml | Security configuration | All servers | Monthly |
| docker-setup.yml | Docker installation and config | Docker hosts | Once |
| monitoring-setup.yml | Monitoring stack deployment | Monitoring hosts | As needed |
| backup-config.yml | Backup service configuration | All servers | Weekly |
| updates.yml | System and package updates | All servers | Weekly |

### Common Commands
```bash
# Run all playbooks
ansible-playbook -i inventory/hosts playbooks/site.yml

# Run specific playbook
ansible-playbook -i inventory/hosts playbooks/docker-setup.yml

# Check inventory
ansible-inventory -i inventory/hosts --list

# Test connectivity
ansible all -i inventory/hosts -m ping

# Run ad-hoc commands
ansible all -i inventory/hosts -m shell -a "df -h"
```

## 🐳 Docker Compose Services

### Service Categories
- **monitoring/**: Grafana, Prometheus, Loki, AlertManager
- **media/**: Plex, Sonarr, Radarr, qBittorrent
- **productivity/**: Nextcloud, Vaultwarden, Gitea
- **development/**: Jenkins, Harbor, SonarQube

### Deployment
```bash
# Deploy monitoring stack
cd docker-compose/monitoring
docker-compose up -d

# Deploy all services
./deploy-all.sh

# Update specific service
cd docker-compose/media
docker-compose pull plex
docker-compose up -d plex
```

## 📜 Utility Scripts

### Backup Scripts
- **`backup/full-backup.sh`**: Complete system backup
- **`backup/docker-backup.sh`**: Docker volumes and configs
- **`backup/config-backup.sh`**: Configuration files only
- **`backup/verify-backup.sh`**: Backup integrity checking

### Maintenance Scripts
- **`maintenance/system-update.sh`**: System package updates
- **`maintenance/docker-cleanup.sh`**: Docker system cleanup
- **`maintenance/log-rotation.sh`**: Log file management
- **`maintenance/cert-renewal.sh`**: SSL certificate renewal

### Monitoring Scripts
- **`monitoring/health-check.sh`**: System health verification
- **`monitoring/alert-test.sh`**: Alert system testing
- **`monitoring/metrics-export.sh`**: Metrics data export

## 🏗️ Infrastructure as Code

### Terraform Modules
- **`modules/proxmox-vm/`**: Proxmox VM provisioning
- **`modules/docker-host/`**: Docker host configuration
- **`modules/network-config/`**: Network setup automation

### Usage Example
```bash
cd terraform/environments/production
terraform init
terraform plan
terraform apply
```

## ☸️ Kubernetes (Future)

### Namespaces
- **monitoring**: Prometheus, Grafana, AlertManager
- **media**: Plex, media management tools
- **productivity**: Nextcloud, Gitea, documentation
- **development**: CI/CD tools, testing environments

### Deployment Strategy
- **ArgoCD**: GitOps continuous deployment
- **Helm Charts**: Package management
- **Sealed Secrets**: Secret management
- **Ingress Controller**: Traffic routing

## 🔄 Automation Workflows

### Daily Automated Tasks
- System health checks
- Backup verification
- Security log review
- Performance monitoring

### Weekly Automated Tasks
- System updates
- Configuration backups
- Certificate renewal checks
- Capacity planning reports

### Monthly Automated Tasks
- Security hardening review
- Dependency updates
- Performance optimization
- Disaster recovery testing

## 📊 Monitoring Integration

### Automated Monitoring Setup
- Prometheus exporters deployment
- Grafana dashboard provisioning
- Alert rule configuration
- Log aggregation setup

### Custom Metrics Collection
- Application performance metrics
- Business logic monitoring
- Custom dashboard creation
- Automated report generation

## 🔐 Security Automation

### Automated Security Tasks
- Security updates installation
- Vulnerability scanning
- Configuration compliance checking
- Access log analysis

### Security Monitoring
- Failed login attempts
- Unusual network traffic
- Configuration changes
- Certificate expiration

## 📈 Performance Optimization

### Automated Tuning
- Database optimization
- Web server tuning
- Container resource optimization
- Network performance tuning

### Capacity Planning
- Resource usage trending
- Growth prediction modeling
- Automated scaling triggers
- Cost optimization analysis

## 🔧 Configuration Management

### Version Control
- All configurations in Git
- Automated change tracking
- Rollback capabilities
- Change approval workflow

### Environment Management
- Development/Staging/Production
- Configuration templating
- Secret management
- Environment promotion

## 📋 Automation Checklist

### Setup Checklist
- [ ] Ansible control machine configured
- [ ] SSH keys deployed to all hosts
- [ ] Inventory file configured
- [ ] Initial playbooks tested
- [ ] Backup automation configured

### Maintenance Checklist
- [ ] Weekly automation review
- [ ] Playbook updates and testing
- [ ] Script security review
- [ ] Documentation updates
- [ ] Performance optimization

### Security Checklist
- [ ] Secret rotation automation
- [ ] Access control review
- [ ] Audit log monitoring
- [ ] Vulnerability scanning
- [ ] Compliance checking

## 🎯 Automation Roadmap

### Phase 1 (Current)
- [x] Basic Ansible setup
- [ ] Core service automation
- [ ] Backup automation
- [ ] Monitoring automation

### Phase 2 (Next 3 months)
- [ ] Advanced configuration management
- [ ] Disaster recovery automation
- [ ] Performance optimization
- [ ] Security hardening automation

### Phase 3 (Next 6 months)
- [ ] Kubernetes migration
- [ ] GitOps implementation
- [ ] Advanced monitoring automation
- [ ] ML-based optimization

### Phase 4 (Future)
- [ ] Full infrastructure automation
- [ ] Self-healing systems
- [ ] Predictive maintenance
- [ ] Zero-touch operations

---

*Last Updated: [Date]*
*Automation Status: [Status Dashboard URL]*
