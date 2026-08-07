rg_new1 = {
  aks_new1 = {
    rg_name  = "aks-rg"
    location = "Central India"
  }
}
vnet_aks = {
  vnet_new1 = {
    vnet_name     = "aks-vnet"
    location      = "central india"
    rg_name       = "aks-rg"
    address_space = ["10.0.0.0/16"]
  }
}

sub_aks = {
  sub_new1 = {
    sub_name         = "aks-subnet"
    rg_name          = "aks-rg"
    vnet_name        = "aks-vnet"
    address_prefixes = ["10.0.1.0/24"]
  }
  sub_new2 = {
    sub_name         = "appgw-subnet"
    rg_name          = "aks-rg"
    vnet_name        = "aks-vnet"
    address_prefixes = ["10.0.2.0/24"]
  }
}
pip_aks = {
  public_new1 = {
    pip_name          = "aks-pip"
    location          = "central india"
    rg_name           = "aks-rg"
    allocation_method = "Static"
    sku               = "Standard"
  }
}
appgw_aks = {
  appgw_new1 = {
    appgw_name = "aks-appgw"
    location   = "central india"
    rg_name    = "aks-rg"
    sub_name   = "appgw-subnet"
    vnet_name  = "aks-vnet"
    pip_name   = "aks-pip"
  }
}
appgw_access_aks = {
  access_new1 = {
    appgw_name         = "aks-appgw"
    sub_name           = "appgw-subnet"
    vnet_name          = "aks-vnet"
    rg_name            = "aks-rg"
    cluster_name       = "aks-cluster"
    agic_identity_name = "ingressapplicationgateway-aks-cluster"
    agic_rg_name       = "MC_aks-rg_aks-cluster_centralindia"
  }
}

cluster_aks = {
  cluster_new1 = {
    cluster_name = "aks-cluster"
    location     = "central india"
    rg_name      = "aks-rg"
    vnet_name    = "aks-vnet"
    sub_name     = "aks-subnet"
    appgw_name   = "aks-appgw"
  }
}


