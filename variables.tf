### vCenter Variables (Variable Set in Workspace)

variable "vcenter_user" {
  type = string
}

variable "vcenter_password" {
  type = string
}

variable "vcenter_server" {
  type = string
}

### Locally Defined ###

variable "dc" {
  type = string
}

variable "dvs" {
  type = string
}

variable "cluster" {
  type = string
}

variable "datastore" {
  type = string
}

variable "template" {
  type = string
}

variable "vms" {
  type = map(object({
    name            = string
    num_cpus        = number
    memory          = number
    dpg_name        = string
    domain          = string
    ipv4_address    = string
    ipv4_netmask    = number
    ipv4_gateway    = string
    dns_server_list = list(string)
    }))
}
