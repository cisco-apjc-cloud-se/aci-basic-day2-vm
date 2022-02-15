dc = "MEL-DC4"
dvs = "DVS-VMM"
cluster = "CL1"
datastore = "NIMBLE-DS-1"
template = "Ubuntu-20.04-Template"

vms = {
  ### 1st VLAN VMs ###
  demo-app1-web1 = {
    name = "demo-app1-web1"
    num_cpus = 2
    memory = 2048
    dpg_name = "demo-basic-1|legacy|vl-303"
    domain = "mel.ciscolabs.com"
    ipv4_address = "10.66.209.82"
    ipv4_netmask = 28
    ipv4_gateway = "10.66.209.81"
    dns_server_list = ["64.104.200.248","64.104.76.247","171.70.168.183"]
  }
  demo-app1-db1 = {
    name = "demo-app1-db1"
    num_cpus = 2
    memory = 2048
    dpg_name = "demo-basic-1|legacy|vl-303"
    domain = "mel.ciscolabs.com"
    ipv4_address = "10.66.209.83"
    ipv4_netmask = 28
    ipv4_gateway = "10.66.209.81"
    dns_server_list = ["64.104.200.248","64.104.76.247","171.70.168.183"]
  }
  demo-app2-web1 = {
    name = "demo-app2-web1"
    num_cpus = 2
    memory = 2048
    dpg_name = "demo-basic-1|legacy|vl-303"
    domain = "mel.ciscolabs.com"
    ipv4_address = "10.66.209.84"
    ipv4_netmask = 28
    ipv4_gateway = "10.66.209.81"
    dns_server_list = ["64.104.200.248","64.104.76.247","171.70.168.183"]
  }
  demo-app2-db1 = {
    name = "demo-app2-db1"
    num_cpus = 2
    memory = 2048
    dpg_name = "demo-basic-1|legacy|vl-303"
    domain = "mel.ciscolabs.com"
    ipv4_address = "10.66.209.85"
    ipv4_netmask = 28
    ipv4_gateway = "10.66.209.81"
    dns_server_list = ["64.104.200.248","64.104.76.247","171.70.168.183"]
  }
  ### 2nd VLAN VMs ###
  demo-app3-web1 = {
    name = "demo-app3-web1"
    num_cpus = 2
    memory = 2048
    dpg_name = "demo-basic-1|legacy|vl-304"
    domain = "mel.ciscolabs.com"
    ipv4_address = "10.66.209.98S"
    ipv4_netmask = 28
    ipv4_gateway = "10.66.209.97"
    dns_server_list = ["64.104.200.248","64.104.76.247","171.70.168.183"]
  }
  demo-app3-db1 = {
    name = "demo-app3-db1"
    num_cpus = 2
    memory = 2048
    dpg_name = "demo-basic-1|legacy|vl-304"
    domain = "mel.ciscolabs.com"
    ipv4_address = "10.66.209.99"
    ipv4_netmask = 28
    ipv4_gateway = "10.66.209.97"
    dns_server_list = ["64.104.200.248","64.104.76.247","171.70.168.183"]
  }
  demo-app4-web1 = {
    name = "demo-app4-web1"
    num_cpus = 2
    memory = 2048
    dpg_name = "demo-basic-1|legacy|vl-304"
    domain = "mel.ciscolabs.com"
    ipv4_address = "10.66.209.100"
    ipv4_netmask = 28
    ipv4_gateway = "10.66.209.97"
    dns_server_list = ["64.104.200.248","64.104.76.247","171.70.168.183"]
  }
  demo-app4-db1 = {
    name = "demo-app4-db1"
    num_cpus = 2
    memory = 2048
    dpg_name = "demo-basic-1|legacy|vl-304"
    domain = "mel.ciscolabs.com"
    ipv4_address = "10.66.209.101"
    ipv4_netmask = 28
    ipv4_gateway = "10.66.209.97"
    dns_server_list = ["64.104.200.248","64.104.76.247","171.70.168.183"]
  }
}
