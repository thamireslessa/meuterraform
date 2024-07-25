provider "azurerm" {
  features {}  # Configura o provedor Azure com funcionalidades padrão
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"  # Nome do grupo de recursos
  location = "Brazil South"        # Localização do grupo de recursos
}

resource "azurerm_virtual_network" "example" {
  name                = "example-vnet"                        # Nome da rede virtual
  address_space       = ["10.0.0.0/16"]                       # Espaço de endereçamento IP da rede virtual
  location            = azurerm_resource_group.example.location  # Localização da rede virtual (mesma do grupo de recursos)
  resource_group_name = azurerm_resource_group.example.name      # Nome do grupo de recursos onde a rede virtual será criada
}

resource "azurerm_subnet" "example" {
  name                 = "example-subnet"                     # Nome da sub-rede
  resource_group_name  = azurerm_resource_group.example.name  # Nome do grupo de recursos onde a sub-rede será criada
  virtual_network_name = azurerm_virtual_network.example.name # Nome da rede virtual onde a sub-rede será criada
  address_prefixes     = ["10.0.1.0/24"]                      # Prefixo de endereçamento IP da sub-rede
}

resource "azurerm_network_interface" "example" {
  name                = "example-nic"                         # Nome da interface de rede
  location            = azurerm_resource_group.example.location  # Localização da interface de rede (mesma do grupo de recursos)
  resource_group_name = azurerm_resource_group.example.name      # Nome do grupo de recursos onde a interface de rede será criada
  ip_configuration {
    name                          = "internal"                 # Nome da configuração IP
    subnet_id                     = azurerm_subnet.example.id  # ID da sub-rede associada
    private_ip_address_allocation = "Dynamic"                  # Alocação dinâmica de endereço IP privado
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-vm"                          # Nome da máquina virtual
  resource_group_name = azurerm_resource_group.example.name   # Nome do grupo de recursos onde a VM será criada
  location            = azurerm_resource_group.example.location  # Localização da VM (mesma do grupo de recursos)
  size                = "Standard_B1s"                        # Tamanho da VM
  admin_username      = "adminuser"                           # Nome de usuário do administrador
  network_interface_ids = [
    azurerm_network_interface.example.id,                     # IDs das interfaces de rede associadas
  ]
  admin_password      = "Password1234!"                       # Senha do administrador (substitua por uma senha segura)
  os_disk {
    caching              = "ReadWrite"                        # Tipo de cache do disco do sistema operacional
    storage_account_type = "Standard_LRS"                     # Tipo de conta de armazenamento do disco do sistema operacional
  }
  source_image_reference {
    publisher = "Canonical"                                   # Fornecedor da imagem do sistema operacional
    offer     = "UbuntuServer"                                # Oferta da imagem do sistema operacional
    sku       = "24.04-LTS"                                   # SKU da imagem do sistema operacional
    version   = "latest"                                      # Versão da imagem do sistema operacional
  }
  custom_data = file("init.sh")                               # Script de inicialização que instala Docker e Docker Compose
  tags = {
    environment = "testing"                                   # Tags para categorizar a VM
  }
}

output "vm_ip" {
  value = azurerm_linux_virtual_machine.example.public_ip_address  # Exibe o IP público da VM após o provisionamento
}

