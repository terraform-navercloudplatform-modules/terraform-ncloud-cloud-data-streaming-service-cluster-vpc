variable "name" {
  description = "(Required) Cluster name."
  type        = string
}

variable "kafka_version_code" {
  description = "(Required) Cloud Data Streaming Service version to be used."
  type        = string
}

variable "config_group_no" {
  description = "(Required) ConfigGroup number to be used."
  type        = string
}

variable "vpc_no" {
  description = "(Required) VPC number to be used."
  type        = string
}

variable "os_image" {
  description = "(Required) OS type to be used."
  type        = string
}

variable "cmak" {
  description = <<EOF
  (Required) CMAK access information.
  - user_name - (Required) CMAK access ID. Only lowercase alphanumeric characters and non-consecutive hyphens (-) allowed First character must be a letter, but the last character may be a letter or a number.
  - user_password - (Required) CMAK access password. Must be at least 8 characters and contain at least one of each: English uppercase letter, lowercase letter, special character, and number.
  EOF
  type = object({
    user_name     = string
    user_password = string
  })
}

variable "manager_node" {
  description = <<EOF
  (Required) Manager node information.
  - node_product_code - (Required) HW specifications of the manager node.
  - subnet_no - (Required) Subnet number where the manager node is to be located.
  EOF
  type = object({
    node_product_code = string
    subnet_no         = string
  })
}

variable "broker_nodes" {
  description = <<EOF
  (Required) Broker node information.
  - node_product_code - (Required) HW specifications of the broker node.
  - subnet_no - (Required) Subnet number where the broker node is to be located.
  - node_count - (Required) Number of broker nodes. At least 3 units, up to 10 units allowed.
  - storage_size - (Required) Broker node storage capacity. At least 100 GB, up to 2000 GB. Must be in units of 10 GB.
  EOF
  type = object({
    node_product_code = string
    subnet_no         = string
    node_count        = number
    storage_size      = number
  })
}