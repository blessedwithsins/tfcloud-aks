variable "resource_group_name" {
  description = "The resource group name to be imported"
  default = "tfcloud"
}

variable "location" {
    description = "The resource group will be in this location"
    default = "centralus"
}

variable "cluster_name" {
    description = "The resource group will be in this location"
    default = "tfcloud"
}

variable "environment" {
    description = "envinfo"
    default = "test"
}

variable "node_count" {
  default = 1
}

variable "node_size" {
  default = "Standard_B2ms"
}

variable "service_principal" {
  type = object({
    client_id     = string
    client_secret = string
  })
  description = "The service principal to use"
}

variable "dns_prefix" {
    description = "The resource group will be in this location"
    default = "tfcloud"   
}

