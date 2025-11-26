# 🚀 Services & Applications

This document catalogs all services, applications, and containers running in the homelab.

## 📊 Service Overview

| Category | Count | Status | Notes |
|----------|-------|--------|-------|
| Core Infrastructure | 0 | ⚠️ | DNS, DHCP, etc. |
| Media Services | 0 | ⚠️ | Plex, Jellyfin, etc. |
| Development Tools | 0 | ⚠️ | Git, CI/CD, etc. |
| Monitoring | 0 | ⚠️ | Grafana, Prometheus |
| Home Automation | 0 | ⚠️ | Home Assistant |
| Security | 0 | ⚠️ | VPN, Firewalls |
| Productivity | 0 | ⚠️ | Cloud services |
| **Total Services** | **0** | **⚠️** | |

### Specific Services

| Name | Category | Node | Notes |
| Proxmox ||||
| Uptime Kuma ||||
| Cloudflared ||||
| Home Assistant ||||
| ESP Home ||||
|  ||||
|||||

## 🏗️ Infrastructure Services

### Virtualization Platform
- **Service**: [Proxmox/ESXi/Docker]
- **Version**: 
- **Host**: 
- **Resources**: 
- **Web Interface**: https://[ip]:8006
- **Status**: ⚠️ Not Configured
- **Purpose**: Host VMs and containers
- **Backup**: 
- **Notes**: 

### DNS Server
- **Service**: [Pi-hole/Bind/AdGuard]
- **Version**: 
- **Host**: 
- **Port**: 53
- **Web Interface**: https://[ip]/admin
- **Status**: ⚠️ Not Configured
- **Purpose**: DNS resolution and ad blocking
- **Upstream DNS**: 1.1.1.1, 8.8.8.8
- **Block Lists**: 
- **Notes**: 

### DHCP Server
- **Service**: [Router/Pi-hole/ISC DHCP]
- **Version**: 
- **Host**: 
- **Range**: 192.168.1.100-200
- **Lease Time**: 24 hours
- **Status**: ⚠️ Not Configured
- **Purpose**: Automatic IP assignment
- **Static Reservations**: 
- **Notes**: 

### Reverse Proxy
- **Service**: [Nginx Proxy Manager/Traefik/Caddy]
- **Version**: 
- **Host**: 
- **Ports**: 80, 443
- **Web Interface**: https://[ip]:81
- **Status**: ⚠️ Not Configured
- **Purpose**: SSL termination and routing
- **SSL Certificates**: Let's Encrypt
- **Protected Services**: 
- **Notes**: 

## 📱 Core Applications

### Container Management
- **Service**: [Portainer/Docker Compose]
- **Version**: 
- **Host**: 
- **Port**: 9000
- **Web Interface**: https://[ip]:9000
- **Status**: ⚠️ Not Configured
- **Purpose**: Container orchestration
- **Containers Managed**: 
- **Notes**: 

### File Sync & Storage
- **Service**: [Nextcloud/Syncthing/Seafile]
- **Version**: 
- **Host**: 
- **Port**: 
- **Web Interface**: https://cloud.[domain]
- **Status**: ⚠️ Not Configured
- **Purpose**: Personal cloud storage
- **Storage Location**: 
- **Users**: 
- **Notes**: 

### Git Repository
- **Service**: [Gitea/GitLab/Forgejo]
- **Version**: 
- **Host**: 
- **Port**: 3000
- **Web Interface**: https://git.[domain]
- **Status**: ⚠️ Not Configured
- **Purpose**: Code repository hosting
- **Repositories**: 
- **Users**: 
- **Notes**: 

## 🎬 Media Services

### Media Server
- **Service**: [Plex/Jellyfin/Emby]
- **Version**: 
- **Host**: 
- **Port**: 32400
- **Web Interface**: https://[ip]:32400/web
- **Status**: ⚠️ Not Configured
- **Purpose**: Stream movies/TV shows
- **Media Library**: 
- **Remote Access**: 
- **Users**: 
- **Notes**: 

### Media Management
- **Service**: [Sonarr/Radarr/Lidarr]
- **Version**: 
- **Host**: 
- **Ports**: 8989, 7878, 8686
- **Web Interface**: https://[ip]:[port]
- **Status**: ⚠️ Not Configured
- **Purpose**: Automated media acquisition
- **Download Client**: 
- **Indexers**: 
- **Notes**: 

### Download Client
- **Service**: [qBittorrent/Transmission/Deluge]
- **Version**: 
- **Host**: 
- **Port**: 8080
- **Web Interface**: https://[ip]:8080
- **Status**: ⚠️ Not Configured
- **Purpose**: Download management
- **Download Path**: 
- **VPN**: 
- **Notes**: 

### Music Streaming
- **Service**: [Navidrome/Subsonic/Airsonic]
- **Version**: 
- **Host**: 
- **Port**: 4533
- **Web Interface**: https://music.[domain]
- **Status**: ⚠️ Not Configured
- **Purpose**: Personal music streaming
- **Music Library**: 
- **Users**: 
- **Notes**: 

## 🏠 Home Automation

### Home Assistant
- **Service**: Home Assistant
- **Version**: 
- **Host**: 
- **Port**: 8123
- **Web Interface**: https://[ip]:8123
- **Status**: ⚠️ Not Configured
- **Purpose**: Smart home automation
- **Devices Connected**: 
- **Integrations**: 
- **Automations**: 
- **Notes**: 

### MQTT Broker
- **Service**: [Mosquitto/EMQX]
- **Version**: 
- **Host**: 
- **Port**: 1883
- **Status**: ⚠️ Not Configured
- **Purpose**: IoT device communication
- **Topics**: 
- **Connected Devices**: 
- **Notes**: 

### Zigbee Coordinator
- **Service**: [Zigbee2MQTT/ZHA]
- **Version**: 
- **Host**: 
- **Hardware**: 
- **Web Interface**: https://[ip]:8080
- **Status**: ⚠️ Not Configured
- **Purpose**: Zigbee device management
- **Connected Devices**: 
- **Notes**: 

## 📊 Monitoring & Observability

### Grafana
- **Service**: Grafana
- **Version**: 
- **Host**: 
- **Port**: 3000
- **Web Interface**: https://grafana.[domain]
- **Status**: ⚠️ Not Configured
- **Purpose**: Metrics visualization
- **Data Sources**: Prometheus, InfluxDB
- **Dashboards**: 
- **Users**: 
- **Notes**: 

### Prometheus
- **Service**: Prometheus
- **Version**: 
- **Host**: 
- **Port**: 9090
- **Web Interface**: https://[ip]:9090
- **Status**: ⚠️ Not Configured
- **Purpose**: Metrics collection
- **Targets**: 
- **Retention**: 15 days
- **Notes**: 

### Uptime Monitoring
- **Service**: [Uptime Kuma/Pingdom]
- **Version**: 
- **Host**: 
- **Port**: 3001
- **Web Interface**: https://status.[domain]
- **Status**: ⚠️ Not Configured
- **Purpose**: Service availability monitoring
- **Monitored Services**: 
- **Notifications**: 
- **Notes**: 

### Log Management
- **Service**: [Graylog/ELK Stack/Loki]
- **Version**: 
- **Host**: 
- **Port**: 9000
- **Web Interface**: https://logs.[domain]
- **Status**: ⚠️ Not Configured
- **Purpose**: Centralized logging
- **Log Sources**: 
- **Retention**: 30 days
- **Notes**: 

## 🔐 Security Services

### VPN Server
- **Service**: [WireGuard/OpenVPN]
- **Version**: 
- **Host**: 
- **Port**: 51820
- **Status**: ⚠️ Not Configured
- **Purpose**: Secure remote access
- **Clients**: 
- **Config Files**: 
- **Notes**: 

### Password Manager
- **Service**: [Vaultwarden/Bitwarden]
- **Version**: 
- **Host**: 
- **Port**: 80
- **Web Interface**: https://vault.[domain]
- **Status**: ⚠️ Not Configured
- **Purpose**: Password management
- **Users**: 
- **Organizations**: 
- **Notes**: 

### Certificate Management
- **Service**: [Let's Encrypt/Step-CA]
- **Version**: 
- **Host**: 
- **Method**: DNS Challenge
- **Status**: ⚠️ Not Configured
- **Purpose**: SSL certificate automation
- **Domains**: 
- **Renewal**: Automatic
- **Notes**: 

## 🛠️ Development Tools

### CI/CD Pipeline
- **Service**: [Jenkins/GitLab CI/GitHub Actions]
- **Version**: 
- **Host**: 
- **Port**: 8080
- **Web Interface**: https://ci.[domain]
- **Status**: ⚠️ Not Configured
- **Purpose**: Automated builds and deployments
- **Pipelines**: 
- **Agents**: 
- **Notes**: 

### Container Registry
- **Service**: [Harbor/Docker Registry]
- **Version**: 
- **Host**: 
- **Port**: 5000
- **Web Interface**: https://registry.[domain]
- **Status**: ⚠️ Not Configured
- **Purpose**: Private container images
- **Images**: 
- **Storage**: 
- **Notes**: 

### Documentation
- **Service**: [BookStack/DokuWiki/Outline]
- **Version**: 
- **Host**: 
- **Port**: 80
- **Web Interface**: https://docs.[domain]
- **Status**: ⚠️ Not Configured
- **Purpose**: Knowledge management
- **Pages**: 
- **Users**: 
- **Notes**: 

## 📈 Performance & Analytics

### Network Monitoring
- **Service**: [LibreNMS/PRTG/Zabbix]
- **Version**: 
- **Host**: 
- **Port**: 80
- **Web Interface**: https://network.[domain]
- **Status**: ⚠️ Not Configured
- **Purpose**: Network device monitoring
- **Devices**: 
- **Alerts**: 
- **Notes**: 

### Speed Test
- **Service**: [Speedtest Tracker/LibreSpeed]
- **Version**: 
- **Host**: 
- **Port**: 80
- **Web Interface**: https://speedtest.[domain]
- **Status**: ⚠️ Not Configured
- **Purpose**: Internet speed monitoring
- **Test Schedule**: Every hour
- **History**: 30 days
- **Notes**: 

## 🔄 Backup Services

### Backup Solution
- **Service**: [Duplicati/Restic/Borg]
- **Version**: 
- **Host**: 
- **Port**: 8200
- **Web Interface**: https://backup.[domain]
- **Status**: ⚠️ Not Configured
- **Purpose**: Automated backups
- **Backup Targets**: 
- **Schedule**: Daily
- **Retention**: 30 days
- **Notes**: 

### Cloud Backup
- **Service**: [Rclone/Cloud Sync]
- **Version**: 
- **Host**: 
- **Destinations**: 
- **Status**: ⚠️ Not Configured
- **Purpose**: Offsite backup
- **Schedule**: Weekly
- **Encryption**: Yes
- **Notes**: 

## 📋 Service Dependencies

```text
Internet
├── Router/Firewall
├── DNS Server
│   ├── Pi-hole
│   └── DHCP Server
├── Reverse Proxy
│   ├── SSL Certificates
│   └── All Web Services
├── Container Platform
│   ├── Portainer
│   ├── Media Services
│   ├── Monitoring Stack
│   └── Development Tools
└── Backup Services
    ├── Local Backup
    └── Cloud Backup
```

## 🔧 Service Management

### Docker Compose Files
- **Location**: `/opt/docker-compose/`
- **Backup**: Daily to NAS
- **Version Control**: Git repository
- **Documentation**: Each service documented

### Service URLs
All services are accessible via:
- **Internal**: `https://service.home.lab`
- **External**: `https://service.yourdomain.com`
- **VPN Only**: Sensitive services

### Maintenance Schedule
| Service | Check Frequency | Last Update | Next Update | Notes |
|---------|----------------|-------------|-------------|-------|
| All Services | Weekly | | | Health check |
| Container Updates | Monthly | | | Security updates |
| Backup Verification | Weekly | | | Test restores |
| SSL Certificates | Auto | | | Let's Encrypt |

## 🚨 Service Monitoring

### Health Checks
- **Uptime Kuma**: Monitor all services
- **Grafana Alerts**: Performance thresholds
- **Email Notifications**: Critical failures
- **Slack/Discord**: Non-critical alerts

### Key Metrics
- **Response Time**: <500ms for web services
- **Uptime**: >99.9% for critical services
- **Resource Usage**: <80% CPU/Memory
- **Disk Space**: <85% usage

## 🔮 Planned Services

### Next 3 Months
- [ ] **Automated Backup Verification**: Test backup integrity
- [ ] **Enhanced Monitoring**: Add more Grafana dashboards
- [ ] **Security Scanning**: Vulnerability assessment tools
- [ ] **Load Balancing**: High availability for critical services

### Next 6 Months
- [ ] **Kubernetes Migration**: Move from Docker Compose
- [ ] **Service Mesh**: Implement Istio or Linkerd
- [ ] **Disaster Recovery**: Offsite backup automation
- [ ] **Performance Optimization**: Service tuning

### Future Considerations
- [ ] **Multi-site Replication**: Backup homelab
- [ ] **Edge Computing**: Remote site services
- [ ] **ML/AI Services**: Local AI inference
- [ ] **Advanced Security**: Zero-trust networking

---

*Last Updated: [Date]*
*Service Status Dashboard: https://status.yourdomain.com*
