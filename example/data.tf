data "ncloud_cdss_kafka_version" "kafka_version" {
  filter {
    name   = "name"
    values = ["Kafka 2.8.2"]
  }
}

data "ncloud_cdss_os_image" "os_image" {
  filter {
    name   = "image_name"
    values = ["CentOS 7.8 (64-bit)"]
  }
}

data "ncloud_cdss_node_product" "cdss_node_product" {
  os_image  = data.ncloud_cdss_os_image.os_image.id
  subnet_no = ncloud_subnet.subnet_public.id
  filter {
    name   = "cpu_count"
    values = ["2"]
  }
  filter {
    name   = "memory_size"
    values = ["8GB"]
  }
  filter {
    name   = "product_type"
    values = ["STAND"]
  }
}