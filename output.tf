output "id" {
  description = "Cluster id."
  value       = ncloud_cdss_cluster.cdss_cluster.id
}

output "endpoints" {
  description = <<EOF
List of endpoints
-plaintext - List of broker nodes (Port 9092).
-tls - List of broker nodes (Port 9093).
-public_endpoint_plaintext - List of public endpoint of broker nodes.
-public_endpoint_plaintext_listener_port - List of listener port for public endpoint of broker nodes.
-public_endpoint_tls - List of public endpoint of broker nodes (TLS).
-public_endpoint_tls_listener_port - List of listener port for public endpoint of broker nodes (TLS).
-hosts_private_endpoint_tls - Editing details of the hosts file (Private IP hostname format).
-hosts_public_endpoint_tls - Editing details of the hosts file (Public IP hostname format).
-zookeeper - List of ZooKeeper nodes (Port 2181).
EOF
  value       = ncloud_cdss_cluster.cdss_cluster.endpoints
}