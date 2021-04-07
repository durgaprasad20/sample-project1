variable "rgname" {
  type        = string
  default     = "task"
  description = "this is name of resource group"
}

variable "loc" {
  type        = string
  default     = "east us"
  description = "name of location"
}

variable "networkname" {
  type        = string
  default     = "vm2"
  description = "this is network name"
}

variable "address" {
  type        = list(any)
  default     = ["15.0.0.0/16"]
  description = "this is ip range for network"
}

variable "subnetname" {
  type        = string
  default     = "subnet1"
  description = "this is name of subnet"
}

variable "prefix" {
  type    = string
  default = "15.0.1.0/24"
}

variable "nic" {
  type        = string
  default     = "nic1"
  description = "name of nic"
}

variable "pip" {
  type        = string
  default     = "pip1"
  description = "name of public ip"
}

variable "disk" {
  type        = string
  default     = "disk1"
  description = "name of disk"
}

variable "storage" {
  type        = string
  default     = "Standard_LRS"
  description = "storage type"
}

variable "crt" {
  type    = string
  default = "Empty"
}

variable "size" {
  type        = string
  default     = "20"
  description = "size in gb"
}





