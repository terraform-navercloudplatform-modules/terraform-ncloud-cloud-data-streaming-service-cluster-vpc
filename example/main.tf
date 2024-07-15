terraform {
  required_providers {
    ncloud = {
      source = "NaverCloudPlatform/ncloud"
    }
  }
  required_version = ">= 0.13"
}

provider "ncloud" {}


resource "ncloud_vpc" "vpc" {
  ipv4_cidr_block = "10.4.0.0/16"
}

resource "ncloud_subnet" "subnet_public" {
  name           = "sample-subnet-public"
  vpc_no         = ncloud_vpc.vpc.id
  subnet         = "10.236.0.0/24"
  zone           = "KR-1"
  network_acl_no = ncloud_vpc.vpc.default_network_acl_no
  subnet_type    = "PUBLIC"
  usage_type     = "GEN"
}

resource "ncloud_subnet" "subnet_private" {
  name           = "sample-subnet-private"
  vpc_no         = ncloud_vpc.vpc.id
  subnet         = "10.236.100.0/24"
  zone           = "KR-1"
  network_acl_no = ncloud_vpc.vpc.default_network_acl_no
  subnet_type    = "PRIVATE"
  usage_type     = "GEN"
}

resource "ncloud_cdss_config_group" "config_group" {
  name               = "tf-config-3"
  kafka_version_code = data.ncloud_cdss_kafka_version.kafka_version.id
  description        = "test"
}

resource "random_password" "cmak-password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "ncloud_cdss_cluster" "cdss-cluster" {
  name               = "from-tf-cdss"
  kafka_version_code = data.ncloud_cdss_kafka_version.kafka_version.id
  config_group_no    = ncloud_cdss_config_group.config_group.id
  vpc_no             = ncloud_vpc.vpc.id
  os_image           = data.ncloud_cdss_os_image.os_image.id
  cmak {
    user_name     = "terraform"
    user_password = random_password.cmak-password.result
  }
  manager_node {
    node_product_code = data.ncloud_cdss_node_product.cdss_node_product.id
    subnet_no         = ncloud_subnet.subnet_public.id
  }
  broker_nodes {
    node_product_code = data.ncloud_cdss_node_product.cdss_node_product.id
    subnet_no         = ncloud_subnet.subnet_private.id
    node_count        = 3
    storage_size      = 100
  }
}