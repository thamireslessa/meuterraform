# Definição de uma interface de rede no Azure
resource "azurerm_network_interface" "example" {
  name                = "example-nic"                         # Nome da interface de rede
  location            = azurerm_resource_group.example.location  # Localização da interface de rede, mesma do grupo de recursos
  resource_group_name = azurerm_resource_group.example.name      # Nome do grupo de recursos onde a interface de rede será criada
  ip_configuration {
    name                          = "internal"                 # Nome da configuração IP
    subnet_id                     = azurerm_subnet.example.id  # ID da sub-rede associada
    private_ip_address_allocation = "Dynamic"                  # Alocação dinâmica de endereço IP privado
  }
}
