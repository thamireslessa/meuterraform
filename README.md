Este guia mostra como implantar um site WordPress na Azure usando Terraform. O processo cria uma VM, instala Docker, e configura containers para WordPress e MySQL, garantindo a retenção de dados.

Pré-requisitos:
Conta Azure com acesso ao CLI da Azure
Conta GitHub
Terraform instalado
Conhecimento básico de Terraform, Docker e WordPress
Instruções:
Clone o Repositório:

Clone este repositório para sua máquina local:

sh
Copiar código
git clone https://github.com/seu-usuario/seu-repositorio.git
cd seu-repositorio
Configure as Variáveis:

Edite variables.tf e defina as variáveis:

resource_group_name: Nome do grupo de recursos da Azure
location: Local da VM
admin_username: Usuário administrador da VM
admin_password: Senha do administrador
network_security_group_name: Nome do grupo de segurança
Inicialize o Terraform:

No terminal, no diretório do projeto, execute:

sh
Copiar código
terraform init
terraform plan
terraform apply
Isso cria os recursos na Azure.

Acesse o WordPress:

Após a execução do Terraform, o IP da VM será exibido. Acesse esse IP em um navegador para ver o site WordPress.

Destruição da Infraestrutura:

Para destruir os recursos criados, use:

sh
Copiar código
terraform destroy
Observações:
O script usa uma imagem Docker pública do WordPress. Personalize se necessário.
Um volume separado armazena os dados do WordPress, garantindo preservação durante upgrades.
Consulte a documentação oficial para mais informações sobre Terraform, Docker e WordPress.
Suporte:
Dúvidas ou problemas? Abra uma issue no repositório GitHub.