provider "alicloud" {
  region = var.region
}

resource "alicloud_vpc" "vpc" {
  count      = var.enable ? 1 : 0
  name       = "tf_test_foo"
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vswitch" "vsw" {
  count             = var.enable ? 1 : 0
  vpc_id            = alicloud_vpc.vpc.*.id[0]
  cidr_block        = "172.16.0.0/21"
  availability_zone = var.availability_zone
}

resource "alicloud_security_group" "default" {
  count  = var.enable ? 1 : 0
  name   = "default"
  vpc_id = alicloud_vpc.vpc.*.id[0]
}

resource "alicloud_instance" "instance" {
  count = var.enable ? var.scale_count : 0
  # cn-beijing
  availability_zone = var.availability_zone
  security_groups   = alicloud_security_group.default.*.id
  # series III
  instance_type              = "ecs.s6-c1m2.xlarge"
  instance_charge_type       = "PostPaid"
  spot_strategy              = "SpotAsPriceGo"
  system_disk_category       = "cloud_efficiency"
  image_id                   = "ubuntu_18_04_64_20G_alibase_20190624.vhd"
  instance_name              = format("ecs%02d", count.index)
  vswitch_id                 = alicloud_vswitch.vsw.*.id[0]
  internet_max_bandwidth_out = 2
  host_name                  = format("ecs%02d", count.index)
  password                   = "1q2w3e4r5T"
}

resource "alicloud_security_group_rule" "allow_all_tcp" {
  count             = var.enable ? var.scale_count : 0
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "1/65535"
  priority          = 1
  security_group_id = alicloud_security_group.default.*.id[0]
  cidr_ip           = "0.0.0.0/0"
}
