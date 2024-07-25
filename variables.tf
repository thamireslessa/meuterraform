variable "resource_group_name" {
  description = "Nome do grupo de recursos"  # Descrição da variável que define o nome do grupo de recursos
  default     = "example-resources"          # Valor padrão para o nome do grupo de recursos
}

variable "location" {
  description = "Localização dos recursos"  # Descrição da variável que define a localização dos recursos
  default     = "Brazil South"              # Valor padrão para a localização dos recursos
}
