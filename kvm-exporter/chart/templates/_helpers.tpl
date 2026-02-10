# SPDX-FileCopyrightText: 2025 SAP SE or an SAP affiliate company and cobaltcore-dev contributors
# SPDX-License-Identifier: Apache-2.0

{{/* vim: set filetype=mustache: */}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
The components in this chart create additional resources that expand the longest created name strings.
The longest name that gets created adds and extra 37 characters, so truncation should be 63-35=26.
*/}}
{{- define "kvm-exporter.fullname" -}}
{{- printf "%s" $.Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Generate basic labels */}}
{{- define "kvm-operations.labels" -}}
{{- $root := index . 1 -}}
app.cloud-storage.io/version: {{ $root.Chart.Version }}
app.cloud-storage.io/part-of: {{ $root.Release.Name }}
{{- with $root.Values.global.commonLabels }}
{{ toYaml . }}
{{- end }}
{{- end -}}

{{- define "kvm-operations.additionalRuleLabels" -}}
{{- with .Values.prometheusRules.additionalRuleLabels }}
{{ toYaml . }}
{{- end }}
{{- end -}}

{{- define "kvm-operations.ruleSelectorLabels" -}}
{{- $root := index . 1 -}}
{{- with $root.Values.prometheusRules.ruleSelectors }}
{{- range $i, $target := . }}
{{ $target.name | required (printf "$.Values.prometheusRules.ruleSelectors[%v].name missing" $i) }}: {{ tpl ($target.value | required (printf "$.Values.prometheusRules.ruleSelectors[%v].value missing" $i)) $root }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "kvm-operations.dashboardSelectorLabels" -}}
{{- $root := index . 1 -}}
{{- with $root.Values.dashboards.dashboardSelectors }}
{{- range $i, $target := . }}
{{ $target.name | required (printf "$.Values.dashboards.dashboardSelectors[%v].name missing" $i) }}: {{ tpl ($target.value | required (printf "$.Values.dashboards.dashboardSelectors[%v].value missing" $i)) $root }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "kvm-operations.globalDashboardSelectorLabels" -}}
{{- $root := index . 1 -}}
{{- with $root.Values.dashboards.global.dashboardSelectors }}
{{- range $i, $target := . }}
{{ $target.name | required (printf "$.Values.dashboards.global.dashboardSelectors[%v].name missing" $i) }}: {{ tpl ($target.value | required (printf "$.Values.dashboards.global.dashboardSelectors[%v].value missing" $i)) $root }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "kvm-operations.persesGlobalDashboardSelectorLabels" -}}
{{- $root := index . 1 -}}
{{- with $root.Values.dashboards.global.persesDashboardSelectors }}
{{- range $i, $target := . }}
{{ $target.name | required (printf "$.Values.dashboards.global.persesDashboardSelectors[%v].name missing" $i) }}: {{ tpl ($target.value | required (printf "$.Values.dashboards.global.persesDashboardSelectors[%v].value missing" $i)) $root }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "kvm-operations.persesDashboardSelectorLabels" -}}
{{- $root := index . 1 -}}
{{- with $root.Values.persesDashboards.dashboardSelectors }}
{{- range $i, $target := . }}
{{ $target.name | required (printf "$.Values.persesDashboards.dashboardSelectors[%v].name missing" $i) }}: {{ tpl ($target.value | required (printf "$.Values.persesDashboards.dashboardSelectors[%v].value missing" $i)) $root }}
{{- end }}
{{- end }}
{{- end -}}
