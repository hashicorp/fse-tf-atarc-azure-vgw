locals {
  name = data.terraform_remote_state.vnet.outputs.name
  location = data.terraform_remote_state.vnet.outputs.location
  resource_group_name = data.terraform_remote_state.vnet.outputs.rg_name
  subnet_gateway_id = data.terraform_remote_state.vnet.outputs.subnet_gateway_id
}

resource "azurerm_public_ip" "public_ip_1" {
  name                = "virtual_network_gateway_public_ip_1"
  location            = local.location
  resource_group_name = local.resource_group_name

  # Public IP needs to be dynamic for the Virtual Network Gateway
  # Keep in mind that the IP address will be "dynamically generated" after
  # being attached to the Virtual Network Gateway below
  allocation_method = "Dynamic"
}

resource "azurerm_public_ip" "public_ip_2" {
  name                = "virtual_network_gateway_public_ip_2"
  location            = local.location
  resource_group_name = local.resource_group_name

  # Public IP needs to be dynamic for the Virtual Network Gateway
  allocation_method = "Dynamic"
}

resource "azurerm_virtual_network_gateway" "virtual_network_gateway" {
  name                = "virtual_network_gateway"
  location            = local.location
  resource_group_name = local.resource_group_name

  type     = "Vpn"
  vpn_type = "RouteBased"

  # Configuration for high availability
  active_active = true
  # This might me expensive, check the prices  
  sku           = "VpnGw1"

  # Configuring the two previously created public IP Addresses
  ip_configuration {
    name                          = azurerm_public_ip.public_ip_1.name
    public_ip_address_id          = azurerm_public_ip.public_ip_1.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = local.subnet_gateway_id
  }

  ip_configuration {
    name                          = azurerm_public_ip.public_ip_2.name
    public_ip_address_id          = azurerm_public_ip.public_ip_2.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = local.subnet_gateway_id
  }
}
