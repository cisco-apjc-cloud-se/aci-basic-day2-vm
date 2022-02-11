dc = "MEL-DC4"
dvs = "DVS-VMM"
cluster = "CL1"
datastore = "NIMBLE-DS-1"
template = "Ubuntu-20.04-Template"

vms = {
  demo-app1-web1 = {
    name = "demo-app1-web1"
    num_cpus = 2
    memory = 2048
    dpg_name = "demo-basic-1|ap-1|epg-1"
    domain = "mel.ciscolabs.com"
    ipv4_address = "10.66.209.82"
    ipv4_netmask = 28
    ipv4_gateway = "10.66.209.81"
    dns_server_list = ["64.104.123.245","171.70.168.183"]
  }
  demo-app1-db1 = {
    name = "demo-app1-db1"
    num_cpus = 2
    memory = 2048
    dpg_name = "demo-basic-1|ap-1|epg-1"
    domain = "mel.ciscolabs.com"
    ipv4_address = "10.66.209.83"
    ipv4_netmask = 28
    ipv4_gateway = "10.66.209.81"
    dns_server_list = ["64.104.123.245","171.70.168.183"]
  }
  demo-app2-web1 = {
    name = "demo-app2-web1"
    num_cpus = 2
    memory = 2048
    dpg_name = "demo-basic-1|ap-1|epg-1"
    domain = "mel.ciscolabs.com"
    ipv4_address = "10.66.209.84"
    ipv4_netmask = 28
    ipv4_gateway = "10.66.209.81"
    dns_server_list = ["64.104.123.245","171.70.168.183"]
  }
  demo-app2-db1 = {
    name = "demo-app2-db1"
    num_cpus = 2
    memory = 2048
    dpg_name = "demo-basic-1|ap-1|epg-1"
    domain = "mel.ciscolabs.com"
    ipv4_address = "10.66.209.84"
    ipv4_netmask = 28
    ipv4_gateway = "10.66.209.81"
    dns_server_list = ["64.104.123.245","171.70.168.183"]
  }
}
