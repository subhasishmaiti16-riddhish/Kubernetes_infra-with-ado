module "rgs" {
  source  = "../aks/resource-group"
  aks_new = var.rg_new1
}

module "vnet" {
  depends_on = [module.rgs]
  source     = "../aks/virtual-network"
  vnet_new   = var.vnet_aks
}

module "aks_subnet" {
  depends_on = [module.vnet]
  source     = "../aks/subnet"
  sub_new    = var.sub_aks
}

module "pip_new" {
  depends_on = [module.rgs]
  source     = "../aks/public"
  public_new = var.pip_aks
}

module "appgw" {
  depends_on = [module.vnet, module.pip_new, module.aks_subnet]
  source     = "../aks/application-gateway"
  appgw_new  = var.appgw_aks

}
module "appgw_contributor" {
  depends_on = [module.appgw, module.aks_cluster]
  source     = "../aks/appgw-access"
  access_new = var.appgw_access_aks
}


module "aks_cluster" {
  depends_on  = [module.vnet, module.appgw, module.aks_subnet]
  source      = "../aks/aks-cluster"
  cluster_new = var.cluster_aks

}
