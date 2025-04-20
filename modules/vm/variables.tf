variable "instance_name" {
  description = "Instance Name"
  type        = string
}

variable "machine_type" {
  description = "Machine Type"
  type        = string
}

variable "image" {
  description = "Boot Disk Image"
  type        = string
}
variable "zone" {
  description = "Zone where the instance will be deployed"
  type        = string
}

variable "disk_size" {
  description = "Disk Size in GB"
  type        = number
}

variable "network" {
  description = "Network Name"
  type        = string
}

variable "subnet" {
  description = "Subnet Name"
  type        = string
}

variable "startup_script" {
  description = "Startup Script"
  type        = string
  default     = ""
}
