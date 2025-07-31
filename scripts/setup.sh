#!/bin/bash

# Homelab Setup Script
# This script helps initialize your homelab documentation and environment

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Script information
SCRIPT_VERSION="1.0.0"
SCRIPT_NAME="Homelab Setup"

# Print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo -e "${BLUE}"
    echo "=========================================="
    echo "  $SCRIPT_NAME v$SCRIPT_VERSION"
    echo "=========================================="
    echo -e "${NC}"
}

# Check if running as root
check_root() {
    if [[ $EUID -eq 0 ]]; then
        print_error "This script should not be run as root for security reasons."
        exit 1
    fi
}

# Check system requirements
check_requirements() {
    print_status "Checking system requirements..."
    
    # Check for Git
    if ! command -v git &> /dev/null; then
        print_error "Git is not installed. Please install Git first."
        exit 1
    fi
    
    # Check for Python3
    if ! command -v python3 &> /dev/null; then
        print_warning "Python3 is not installed. Some automation features may not work."
    fi
    
    # Check for Docker
    if ! command -v docker &> /dev/null; then
        print_warning "Docker is not installed. Container services will not work."
    fi
    
    # Check for Docker Compose
    if ! command -v docker-compose &> /dev/null && ! docker compose version &> /dev/null; then
        print_warning "Docker Compose is not installed. Container orchestration will not work."
    fi
    
    print_success "System check completed"
}

# Initialize Git repository
init_git() {
    print_status "Initializing Git repository..."
    
    if [ ! -d ".git" ]; then
        git init
        print_success "Git repository initialized"
    else
        print_status "Git repository already exists"
    fi
    
    # Create .gitignore if it doesn't exist
    if [ ! -f ".gitignore" ]; then
        cat > .gitignore << 'EOF'
# Environment files
.env
*.env

# Logs
*.log
logs/

# Temporary files
*.tmp
*.temp
.DS_Store
Thumbs.db

# IDE files
.vscode/settings.json
.idea/
*.swp
*.swo

# Backup files
*.bak
*.backup

# SSH keys
*.pem
*.key
id_rsa*

# Ansible vault files
*vault*

# Terraform files
*.tfstate
*.tfstate.backup
.terraform/

# Sensitive data
secrets/
private/
credentials/

# Docker volumes
docker-data/
docker-config/

# Media files (optional - uncomment if you don't want to track media)
# media/
# downloads/

# Monitoring data
prometheus-data/
grafana-data/
influxdb-data/
EOF
        print_success "Created .gitignore file"
    fi
}

# Create directory structure
create_directories() {
    print_status "Creating directory structure..."
    
    # Create main directories
    local dirs=(
        "automation/ansible/playbooks"
        "automation/ansible/roles"
        "automation/ansible/inventory"
        "automation/ansible/group_vars"
        "automation/scripts/backup"
        "automation/scripts/maintenance"
        "automation/scripts/monitoring"
        "automation/scripts/setup"
        "automation/terraform/modules"
        "automation/terraform/environments"
        "automation/kubernetes/monitoring"
        "automation/kubernetes/media"
        "automation/kubernetes/productivity"
        "docker-compose/monitoring"
        "docker-compose/media"
        "docker-compose/productivity"
        "docker-compose/security"
        "docker-compose/development"
        "docker-compose/home-automation"
        "docker-compose/infrastructure"
        "configs/nginx"
        "configs/prometheus"
        "configs/grafana"
        "scripts"
        "templates"
        "assets/images"
        "assets/diagrams"
    )
    
    for dir in "${dirs[@]}"; do
        if [ ! -d "$dir" ]; then
            mkdir -p "$dir"
            print_status "Created directory: $dir"
        fi
    done
    
    print_success "Directory structure created"
}

# Create initial configuration files
create_configs() {
    print_status "Creating initial configuration files..."
    
    # Create basic Docker Compose environment template
    if [ ! -f "docker-compose/.env.example" ]; then
        cat > docker-compose/.env.example << 'EOF'
# Homelab Environment Configuration

# Network Configuration
DOMAIN=home.lab
EXTERNAL_DOMAIN=yourdomain.com
INTERNAL_IP=192.168.1.100

# Timezone
TZ=America/New_York

# User Configuration
PUID=1000
PGID=1000

# Storage Paths
DATA_ROOT=/opt/docker-data
CONFIG_ROOT=/opt/docker-config
MEDIA_ROOT=/mnt/media
DOWNLOAD_ROOT=/mnt/downloads
BACKUP_ROOT=/opt/backups

# Database Configuration
MYSQL_ROOT_PASSWORD=your-secure-mysql-password
POSTGRES_PASSWORD=your-secure-postgres-password
REDIS_PASSWORD=your-secure-redis-password

# Application Secrets
SECRET_KEY=your-secret-key-here
JWT_SECRET=your-jwt-secret-here
ENCRYPTION_KEY=your-encryption-key-here

# Email Configuration (for notifications)
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=your-email@gmail.com
SMTP_PASSWORD=your-app-password
EMAIL_FROM=homelab@yourdomain.com

# External Service API Keys
OPENWEATHER_API_KEY=your-openweather-api-key
TMDB_API_KEY=your-tmdb-api-key

# VPN Configuration
VPN_PROVIDER=nordvpn
VPN_USERNAME=your-vpn-username
VPN_PASSWORD=your-vpn-password

# Backup Configuration
BACKUP_ENCRYPTION_PASSWORD=your-backup-encryption-password
CLOUD_BACKUP_ACCESS_KEY=your-cloud-access-key
CLOUD_BACKUP_SECRET_KEY=your-cloud-secret-key
EOF
        print_success "Created Docker Compose environment template"
    fi
    
    # Create basic Ansible inventory
    if [ ! -f "automation/ansible/inventory/hosts.example" ]; then
        cat > automation/ansible/inventory/hosts.example << 'EOF'
[homelab:children]
docker_hosts
proxmox_hosts
network_devices

[docker_hosts]
server1 ansible_host=192.168.1.10 ansible_user=admin
server2 ansible_host=192.168.1.11 ansible_user=admin

[proxmox_hosts]
proxmox1 ansible_host=192.168.1.20 ansible_user=root

[network_devices]
router ansible_host=192.168.1.1 ansible_user=admin
switch ansible_host=192.168.1.2 ansible_user=admin

[homelab:vars]
ansible_ssh_private_key_file=~/.ssh/homelab_key
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
EOF
        print_success "Created Ansible inventory template"
    fi
}

# Create useful scripts
create_scripts() {
    print_status "Creating utility scripts..."
    
    # Create backup script
    if [ ! -f "scripts/backup.sh" ]; then
        cat > scripts/backup.sh << 'EOF'
#!/bin/bash
# Simple backup script for homelab

BACKUP_DIR="/opt/backups/$(date +%Y-%m-%d_%H-%M-%S)"
CONFIG_DIR="/opt/docker-config"
COMPOSE_DIR="/opt/docker-compose"

echo "Creating backup directory: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

echo "Backing up Docker configurations..."
cp -r "$CONFIG_DIR" "$BACKUP_DIR/"
cp -r "$COMPOSE_DIR" "$BACKUP_DIR/"

echo "Backing up this repository..."
cp -r "$(pwd)" "$BACKUP_DIR/homelab-repo"

echo "Backup completed: $BACKUP_DIR"
EOF
        chmod +x scripts/backup.sh
        print_success "Created backup script"
    fi
    
    # Create update script
    if [ ! -f "scripts/update.sh" ]; then
        cat > scripts/update.sh << 'EOF'
#!/bin/bash
# Update all Docker containers

echo "Updating Docker containers..."

# Find all docker-compose directories
find docker-compose -name "docker-compose.yml" -exec dirname {} \; | while read dir; do
    echo "Updating services in $dir..."
    cd "$dir" || continue
    docker-compose pull
    docker-compose up -d
    cd - > /dev/null
done

echo "Update completed"
EOF
        chmod +x scripts/update.sh
        print_success "Created update script"
    fi
    
    # Create monitoring script
    if [ ! -f "scripts/monitor.sh" ]; then
        cat > scripts/monitor.sh << 'EOF'
#!/bin/bash
# Simple monitoring script

echo "=== Homelab Status Report ==="
echo "Generated: $(date)"
echo

echo "=== System Information ==="
echo "Hostname: $(hostname)"
echo "Uptime: $(uptime)"
echo "Load Average: $(cat /proc/loadavg)"
echo

echo "=== Docker Container Status ==="
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
echo

echo "=== Disk Usage ==="
df -h | grep -E "^/|docker"
echo

echo "=== Memory Usage ==="
free -h
echo

echo "=== Network Connectivity ==="
ping -c 1 8.8.8.8 > /dev/null && echo "Internet: OK" || echo "Internet: FAILED"
ping -c 1 192.168.1.1 > /dev/null && echo "Gateway: OK" || echo "Gateway: FAILED"
EOF
        chmod +x scripts/monitor.sh
        print_success "Created monitoring script"
    fi
}

# Create initial commit
initial_commit() {
    print_status "Creating initial Git commit..."
    
    git add .
    git commit -m "Initial homelab documentation setup

- Added comprehensive documentation structure
- Created automation framework
- Set up Docker Compose templates
- Added utility scripts
- Configured project templates" || print_warning "Nothing to commit or commit failed"
    
    print_success "Initial commit completed"
}

# Print completion message
print_completion() {
    print_header
    print_success "Homelab setup completed successfully!"
    echo
    print_status "Next steps:"
    echo "1. Review and customize the documentation in docs/"
    echo "2. Copy docker-compose/.env.example to docker-compose/.env and configure"
    echo "3. Update automation/ansible/inventory/hosts.example with your servers"
    echo "4. Start deploying services with Docker Compose"
    echo "5. Set up monitoring and backup automation"
    echo
    print_status "Useful commands:"
    echo "- ./scripts/backup.sh          # Create a backup"
    echo "- ./scripts/update.sh          # Update all containers"
    echo "- ./scripts/monitor.sh         # System status check"
    echo
    print_status "Documentation available at:"
    echo "- README.md                    # Main overview"
    echo "- docs/hardware.md             # Hardware documentation"
    echo "- docs/network.md              # Network configuration"
    echo "- docs/services.md             # Service catalog"
    echo "- docs/monitoring.md           # Monitoring setup"
    echo "- docs/security.md             # Security and backup"
    echo "- docs/costs.md                # Cost analysis"
    echo "- docs/roadmap.md              # Future planning"
    echo
    print_success "Happy homelabbing! 🏠🖥️"
}

# Main execution
main() {
    print_header
    check_root
    check_requirements
    init_git
    create_directories
    create_configs
    create_scripts
    initial_commit
    print_completion
}

# Run the script
main "$@"
