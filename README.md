# Nexus Capability

This module manages **Nexus capabilities**, either several at once from the root module or one at a time with the individual submodule. See the usage snippets below and the [examples](https://github.com/nexus-module/terraform-nexus-capability/tree/main/examples).

The capabilities API requires Nexus Repository Manager 3.85.0 or later.

## Provider
You need use a [Nexus provider](https://registry.terraform.io/providers/datadrivers/nexus/latest/docs).
```hcl
provider "nexus" {
  insecure = true
  password = "admin123"
  url      = "https://127.0.0.1:8080"
  username = "admin"
}
```

## Root module usage

`nexus-capability`:

```hcl
module "nexus_capability" {
  source  = "nexus-module/capability/nexus"

  nexus_capability = [
    {
      type    = "OutreachManagementCapability"
      enabled = true
    },
    {
      key     = "firewall-audit-maven-central"
      type    = "firewall.audit"
      enabled = true
      properties = {
        repository = "maven-central"
        quarantine = "false"
      }
    }
  ]
}
```

Each item is keyed by `key`, or by `type` when `key` is not set. Set `key` whenever the same `type` appears more than once.

## Individual module usage

`nexus-capability`:

```hcl
module "nexus_capability" {
  source  = "nexus-module/capability/nexus//modules/nexus-capability"

  type    = "OutreachManagementCapability"
  enabled = true
  notes   = "Enable outreach management"
}
```

## Tests

Native tests with a mocked provider live in `tests/` and in each `modules/*/tests/`. They need Terraform >= 1.7:

```bash
terraform init -backend=false
terraform test
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_nexus"></a> [nexus](#requirement\_nexus) | >= 3.0.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
| ---- | ------ | ------- |
| <a name="module_nexus_capability"></a> [nexus\_capability](#module\_nexus\_capability) | ./modules/nexus-capability | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_nexus_capability"></a> [nexus\_capability](#input\_nexus\_capability) | List of capabilities to manage. Set key when the same type is used more than once. | <pre>list(object({<br/>    key        = optional(string)<br/>    type       = string<br/>    enabled    = optional(bool)<br/>    notes      = optional(string)<br/>    properties = optional(map(string))<br/>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_id"></a> [id](#output\_id) | Map of capability IDs, keyed by capability key. |
| <a name="output_type"></a> [type](#output\_type) | Map of capability types, keyed by capability key. |
<!-- END_TF_DOCS -->
