#Variables and default values used in this deploy
# Dependencies - nil
# NZDR, August 2022

variable "location" {
  type    = string
  default = "AustraliaEast"
}

variable "rg_name" {
  type    = string
  default = "rg-az700"
}

variable "vnet_name" {
  type    = string
  default = "vnet-az700"
}

variable "subnet1_name" {
  type    = string
  default = "subnet1-az700"
}

variable "subnet2_name" {
  type    = string
  default = "subnet2-az700"
}
