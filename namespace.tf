provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.tfcloud.kube_config.0.host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.tfcloud.kube_config.0.client_certificate)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.tfcloud.kube_config.0.cluster_ca_certificate)
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
