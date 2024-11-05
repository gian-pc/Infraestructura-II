variable "virginia_cidr" {
  description = "CIDR Virginia"
  type = string
}

variable "subnets" {
  description = "Lista de subnets"
  type = list(string)
}

variable "tags" {
  description = "Tags del proyecto"
  type = map(string)
  
}

variable "sg_ingress_cidr" {
  description = "CIDR para tráfico de entrada"
  type = string
}