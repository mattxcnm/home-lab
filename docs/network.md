# 🌐 Network Topology

This document outlines the network infrastructure, IP addressing, VLANs, and security configurations.

## 📋 Network Overview

### Basic Information
- **ISP**: [Provider Name]
- **Internet Speed**: [Down/Up Mbps]
- **Public IP**: [Static/Dynamic]
- **IPv6 Support**: [Yes/No]

### Network Statistics
- **Total Devices**: TBD
- **Total Subnets**: TBD
- **Total VLANs**: TBD
- **WiFi Networks**: TBD

## 🏗️ Physical Topology

```text
Internet (ISP)
     │
     │ [Public IP]
     │
┌────▼────┐
│ Modem/  │
│ Router  │
│         │
└────┬────┘
     │ [LAN IP Range]
     │
┌────▼────┐
│  Main   │
│ Switch  │
│         │
└─┬─┬─┬─┬─┘
  │ │ │ │
  │ │ │ └── Server Rack
  │ │ └──── WiFi AP
  │ └────── Desktop/Workstation
  └──────── Other Devices
```

## 📡 Wireless Networks

| SSID | Band | Security | VLAN | Purpose | Password |
|------|------|----------|------|---------|----------|
| HomeNet-Main | 2.4/5GHz | WPA3 | 10 | Main devices | [Hidden] |
| HomeNet-Guest | 2.4/5GHz | WPA3 | 20 | Guest access | [Hidden] |
| HomeNet-IoT | 2.4GHz | WPA2 | 30 | IoT devices | [Hidden] |
| HomeNet-Lab | 5GHz | WPA3 | 40 | Lab/Testing | [Hidden] |

## 🔢 IP Addressing Scheme

### Subnets Overview
| VLAN | Subnet | Range | Purpose | Gateway | DHCP |
|------|--------|-------|---------|---------|------|
| 10 | 192.168.10.0/24 | .1-.254 | Main Network | .1 | .100-.200 |
| 20 | 192.168.20.0/24 | .1-.254 | Guest Network | .1 | .100-.200 |
| 30 | 192.168.30.0/24 | .1-.254 | IoT Devices | .1 | .100-.200 |
| 40 | 192.168.40.0/24 | .1-.254 | Lab/Testing | .1 | .100-.200 |
| 50 | 192.168.50.0/24 | .1-.254 | Servers | .1 | Static Only |
| 60 | 192.168.60.0/24 | .1-.254 | Management | .1 | .10-.50 |

### Static IP Assignments
| Device | IP Address | MAC Address | Purpose | Notes |
|--------|------------|-------------|---------|-------|
| Router | 192.168.1.1 | [MAC] | Gateway | |
| Switch Management | 192.168.60.10 | [MAC] | Switch Config | |
| Server 1 | 192.168.50.10 | [MAC] | Primary Server | |
| Server 2 | 192.168.50.11 | [MAC] | Secondary Server | |
| NAS | 192.168.50.20 | [MAC] | Network Storage | |
| UPS | 192.168.60.30 | [MAC] | Power Management | |

## 🔒 VLANs Configuration

### VLAN 10 - Main Network
- **Purpose**: Primary user devices (laptops, phones, tablets)
- **Security**: Standard firewall rules
- **Internet Access**: Full
- **Inter-VLAN**: Limited access to servers
- **Devices**: Trusted personal devices

### VLAN 20 - Guest Network
- **Purpose**: Guest device access
- **Security**: Isolated from other networks
- **Internet Access**: Rate limited
- **Inter-VLAN**: No access to internal networks
- **Devices**: Visitor devices

### VLAN 30 - IoT Network
- **Purpose**: Internet of Things devices
- **Security**: Restricted internet access
- **Internet Access**: Limited to required services
- **Inter-VLAN**: No access to other networks
- **Devices**: Smart home devices, cameras, etc.

### VLAN 40 - Lab Network
- **Purpose**: Testing and development
- **Security**: Isolated sandbox environment
- **Internet Access**: Controlled
- **Inter-VLAN**: No production access
- **Devices**: Test VMs, development hardware

### VLAN 50 - Server Network
- **Purpose**: Production servers and services
- **Security**: Strict firewall rules
- **Internet Access**: Outbound only as needed
- **Inter-VLAN**: Controlled access from main network
- **Devices**: Servers, NAS, production VMs

### VLAN 60 - Management Network
- **Purpose**: Device management interfaces
- **Security**: Admin access only
- **Internet Access**: Limited
- **Inter-VLAN**: Admin access to all networks
- **Devices**: BMC, switch management, UPS, etc.

## 🔥 Firewall Rules

### General Policies
- **Default**: Deny all traffic between VLANs
- **Logging**: All blocked traffic logged
- **Updates**: Allow automatic security updates
- **DNS**: All networks use internal DNS with filtering

### Inter-VLAN Access Rules
| Source VLAN | Destination VLAN | Protocol | Port | Action | Purpose |
|-------------|------------------|----------|------|--------|---------|
| 10 (Main) | 50 (Servers) | TCP | 80,443 | Allow | Web services |
| 10 (Main) | 50 (Servers) | TCP | 22 | Allow | SSH access |
| 60 (Mgmt) | ALL | ALL | ALL | Allow | Management access |
| 30 (IoT) | ANY | ANY | ANY | Deny | Isolation |
| 20 (Guest) | 10,50,60 | ANY | ANY | Deny | Guest isolation |

### Port Forwarding
| External Port | Internal IP | Internal Port | Protocol | Service | Notes |
|---------------|-------------|---------------|----------|---------|-------|
| 22 | 192.168.50.10 | 22 | TCP | SSH | VPN only |
| 443 | 192.168.50.10 | 443 | TCP | Web Server | Public |
| 51820 | 192.168.50.10 | 51820 | UDP | WireGuard VPN | |

## 🔐 VPN Configuration

### WireGuard Server
- **Server IP**: 192.168.50.10
- **VPN Subnet**: 10.0.0.0/24
- **Port**: 51820
- **Clients**: 10 maximum
- **DNS**: 192.168.1.1, 1.1.1.1

### VPN Client Access
| Client | VPN IP | Real Name | Allowed IPs | Notes |
|--------|--------|-----------|-------------|-------|
| Client 1 | 10.0.0.2 | Personal Phone | Main, Servers | |
| Client 2 | 10.0.0.3 | Laptop | Main, Servers | |
| Client 3 | 10.0.0.4 | Work Device | Limited | |

## 📊 Network Monitoring

### Monitoring Tools
- **SNMP**: Enabled on managed devices
- **Flow Monitoring**: NetFlow/sFlow enabled
- **Uptime Monitoring**: Ping monitoring for critical devices
- **Bandwidth Monitoring**: Per-VLAN tracking

### Critical Monitoring Points
- **Internet Gateway**: Latency and throughput
- **Main Switch**: Port utilization and errors
- **WiFi Performance**: Signal strength and throughput
- **DNS Resolution**: Response times and failures

## 🔧 DNS Configuration

### Internal DNS Server
- **Primary DNS**: 192.168.1.1 (Router)
- **Secondary DNS**: 192.168.50.10 (Pi-hole)
- **Backup DNS**: 1.1.1.1, 8.8.8.8

### Internal Domain
- **Domain**: home.lab
- **Records**:
  - server1.home.lab → 192.168.50.10
  - nas.home.lab → 192.168.50.20
  - router.home.lab → 192.168.1.1

### DNS Filtering
- **Ad Blocking**: Pi-hole enabled
- **Malware Protection**: Enabled
- **Adult Content**: [Enabled/Disabled]
- **Custom Block Lists**: [List sources]

## 📈 Performance Metrics

### Bandwidth Utilization
- **Peak Usage**: [Time] - [Mbps]
- **Average Daily**: [Mbps]
- **Per-VLAN Usage**: [Breakdown]

### Latency Measurements
- **Internal Latency**: <1ms
- **Internet Latency**: [ms to major sites]
- **VPN Latency**: [ms overhead]

## 🔄 Network Backup & Recovery

### Configuration Backups
- **Router Config**: Daily backup to NAS
- **Switch Config**: Weekly backup
- **DNS Records**: Version controlled
- **Firewall Rules**: Documented and backed up

### Recovery Procedures
1. **Internet Outage**: [Procedure]
2. **Router Failure**: [Replacement steps]
3. **Switch Failure**: [Fallback configuration]
4. **Power Outage**: [UPS runtime and shutdown]

## 📋 Maintenance Schedule

| Task | Frequency | Last Done | Next Due | Notes |
|------|-----------|-----------|----------|-------|
| Firmware Updates | Monthly | | | |
| Config Backup | Weekly | | | |
| Performance Review | Monthly | | | |
| Security Audit | Quarterly | | | |
| Cable Management | Annually | | | |

## 🔮 Future Network Plans

### Short Term (Next 6 months)
- [ ] Upgrade to WiFi 6E access points
- [ ] Implement network segmentation monitoring
- [ ] Add redundant internet connection

### Medium Term (6-12 months)
- [ ] 10GbE backbone between servers
- [ ] Dedicated security appliance
- [ ] Professional cable management

### Long Term (1+ years)
- [ ] Full 10GbE network infrastructure
- [ ] Fiber internet upgrade
- [ ] Network automation with Ansible

## 🚨 Troubleshooting Guide

### Common Issues
1. **Slow Internet**: Check bandwidth usage, restart modem
2. **WiFi Dropouts**: Check interference, update drivers
3. **Cannot Access Servers**: Verify VLAN/firewall rules
4. **VPN Issues**: Check port forwarding and certificates

### Network Tools
- **Speed Test**: [Tool/Command]
- **Port Scanner**: nmap
- **WiFi Analyzer**: [App/Tool]
- **Packet Capture**: Wireshark

---

*Last Updated: [Date]*
*Network Diagram: See attached network-diagram.png*
