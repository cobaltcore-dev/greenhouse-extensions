# SCI AI Place

AI Integration Marketplace for Greenhouse.

## Features

- CRD-based discovery of AI integrations (MCP servers, LLMs, agents)
- Team-scoped RBAC via K8s SubjectAccessReview + TokenReview
- Smart LLM proxy with multi-model routing
- OCI bundle verification (Cosign + AITrustPolicy)
- Per-team token budgets and audit logging
- Greenhouse Dashboard MFE widget

## Deployment

Deploy via Greenhouse Plugin:

```yaml
apiVersion: greenhouse.sap/v1alpha1
kind: Plugin
metadata:
  name: sciai-place
spec:
  pluginDefinitionRef:
    name: sciai-place
  clusterName: s-qa-de-1
  releaseNamespace: sciai-place
  optionValues:
    - name: host
      value: "sciai-place.qa-de-1.cloud.sap"
```

## Images

- Backend: `keppel.qa-de-1.cloud.sap/cc-ia/sciai-place`
- UI: `keppel.qa-de-1.cloud.sap/cc-ia/sciai-place-ui`
- Chart: `oci://keppel.qa-de-1.cloud.sap/cc-ia/charts/sciai-place`
