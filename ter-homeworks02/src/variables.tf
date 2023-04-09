###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vm_web_compute_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "compute image family"
}

#variable "vm_web_name" {
#  type        = string
#  default     = "netology-develop-platform-web"
#  description = "VM name"
#}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "VM platform ID"
}

variable "vm_db_compute_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "compute image family"
}

#variable "vm_db_name" {
#  type        = string
#  default     = "netology-develop-platform-db"
#  description = "VM name"
#}
variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "VM platform ID"
}

variable "project" {
  type        = string
  default     = "netology"
}

variable "env" { 
  type        = string
  default     = "develop"
}

variable "vm_web_resources" {
  type        = map
  default     = {cores=2, memory=1,core_fraction=5} 
}

variable "vm_db_resources" {
  type        = map   
  default     = {cores=2, memory=2,core_fraction=20}
}

variable "vm_metadata" {
  type        = map
  default     = {serial-port-enable = 1, ssh-keys = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAWXeldjp/5FVwIFBATy7JBiyRIp8vLlSmoQEV5jlybD blekh@oops"}
}


###ssh vars

#variable "vms_ssh_root_key" {
#  type        = string
#  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAWXeldjp/5FVwIFBATy7JBiyRIp8vLlSmoQEV5jlybD blekh@oops"
#  description = "ssh-keygen -t ed25519"
#}
