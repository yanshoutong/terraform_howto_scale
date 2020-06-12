variable enable {
  type = bool
}

variable region {
  type = string
}

variable availability_zone {
  type = string
}

variable "scale_count" {
  description = "how many ecs instances will be created"
  type        = number
  default     = 2
}

output "public_ip_addresses" {
  value = var.enable ? alicloud_instance.instance.*.public_ip[0] : ""
}
