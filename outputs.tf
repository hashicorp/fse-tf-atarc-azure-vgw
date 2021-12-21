output "virtual_network_gateway_name" {
  value       = azurerm_virtual_network_gateway.virtual_network_gateway.name
  description = "Azure Virtual Network Gateway Name"
}

output "virtual_public_ip_1" {
  value       = azurerm_public_ip.public_ip_1.ip_address
  description = "Public IP Address 1"
}

output "virtual_public_ip_2" {
  value       = azurerm_public_ip.public_ip_2.ip_address
  description = "Public IP Address 2"
}