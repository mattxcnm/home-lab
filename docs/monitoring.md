# 📊 Monitoring & Observability

Comprehensive monitoring setup for infrastructure health, performance metrics, and alerting.

## 🎯 Monitoring Overview

| Component | Status | Last Check | Response Time | Uptime |
|-----------|--------|------------|---------------|---------|
| Core Infrastructure | ⚠️ | - | - | - |
| Network Equipment | ⚠️ | - | - | - |
| Servers & VMs | ⚠️ | - | - | - |
| Services & Applications | ⚠️ | - | - | - |
| Storage Systems | ⚠️ | - | - | - |

## 📈 Monitoring Stack

### Grafana (Visualization)
- **Version**: Latest
- **URL**: https://grafana.home.lab
- **Port**: 3000
- **Status**: ⚠️ Not Configured
- **Purpose**: Metrics visualization and dashboards
- **Data Sources**: Prometheus, InfluxDB, Loki
- **Dashboards**: TBD
- **Users**: admin
- **Retention**: Unlimited (stored in data sources)

### Prometheus (Metrics Collection)
- **Version**: Latest
- **URL**: https://prometheus.home.lab
- **Port**: 9090
- **Status**: ⚠️ Not Configured
- **Purpose**: Time-series metrics collection
- **Scrape Interval**: 15s
- **Retention**: 15 days
- **Storage**: 50GB allocated
- **Targets**: All monitored services

### Loki (Log Aggregation)
- **Version**: Latest
- **URL**: https://loki.home.lab
- **Port**: 3100
- **Status**: ⚠️ Not Configured
- **Purpose**: Log aggregation and querying
- **Retention**: 7 days
- **Storage**: 100GB allocated
- **Log Sources**: All containers and systems

### AlertManager (Alerting)
- **Version**: Latest
- **URL**: https://alerts.home.lab
- **Port**: 9093
- **Status**: ⚠️ Not Configured
- **Purpose**: Alert routing and notifications
- **Notification Channels**: Email, Slack, Discord
- **Alert Rules**: Critical, Warning, Info levels

## 🖥️ Infrastructure Monitoring

### Server Metrics
- **Node Exporter**: System metrics (CPU, Memory, Disk, Network)
- **Process Exporter**: Process-level monitoring
- **Hardware Monitoring**: Temperature, fans, power consumption
- **SMART Monitoring**: Disk health and failure prediction

#### Key Metrics Tracked
- CPU Usage (per core and aggregate)
- Memory Usage (RAM and swap)
- Disk Usage (space and I/O)
- Network Traffic (bandwidth and errors)
- System Load (1m, 5m, 15m averages)
- Temperature Sensors
- Power Consumption

### Network Monitoring
- **SNMP Exporter**: Switch and router metrics
- **Ping Exporter**: Connectivity monitoring
- **Speedtest Exporter**: Internet speed tracking
- **DNS Monitoring**: Query response times

#### Network Metrics
- Interface utilization and errors
- Latency to critical endpoints
- Internet speed (up/down)
- DNS resolution times
- DHCP pool utilization
- WiFi signal strength and client count

### Storage Monitoring
- **ZFS/BTRFS Monitoring**: Pool health and performance
- **SMART Data**: Drive health metrics
- **I/O Performance**: Read/write speeds and latency
- **Capacity Planning**: Growth trends and predictions

## 🐳 Container Monitoring

### Docker Metrics
- **cAdvisor**: Container resource usage
- **Docker Exporter**: Docker daemon metrics
- **Container Logs**: Centralized log collection

#### Container Metrics
- CPU and memory usage per container
- Network I/O per container
- Container restart events
- Image vulnerabilities
- Container health checks

### Application Monitoring
- **Custom Metrics**: Application-specific metrics
- **Health Checks**: HTTP endpoint monitoring
- **Performance Metrics**: Response times and throughput
- **Error Tracking**: Application errors and exceptions

## 🌐 Service Monitoring

### HTTP/HTTPS Monitoring
- **Blackbox Exporter**: External service monitoring
- **SSL Certificate Monitoring**: Expiration tracking
- **Response Time Monitoring**: Performance tracking
- **Content Verification**: Expected content checks

#### Services Monitored
| Service | URL | Check Interval | Timeout | Expected Status |
|---------|-----|----------------|---------|-----------------|
| Grafana | https://grafana.home.lab | 30s | 5s | 200 |
| Plex | https://plex.home.lab | 30s | 5s | 200 |
| Home Assistant | https://ha.home.lab | 30s | 5s | 200 |
| Pi-hole | https://pihole.home.lab | 30s | 5s | 200 |

### Database Monitoring
- **MySQL Exporter**: Database performance metrics
- **PostgreSQL Exporter**: Database health and performance
- **Redis Exporter**: Cache performance metrics

## 📱 Uptime Monitoring

### Uptime Kuma
- **URL**: https://status.home.lab
- **Port**: 3001
- **Status**: ⚠️ Not Configured
- **Purpose**: Simple uptime monitoring with status page
- **Notification Channels**: Email, Slack, Discord, Webhook
- **Check Types**: HTTP, TCP, Ping, DNS, Push

#### Monitored Endpoints
- Internal services (every 60s)
- External services (every 300s)
- Network infrastructure (every 30s)
- Critical alerts (<99% uptime)

### Status Page
- **Public URL**: https://status.yourdomain.com
- **Internal URL**: https://status.home.lab
- **Incident Management**: Manual incident creation
- **Maintenance Windows**: Scheduled downtime notifications
- **Subscribe Options**: Email, RSS, Webhook

## 🚨 Alerting & Notifications

### Alert Rules
```yaml
# CPU Usage Alert
- alert: HighCPUUsage
  expr: 100 - (avg by (instance) (irate(node_cpu_seconds_total{mode="idle"}[5m])) * 100) > 80
  for: 5m
  labels:
    severity: warning
  annotations:
    summary: "High CPU usage on {{ $labels.instance }}"

# Memory Usage Alert
- alert: HighMemoryUsage
  expr: (1 - (node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes)) * 100 > 90
  for: 2m
  labels:
    severity: critical
  annotations:
    summary: "High memory usage on {{ $labels.instance }}"

# Disk Space Alert
- alert: LowDiskSpace
  expr: (1 - (node_filesystem_avail_bytes / node_filesystem_size_bytes)) * 100 > 85
  for: 1m
  labels:
    severity: warning
  annotations:
    summary: "Low disk space on {{ $labels.instance }}"

# Service Down Alert
- alert: ServiceDown
  expr: up == 0
  for: 1m
  labels:
    severity: critical
  annotations:
    summary: "Service {{ $labels.job }} is down"
```

### Notification Channels

#### Email Notifications
- **SMTP Server**: [Your SMTP settings]
- **Recipients**: admin@yourdomain.com
- **Alert Levels**: Critical, Warning
- **Rate Limiting**: Max 1 email per 5 minutes per alert

#### Slack Integration
- **Webhook URL**: [Hidden]
- **Channel**: #homelab-alerts
- **Alert Levels**: All levels
- **Rich Formatting**: Yes

#### Discord Integration
- **Webhook URL**: [Hidden]
- **Channel**: #alerts
- **Alert Levels**: Critical only
- **Mentions**: @admin for critical alerts

#### Mobile Push Notifications
- **Service**: [Pushover/Gotify]
- **API Key**: [Hidden]
- **Alert Levels**: Critical only
- **Emergency Override**: Yes

## 📊 Dashboards

### Infrastructure Dashboard
- **Purpose**: Overall infrastructure health
- **Panels**: CPU, Memory, Disk, Network for all servers
- **Time Range**: Last 24 hours (configurable)
- **Refresh**: 30 seconds
- **Alerts**: Integrated alert status

### Network Dashboard
- **Purpose**: Network performance and health
- **Panels**: Bandwidth, latency, device status
- **Time Range**: Last 6 hours
- **Refresh**: 1 minute
- **SNMP Data**: Switch and router metrics

### Application Dashboard
- **Purpose**: Service-specific monitoring
- **Panels**: Response times, error rates, throughput
- **Time Range**: Last 4 hours
- **Refresh**: 15 seconds
- **Custom Metrics**: Application-specific data

### Security Dashboard
- **Purpose**: Security monitoring and events
- **Panels**: Failed logins, firewall blocks, SSL certificates
- **Time Range**: Last 24 hours
- **Refresh**: 5 minutes
- **Log Analysis**: Security event correlation

## 🔍 Log Management

### Log Sources
- **System Logs**: Syslog from all servers
- **Container Logs**: Docker container output
- **Application Logs**: Custom application logging
- **Security Logs**: Authentication and firewall logs
- **Network Logs**: Router and switch logs

### Log Retention Policy
- **Critical Logs**: 90 days
- **Error Logs**: 30 days
- **Warning Logs**: 14 days
- **Info Logs**: 7 days
- **Debug Logs**: 1 day

### Log Analysis
- **Search**: Full-text search across all logs
- **Filtering**: By timestamp, source, level, content
- **Alerting**: Log-based alerts for error patterns
- **Dashboards**: Log volume and error rate trends

## 📈 Performance Baselines

### Server Performance
- **CPU**: Baseline 15% average, 50% peak
- **Memory**: Baseline 60% usage, 80% peak
- **Disk I/O**: Baseline 100 IOPS, 1000 IOPS peak
- **Network**: Baseline 10 Mbps, 100 Mbps peak

### Service Performance
- **Response Time**: <200ms for web services
- **Throughput**: 100 requests/second minimum
- **Error Rate**: <1% for all services
- **Availability**: 99.9% uptime target

### Network Performance
- **Internet Speed**: 90% of ISP advertised speed
- **Internal Latency**: <1ms within LAN
- **WiFi Performance**: 80% of maximum speed
- **DNS Resolution**: <50ms average response

## 🔧 Monitoring Maintenance

### Regular Tasks
- **Weekly**: Review alert thresholds and tune as needed
- **Monthly**: Clean up old metrics and logs
- **Quarterly**: Review and update dashboards
- **Annually**: Archive historical data and plan capacity

### Backup & Recovery
- **Configuration Backup**: Daily backup of all configs
- **Metrics Backup**: Weekly backup to offsite storage
- **Dashboard Export**: Version controlled in Git
- **Recovery Testing**: Monthly recovery drills

### Performance Tuning
- **Query Optimization**: Regular review of slow queries
- **Storage Optimization**: Monitor disk usage and cleanup
- **Memory Tuning**: Adjust retention and buffer sizes
- **Network Optimization**: Monitor bandwidth usage

## 🎯 Monitoring Roadmap

### Phase 1 (Current)
- [x] Basic infrastructure monitoring
- [ ] Core service monitoring
- [ ] Essential alerting setup
- [ ] Basic dashboards

### Phase 2 (Next 3 months)
- [ ] Advanced application monitoring
- [ ] Log aggregation and analysis
- [ ] Custom metrics collection
- [ ] Enhanced alerting rules

### Phase 3 (Next 6 months)
- [ ] Predictive monitoring and alerting
- [ ] Automated remediation
- [ ] Advanced security monitoring
- [ ] Performance optimization tools

### Phase 4 (Future)
- [ ] Machine learning for anomaly detection
- [ ] Distributed tracing
- [ ] Advanced capacity planning
- [ ] Full observability stack

## 📋 Monitoring Checklist

### Daily Checks
- [ ] Review overnight alerts
- [ ] Check service availability
- [ ] Verify backup completion
- [ ] Monitor critical thresholds

### Weekly Checks
- [ ] Review performance trends
- [ ] Update alert thresholds
- [ ] Check disk space usage
- [ ] Verify monitoring coverage

### Monthly Checks
- [ ] Review and update dashboards
- [ ] Analyze performance baselines
- [ ] Test alert notifications
- [ ] Update monitoring documentation

---

*Last Updated: [Date]*
*Monitoring Status: https://status.home.lab*
