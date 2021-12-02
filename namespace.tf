data "azurerm_kubernetes_cluster" "aks_cluster" {
  name = "tfcloud"  
  resource_group_name = "tfcloud" 
}

provider "kubernetes" {
  host                   = data.azurerm_kubernetes_cluster.aks_cluster.name.kube_config.0.host
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.aks_cluster.name.kube_config.0.cluster_ca_certificate)
  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    command     = "az"
    args        = ["aks", "get-credentials", "--name", "tfcloud", "--resource-group", "tfcloud"]
  }
}

resource "kubernetes_namespace" "example" {
  metadata {
    annotations = {
      name = "example-annotation"
    }

    labels = {
      mylabel = "label-value"
    }

    name = "terraform-example-namespace"   
  }
}
