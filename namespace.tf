data "azure_aks_cluster" "aks_cluster" {
  name = var.cluster_name
}

data "azure_aks_cluster_auth" "aks_cluster_auth" {
  name = var.cluster_name
}

provider "kubernetes" {
  host                   = data.azure_aks_cluster.aks_cluster.endpoint
  cluster_ca_certificate = base64decode(data.azure_aks_cluster.aks_cluster.certificate_authority.0.data)
  token                  = data.azure_aks_cluster_auth.aks_cluster_auth.token
  load_config_file       = false
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
