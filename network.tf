# Definição de uma rede virtual no Azure
resource "azurerm_virtual_network" "example" {
  name                = "example-vnet"                        # Nome da rede virtual
  address_space       = ["10.0.0.0/16"]                       # Espaço de endereçamento IP da rede virtual
  location            = azurerm_resource_group.example.location  # Localização da rede virtual, mesma do grupo de recursos
  resource_group_name = azurerm_resource_group.example.name      # Nome do grupo de recursos onde a rede virtual será criada
}

# Definição de uma sub-rede dentro da rede virtual
resource "azurerm_subnet" "example" {
  name                 = "example-subnet"                     # Nome da sub-rede
  resource_group_name  = azurerm_resource_group.example.name  # Nome do grupo de recursos onde a sub-rede será criada
  virtual_network_name = azurerm_virtual_network.example.name # Nome da rede virtual onde a sub-rede será criada
  address_prefixes     = ["10.0.1.0/24"]                      # Prefixo de endereçamento IP da sub-rede
}

