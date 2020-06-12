variable enable {
  description = "enable current provider"
  type        = bool
}

variable region {
  description = "provider region passed in"
  type        = string
}

variable availability_zone {
  description = "zone within the specific region"
  type        = string
}

variable "scale_count" {
  description = "how many ecs instances will be created"
  type        = number
}

output "public_ip_addresses" {
  value = var.enable ? alicloud_instance.instance.*.public_ip : []
}
