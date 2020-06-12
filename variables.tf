variable "region" {
  description = "region for provider"
  type        = string
}

variable "scale_count" {
  description = "how many ecs instances we want to ask for"
  type        = number
}

variable "zone" {
  description = "zone within the region passed in"
  type        = string
}
