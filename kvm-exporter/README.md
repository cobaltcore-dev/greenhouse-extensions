<!--
SPDX-FileCopyrightText: 2025 SAP SE or an SAP affiliate company and cobaltcore-dev contributors
SPDX-License-Identifier: Apache-2.0
-->

---
title: KVM Exporter Plugin
---

Learn more about the **kvm-exporter** plugin. Use it to activate KVM metric exporting.

The main terminologies used in this document can be found in [core-concepts](https://cloudoperators.github.io/greenhouse/docs/getting-started/core-concepts).

## Dependencies

This plugin depends on the [kube-monitoring Greenhouse plugin](https://github.com/cloudoperators/greenhouse-extensions/tree/main/kube-monitoring). This plugin deploys a kube-monitoring stack and automatically ingests the exported metrics.

## Contributing

Contribution is highly appreciated. If you discover bugs or want to add functionality to the plugin, then pull requests are always welcome.

## Quick start

This guide provides a quick and straightforward way to use **kvm-exporter** as a Greenhouse Plugin on your Kubernetes cluster.

**Prerequisites**

- A running and Greenhouse-onboarded Kubernetes cluster. If you don't have one, follow the [Cluster onboarding](https://cloudoperators.github.io/greenhouse/docs/user-guides/cluster/onboarding) guide.

**Step 0:**

Install the kube-monitoring plugin in your cluster. You can find the installation guide [here](https://github.com/cloudoperators/greenhouse-extensions/blob/main/kube-monitoring/README.md).

**Step 1:**

You can install the `kvm-exporter` package in your cluster by installing it with [Helm](https://helm.sh/docs/helm/helm_install) manually:

```bash
helm install kvm-exporter .
```

**Step 2:**

After installation, the kvm-exporter stack will take up the exported metrics and you will be able to query them through the kvm-exporter prometheus.

## Configuration

| Name | Description | Example Value |
| ---- | ----------- | ----- |
| `serviceMonitorLabels` | Custom service monitor labels so that the prometheus instance sees the service monitor. | `[]` |

## Examples

```yaml
apiVersion: greenhouse.sap/v1alpha1
kind: Plugin
metadata:
  name: kvm-exporter
spec:
  pluginDefinition: kvm-exporter
  disabled: false
  optionValues:
    - key: serviceMonitorLabels
      value:
        # Kube-monitoring plugin release name in the Greenhouse cluster.
        # This value is needed so that the kube-monitoring plugin scrapes our pods.
        # Needs to conform to kube-monitorings service monitor filter.
        - key: plugin
          value: kube-monitoring-<region>
```