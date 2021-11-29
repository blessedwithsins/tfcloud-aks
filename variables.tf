variable "cluster_name" {

}

variable "resource_group_name" {

}

variable "environment" {

}

variable "location" {
  default = "Central US"
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

variable dns_prefix {
}

