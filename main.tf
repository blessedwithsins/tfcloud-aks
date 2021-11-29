data "azurerm_kubernetes_cluster" "storagetest1" {
  name                = "storagetest1"
  resource_group_name = "storagetesting"
}

provider "kubernetes" {
  host                   = "${data.azurerm_kubernetes_cluster.storagetest1.kube_config.0.host}"
  client_certificate     = "${base64decode(data.azurerm_kubernetes_cluster.storagetest1.kube_config.0.client_certificate)}"
  client_key             = "${base64decode(data.azurerm_kubernetes_cluster.storagetest1.kube_config.0.client_key)}"
  cluster_ca_certificate = "${base64decode(data.azurerm_kubernetes_cluster.storagetest1.kube_config.0.cluster_ca_certificate)}"
}

provider "azurerm" {
   features {}
}
