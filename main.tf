terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "mel-ciscolabs-com"
    workspaces {
      name = "aci-basic-day2-vm"
    }
  }
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      // version = "1.24.2"
    }
  }
}

### vSphere ESXi Provider
provider "vsphere" {
  user           = var.vcenter_user
  password       = var.vcenter_password
  vsphere_server = var.vcenter_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

### Remote Shared State ###
data "terraform_remote_state" "day2" {
  backend = "remote"
  config = {
    organization = "mel-ciscolabs-com"
    workspaces = {
      name = "aci-basic-day2"
    }
  }
}

### Locals ###
locals {
  # ap_epg_map = data.terraform_remote_state.day2.outputs.epg_map["demo-basic-1"]
  ap_epg_map = data.terraform_remote_state.day2.outputs.ap_epg_map["demo-basic-1"]
  dpg_list = flatten([
    for ap_key, ap in local.ap_epg_map : [
      for e_key, epg in ap.epg_map : [
        for d_key, domain in epg.dpg_map : [
          domain.dpg_name
        ]
      ]
    ]
  ])
}

output "dpg_list" {
  value = local.dpg_list
}

### Existing Data Sources
data "vsphere_datacenter" "datacenter" {
  name = var.dc
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "dpgs" {
  for_each = toset(local.dpg_list) # data.terraform_remote_state.day2.outputs.dpgs

  name          = each.key ## Output configured to use VMware format for the key
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "quarantine" {
  name          = "quarantine"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.template
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

### Tags 

resource "vsphere_tag_category" "category" {
  name        = var.tag_category.name
  cardinality = "SINGLE"
  description = var.tag_category.description
  associable_types = [
    "VirtualMachine"
    # "Datastore",
  ]
}

resource "vsphere_tag" "esg-tag" {
  for_each = var.tags

  name        = each.value.name
  category_id = vsphere_tag_category.category.id
  description = each.value.description
}

### New VM
resource "vsphere_virtual_machine" "vms" {
  for_each = var.vms

  name             = each.value.name
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus         = each.value.num_cpus
  memory           = each.value.memory
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type

  tags = [ for tag in each.value.tags : vsphere_tag.esg-tag[tag].id ]

  network_interface {
    network_id     = try(data.vsphere_network.dpgs[each.value.dpg_name].id, data.vsphere_network.quarantine.id)
    adapter_type   = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = lower(each.value.name)
        domain    = lower(each.value.domain)
      }

      network_interface {
        ipv4_address = each.value.ipv4_address
        ipv4_netmask = each.value.ipv4_netmask
      }
      ipv4_gateway = each.value.ipv4_gateway
      dns_server_list = each.value.dns_server_list #["64.104.123.245","171.70.168.183"]
    }
  }
}
