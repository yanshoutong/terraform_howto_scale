provider "alicloud" {
  region = "cn-beijing"
}

provider "alicloud" {
  alias  = "qingdao"
  region = "cn-qingdao"
}

provider "alicloud" {
  alias  = "zhangjiakou"
  region = "cn-zhangjiakou"
}

provider "alicloud" {
  alias  = "huhehaote"
  region = "cn-huhehaote"
}

provider "alicloud" {
  alias  = "chengdu"
  region = "cn-chengdu"
}

# zhangjiakou
module "ecs_zhangjiakou" {
  source            = "./ecs"
  enable            = var.region == "cn-zhangjiakou" ? true : false
  region            = var.region
  availability_zone = var.zone
  scale_count       = var.scale_count
}

output "ecs_zhangjiakou_ip_addresses" {
    value = module.ecs_zhangjiakou.public_ip_addresses
}

# huhehaote
module "ecs_huhehaote" {
  source            = "./ecs"
  enable            = var.region == "cn-huhehaote" ? true : false
  region            = var.region
  availability_zone = var.zone
  scale_count       = var.scale_count
}

output "ecs_huhehaote_ip_addresses" {
    value = module.ecs_huhehaote.public_ip_addresses
}
