---
title: KVM Redfish Exporter
---
<!--
# SPDX-FileCopyrightText: Copyright 2026 cobaltcore-dev contributors
#
# SPDX-License-Identifier: Apache-2.0
-->

This Plugin provides the [KVM Redfish Exporter](https://github.com/cobaltcore-dev/kvm-redfish-exporter) — a Prometheus exporter for Redfish/BMC hardware monitoring.

## Features

- **Multi-target proxy pattern** — stateless, one BMC per request (like blackbox-exporter)
- **7 collector endpoints**: `/health`, `/performance`, `/sensors`, `/firmware`, `/bios`, `/drives`, `/memory`
- **21 metric types**: power state, health, temperature, fans, PSU, memory ECC, NVMe SMART, BIOS settings, firmware versions, Redfish sensors
- **Dell iDRAC + HPE iLO support** — basic auth with session auth fallback
- **K8s auto-discovery** via ScrapeConfig with `kubernetes_sd_config`
- **Security**: SSRF prevention, response size limits, path validation, session cleanup

## Metrics

| Metric | Description |
|--------|-------------|
| `kvm_redfish_up` | BMC reachability |
| `kvm_redfish_power_state` | Server power state (1=On, 0=Off) |
| `kvm_redfish_server_health` | Overall server health |
| `kvm_redfish_health` | Per-component health (processor, storage, disk, memory) |
| `kvm_redfish_temperature_celsius` | Temperature sensors |
| `kvm_redfish_fan_health` | Fan health status |
| `kvm_redfish_fan_speed_rpm` | Fan speed |
| `kvm_redfish_psu_health` | Power supply health |
| `kvm_redfish_power_consumed_watts` | Power consumption |
| `kvm_redfish_memory_correctable_errors` | DIMM correctable ECC errors |
| `kvm_redfish_memory_uncorrectable_errors` | DIMM uncorrectable ECC errors |
| `kvm_redfish_sensor_value` | Redfish Sensors API readings |
| `kvm_redfish_firmware_info` | BIOS and BMC firmware versions |
| `kvm_redfish_bios` | BIOS settings |
| `kvm_redfish_drive_health` | NVMe/drive health |
| `kvm_redfish_drive_predicted_life_left_percent` | NVMe SMART predicted life |
| `kvm_redfish_drive_failure_predicted` | NVMe failure prediction |
| `kvm_redfish_drive_capacity_bytes` | Drive capacity |
