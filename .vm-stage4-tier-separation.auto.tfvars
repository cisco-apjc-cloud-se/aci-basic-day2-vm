dc = "MEL-DC4"
dvs = "DVS-VMM"
cluster = "CL1"
datastore = "NIMBLE-DS-1"
template = "Ubuntu-20.04-Template"

tag_category = {
  name = "ACI-ESG"
  description = "ACI Endpoint Security Group Tag"
}

tags = {
  # app1 = {
  #   name = "app1"
  #   description = "App #1 ESG Tag"
  # }
  app1-web = {
    name = "app1-web"
    description = "App #1 Web Tier ESG Tag"
  }
  app1-db = {
    name = "app1-db"
    description = "App #1 DB Tier ESG Tag"
  }
  # app2 = {
  #   name = "app2"
  #   description = "App #2 ESG Tag"
  # }
  app2-web = {
    name = "app2-web"
    description = "App #2 Web Tier ESG Tag"
  }
  app2-db = {
    name = "app2-db"
    description = "App #2 DB Tier ESG Tag"
  }
  # app3 = {
  #   name = "app3"
  #   description = "App #3 ESG Tag"
  # }
  app3-web = {
    name = "app3-web"
    description = "App #3 Web Tier ESG Tag"
  }
  app3-db = {
    name = "app3-db"
    description = "App #3 DB Tier ESG Tag"
  }
  # app4 = {
  #   name = "app4"
  #   description = "App #4 ESG Tag"
  # }
  app4-web = {
    name = "app4-web"
    description = "App #4 Web Tier ESG Tag"
  }
  app4-db = {
    name = "app4-db"
    description = "App #4 DB Tier ESG Tag"
  }
}

vms = {
  ### 1st VLAN VMs ###
  demo-app1-web1 = {
    name = "demo-app1-web1"
    num_cpus = 2
    memory = 2048
    dpg_name = "demo-basic-1|app-1|web"
    domain = "mel.ciscolabs.com"
    ipv4_address = "10.66.209.82"
    ipv4_netmask = 28
    ipv4_gateway = "10.66.209.81"
    dns_server_list = ["64.104.200.248","64.104.76.247","171.70.168.183"]
    tags = ["app1-web"]
  }
  demo-app1-db1 = {
    name = "demo-app1-db1"
    num_cpus = 2
    memory = 2048
    dpg_name = "demo-basic-1|app-1|db"
    domain = "mel.ciscolabs.com"
    ipv4_address = "10.66.209.83"
    ipv4_netmask = 28
    ipv4_gateway = "10.66.209.81"
    dns_server_list = ["64.104.200.248","64.104.76.247","171.70.168.183"]
    tags = ["app1-db"]
  }
  demo-app2-web1 = {
    name = "demo-app2-web1"
    num_cpus = 2
    memory = 2048
    dpg_name = "demo-basic-1|app-2|web"
    domain = "mel.ciscolabs.com"
    ipv4_address = "10.66.209.84"
    ipv4_netmask = 28
    ipv4_gateway = "10.66.209.81"
    dns_server_list = ["64.104.200.248","64.104.76.247","171.70.168.183"]
    tags = ["app2-web"]
  }
  demo-app2-db1 = {
    name = "demo-app2-db1"
    num_cpus = 2
    memory = 2048
    dpg_name = "demo-basic-1|app-2|db"
    domain = "mel.ciscolabs.com"
    ipv4_address = "10.66.209.85"
    ipv4_netmask = 28
    ipv4_gateway = "10.66.209.81"
    dns_server_list = ["64.104.200.248","64.104.76.247","171.70.168.183"]
    tags = ["app2-db"]
  }
  ### 2nd VLAN VMs ###
  demo-app3-web1 = {
    name = "demo-app3-web1"
    num_cpus = 2
    memory = 2048
    dpg_name = "demo-basic-1|app-3|web"
    domain = "mel.ciscolabs.com"
    ipv4_address = "10.66.209.98"
    ipv4_netmask = 28
    ipv4_gateway = "10.66.209.97"
    dns_server_list = ["64.104.200.248","64.104.76.247","171.70.168.183"]
    tags = ["app3-web"]
  }
  demo-app3-db1 = {
    name = "demo-app3-db1"
    num_cpus = 2
    memory = 2048
    dpg_name = "demo-basic-1|app-3|db"
    domain = "mel.ciscolabs.com"
    ipv4_address = "10.66.209.99"
    ipv4_netmask = 28
    ipv4_gateway = "10.66.209.97"
    dns_server_list = ["64.104.200.248","64.104.76.247","171.70.168.183"]
    tags = ["app3-db"]
  }
  demo-app4-web1 = {
    name = "demo-app4-web1"
    num_cpus = 2
    memory = 2048
    dpg_name = "demo-basic-1|app-4|web"
    domain = "mel.ciscolabs.com"
    ipv4_address = "10.66.209.100"
    ipv4_netmask = 28
    ipv4_gateway = "10.66.209.97"
    dns_server_list = ["64.104.200.248","64.104.76.247","171.70.168.183"]
    tags = ["app4-web"]
  }
  demo-app4-db1 = {
    name = "demo-app4-db1"
    num_cpus = 2
    memory = 2048
    dpg_name = "demo-basic-1|app-4|db"
    domain = "mel.ciscolabs.com"
    ipv4_address = "10.66.209.101"
    ipv4_netmask = 28
    ipv4_gateway = "10.66.209.97"
    dns_server_list = ["64.104.200.248","64.104.76.247","171.70.168.183"]
    tags = ["app4-db"]
  }
}
