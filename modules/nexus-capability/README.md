<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_nexus"></a> [nexus](#requirement\_nexus) | >= 3.0.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_nexus"></a> [nexus](#provider\_nexus) | >= 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [nexus_capability.main](https://registry.terraform.io/providers/datadrivers/nexus/latest/docs/resources/capability) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether the capability is enabled. | `bool` | `null` | no |
| <a name="input_notes"></a> [notes](#input\_notes) | Free-form notes about the capability. | `string` | `null` | no |
| <a name="input_properties"></a> [properties](#input\_properties) | Type-specific configuration properties. | `map(string)` | `null` | no |
| <a name="input_type"></a> [type](#input\_type) | The type of capability, e.g. OutreachManagementCapability or firewall.audit. | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_id"></a> [id](#output\_id) | The ID of the capability. |
| <a name="output_type"></a> [type](#output\_type) | The type of the capability. |
<!-- END_TF_DOCS -->
