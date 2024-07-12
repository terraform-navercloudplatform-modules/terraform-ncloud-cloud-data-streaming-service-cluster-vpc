resource "ncloud_cdss_cluster" "cdss_cluster" {
  name               = var.name
  kafka_version_code = var.kafka_version_code
  config_group_no    = var.config_group_no
  vpc_no             = var.vpc_no
  os_image           = var.os_image
  cmak               = var.cmak
  manager_node       = var.manager_node
  broker_nodes       = var.broker_nodes
}