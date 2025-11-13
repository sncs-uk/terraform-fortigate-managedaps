/**
 * # Fortigate Managed AP configuration module
 *
 * This terraform module configures managed APs on a FortiGate firewall
 */
terraform {
  required_providers {
    fortios = {
      source  = "fortinetdev/fortios"
    }
  }
}
locals {
  wireless_yaml  = fileexists("${var.config_path}/managed-wireless.yaml") ? yamldecode(file("${var.config_path}/managed-wireless.yaml")) : object({})
}

resource fortios_wirelesscontroller_wtp ap {
  for_each                              = { for name, ap in try(local.wireless_yaml.aps, []) : name => ap}
  wtp_id                                = try(each.value.sn, null)
  admin                                 = try(each.value.admin, null)
  name                                  = each.key
  location                              = try(each.value.location, null)
  comment                               = try(each.value.comment, null)
  region                                = try(each.value.region, null)
  region_x                              = try(each.value.region_x, null)
  region_y                              = try(each.value.region_y, null)
  firmware_provision                    = try(each.value.firmware_provision, null)
  firmware_provision_latest             = try(each.value.firmware_provision_latest, null)
  wtp_profile                           = try(each.value.wtp_profile, null)
  wtp_mode                              = try(each.value.wtp_mode, null)
  apcfg_profile                         = try(each.value.apcfg_profile, null)
  bonjour_profile                       = try(each.value.bonjour_profile, null)
  ble_major_id                          = try(each.value.ble_major_id, null)
  ble_minor_id                          = try(each.value.ble_minor_id, null)
  override_led_state                    = try(each.value.override_led_state, null)
  led_state                             = try(each.value.led_state, null)
  override_wan_port_mode                = try(each.value.override_wan_port_mode, null)
  wan_port_mode                         = try(each.value.wan_port_mode, null)
  override_ip_fragment                  = try(each.value.override_ip_fragment, null)
  ip_fragment_preventing                = try(each.value.ip_fragment_preventing, null)
  tun_mtu_uplink                        = try(each.value.tun_mtu_uplink, null)
  tun_mtu_downlink                      = try(each.value.tun_mtu_downlink, null)
  override_split_tunnel                 = try(each.value.override_split_tunnel, null)
  split_tunneling_acl_path              = try(each.value.split_tunneling_acl_path, null)
  split_tunneling_acl_local_ap_subnet   = try(each.value.split_tunneling_acl_local_ap_subnet, null)
  override_lan                          = try(each.value.override_lan, null)
  override_allowaccess                  = try(each.value.override_allowaccess, null)
  allowaccess                           = try(each.value.allowaccess, null)
  override_login_passwd_change          = try(each.value.override_login_passwd_change, null)
  login_passwd_change                   = try(each.value.login_passwd_change, null)
  login_passwd                          = try(each.value.login_passwd, null)
  override_default_mesh_root            = try(each.value.override_default_mesh_root, null)
  default_mesh_root                     = try(each.value.default_mesh_root, null)
  image_download                        = try(each.value.image_download, null)
  mesh_bridge_enable                    = try(each.value.mesh_bridge_enable, null)
  purdue_level                          = try(each.value.purdue_level, null)
  coordinate_latitude                   = try(each.value.coordinate_latitude, null)
  coordinate_longitude                  = try(each.value.coordinate_longitude, null)

  dynamic split_tunneling_acl {
    for_each    = { for ip in try(each.value.split_tunneling_acl, []) : ip => ip}
    content {
      id        = index(each.value.split_tunneling_acl, split_tunneling_acl.value)
      dest_ip   = split_tunneling_acl.value
    }
  }

  lan {
    port_mode       = try(each.value.lan.port_mode, null)
    port_ssid       = try(each.value.lan.port_ssid, null)
    port1_mode      = try(each.value.lan.port1_mode, null)
    port1_ssid      = try(each.value.lan.port1_ssid, null)
    port2_mode      = try(each.value.lan.port2_mode, null)
    port2_ssid      = try(each.value.lan.port2_ssid, null)
    port3_mode      = try(each.value.lan.port3_mode, null)
    port3_ssid      = try(each.value.lan.port3_ssid, null)
    port4_mode      = try(each.value.lan.port4_mode, null)
    port4_ssid      = try(each.value.lan.port4_ssid, null)
    port5_mode      = try(each.value.lan.port5_mode, null)
    port5_ssid      = try(each.value.lan.port5_ssid, null)
    port6_mode      = try(each.value.lan.port6_mode, null)
    port6_ssid      = try(each.value.lan.port6_ssid, null)
    port7_mode      = try(each.value.lan.port7_mode, null)
    port7_ssid      = try(each.value.lan.port7_ssid, null)
    port8_mode      = try(each.value.lan.port8_mode, null)
    port8_ssid      = try(each.value.lan.port8_ssid, null)
    port_esl_mode   = try(each.value.lan.port_esl_mode, null)
    port_esl_ssid   = try(each.value.lan.port_esl_ssid, null)
  }

  dynamic radio_1 {
    for_each                        = { for a in (try(each.value.radios.1, []) == [] ? [] : ["1"]) : a => a}
    content {
      radio_id            = try(each.value.radios.1.radio_id, null)
      override_band       = try(each.value.radios.1.override_band, null)
      band                = try(each.value.radios.1.band, null)
      override_analysis   = try(each.value.radios.1.override_analysis, null)
      spectrum_analysis   = try(each.value.radios.1.spectrum_analysis, null)
      override_txpower    = try(each.value.radios.1.override_txpower, null)
      auto_power_level    = try(each.value.radios.1.auto_power_level, null)
      auto_power_high     = try(each.value.radios.1.auto_power_high, null)
      auto_power_low      = try(each.value.radios.1.auto_power_low, null)
      auto_power_target   = try(each.value.radios.1.auto_power_target, null)
      power_mode          = try(each.value.radios.1.power_mode, null)
      power_level         = try(each.value.radios.1.power_level, null)
      power_value         = try(each.value.radios.1.power_value, null)
      override_vaps       = try(each.value.radios.1.override_vaps, null)
      vap_all             = try(each.value.radios.1.vap_all, null)
      override_channel    = try(each.value.radios.1.override_channel, null)
      drma_manual_mode    = try(each.value.radios.1.drma_manual_mode, null)

      dynamic vaps {
        for_each  = { for vap in try(each.value.radios.1.vaps, []) : vap => vap }
        content {
          name    = vaps.value
        }
      }

      dynamic channel {
        for_each  = { for channel in try(each.value.radios.1.channels, []) : channel => channel }
        content {
          chan    = channel.value
        }
      }
    }
  }
  dynamic radio_2 {
    for_each                        = { for a in (try(each.value.radios.2, []) == [] ? [] : ["1"]) : a => a}
    content {
      radio_id            = try(each.value.radios.2.radio_id, null)
      override_band       = try(each.value.radios.2.override_band, null)
      band                = try(each.value.radios.2.band, null)
      override_analysis   = try(each.value.radios.2.override_analysis, null)
      spectrum_analysis   = try(each.value.radios.2.spectrum_analysis, null)
      override_txpower    = try(each.value.radios.2.override_txpower, null)
      auto_power_level    = try(each.value.radios.2.auto_power_level, null)
      auto_power_high     = try(each.value.radios.2.auto_power_high, null)
      auto_power_low      = try(each.value.radios.2.auto_power_low, null)
      auto_power_target   = try(each.value.radios.2.auto_power_target, null)
      power_mode          = try(each.value.radios.2.power_mode, null)
      power_level         = try(each.value.radios.2.power_level, null)
      power_value         = try(each.value.radios.2.power_value, null)
      override_vaps       = try(each.value.radios.2.override_vaps, null)
      vap_all             = try(each.value.radios.2.vap_all, null)
      override_channel    = try(each.value.radios.2.override_channel, null)
      drma_manual_mode    = try(each.value.radios.2.drma_manual_mode, null)

      dynamic vaps {
        for_each  = { for vap in try(each.value.radios.2.vaps, []) : vap => vap }
        content {
          name    = vaps.value
        }
      }

      dynamic channel {
        for_each  = { for channel in try(each.value.radios.2.channels, []) : channel => channel }
        content {
          chan    = channel.value
        }
      }
    }
  }
  dynamic radio_3 {
    for_each                        = { for a in (try(each.value.radios.3, []) == [] ? [] : ["1"]) : a => a}
    content {
      override_band       = try(each.value.radios.3.override_band, null)
      band                = try(each.value.radios.3.band, null)
      override_analysis   = try(each.value.radios.3.override_analysis, null)
      spectrum_analysis   = try(each.value.radios.3.spectrum_analysis, null)
      override_txpower    = try(each.value.radios.3.override_txpower, null)
      auto_power_level    = try(each.value.radios.3.auto_power_level, null)
      auto_power_high     = try(each.value.radios.3.auto_power_high, null)
      auto_power_low      = try(each.value.radios.3.auto_power_low, null)
      auto_power_target   = try(each.value.radios.3.auto_power_target, null)
      power_mode          = try(each.value.radios.3.power_mode, null)
      power_level         = try(each.value.radios.3.power_level, null)
      power_value         = try(each.value.radios.3.power_value, null)
      override_vaps       = try(each.value.radios.3.override_vaps, null)
      vap_all             = try(each.value.radios.3.vap_all, null)
      override_channel    = try(each.value.radios.3.override_channel, null)
      drma_manual_mode    = try(each.value.radios.3.drma_manual_mode, null)

      dynamic vaps {
        for_each  = { for vap in try(each.value.radios.3.vaps, []) : vap => vap }
        content {
          name    = vaps.value
        }
      }

      dynamic channel {
        for_each  = { for channel in try(each.value.radios.3.channels, []) : channel => channel }
        content {
          chan    = channel.value
        }
      }
    }
  }
  dynamic radio_4 {
    for_each                        = { for a in (try(each.value.radios.4, []) == [] ? [] : ["1"]) : a => a}
    content {
      override_band       = try(each.value.radios.4.override_band, null)
      band                = try(each.value.radios.4.band, null)
      override_analysis   = try(each.value.radios.4.override_analysis, null)
      spectrum_analysis   = try(each.value.radios.4.spectrum_analysis, null)
      override_txpower    = try(each.value.radios.4.override_txpower, null)
      auto_power_level    = try(each.value.radios.4.auto_power_level, null)
      auto_power_high     = try(each.value.radios.4.auto_power_high, null)
      auto_power_low      = try(each.value.radios.4.auto_power_low, null)
      auto_power_target   = try(each.value.radios.4.auto_power_target, null)
      power_mode          = try(each.value.radios.4.power_mode, null)
      power_level         = try(each.value.radios.4.power_level, null)
      power_value         = try(each.value.radios.4.power_value, null)
      override_vaps       = try(each.value.radios.4.override_vaps, null)
      vap_all             = try(each.value.radios.4.vap_all, null)
      override_channel    = try(each.value.radios.4.override_channel, null)
      drma_manual_mode    = try(each.value.radios.4.drma_manual_mode, null)

      dynamic vaps {
        for_each  = { for vap in try(each.value.radios.4.vaps, []) : vap => vap }
        content {
          name    = vaps.value
        }
      }

      dynamic channel {
        for_each  = { for channel in try(each.value.radios.4.channels, []) : channel => channel }
        content {
          chan    = channel.value
        }
      }
    }
  }
}

resource fortios_wirelesscontroller_wtpgroup groups {
  depends_on        = [ fortios_wirelesscontroller_wtp.ap ]
  for_each          = { for group in try(local.wireless_yaml.groups, []) : group.name => group}
  name              = try(each.value.name, null)
  platform_type     = try(each.value.platform_type, null)
  ble_major_id      = try(each.value.ble_major_id, null)

  dynamic wtps {
    for_each        = { for ap in try(each.value.members, []) : ap => ap }
    content {
      wtp_id        = wtps.value
    }
  }
}
