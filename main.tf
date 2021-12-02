provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.node_size
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  tags = {
    Environment = var.environment
  }
}

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

