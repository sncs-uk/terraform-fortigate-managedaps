<!-- BEGIN_TF_DOCS -->
# Fortigate Managed AP configuration module

This terraform module configures managed APs on a FortiGate firewall

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.11.0 |
| <a name="requirement_fortios"></a> [fortios](#requirement\_fortios) | >= 1.22.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_fortios"></a> [fortios](#provider\_fortios) | >= 1.22.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [fortios_wirelesscontroller_wtp.ap](https://registry.terraform.io/providers/fortinetdev/fortios/latest/docs/resources/wirelesscontroller_wtp) | resource |
| [fortios_wirelesscontroller_wtpgroup.groups](https://registry.terraform.io/providers/fortinetdev/fortios/latest/docs/resources/wirelesscontroller_wtpgroup) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config_path"></a> [config\_path](#input\_config\_path) | Path to base configuration directory | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->