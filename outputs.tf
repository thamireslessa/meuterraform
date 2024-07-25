output "vm_ip" {
  description = "IP público da VM"            # Descrição da saída que fornece o IP público da VM
  value       = azurerm_linux_virtual_machine.example.public_ip_address  # Valor da saída que é o IP público da VM
}
