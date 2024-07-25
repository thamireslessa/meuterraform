Deploy de WordPress na Azure com Terraform e Docker
Este guia mostra como usar o Terraform para criar uma VM na Azure, instalar Docker e rodar containers do WordPress e MySQL.

Estrutura dos Arquivos
main.tf: Define os recursos principais.
network_interface.tf: Configura a interface de rede.
network.tf: Define a rede virtual e a sub-rede.
outputs.tf: Exibe o IP público da VM.
variables.tf: Define variáveis do Terraform.
terraform.tfstate: Estado da infraestrutura.
script.sh: Instala Docker e configura o WordPress.
Pré-requisitos
Conta Azure e GitHub.
Terraform instalado.
Conhecimento básico de Terraform, Docker e WordPress.
Instruções
Clone o Repositório https://github.com/thamireslessa/meuterraform

Copiar código
git clone Deploy de WordPress na Azure com Terraform e Docker
Este guia mostra como usar o Terraform para criar uma VM na Azure, instalar Docker e rodar containers do WordPress e MySQL.

Estrutura dos Arquivos
main.tf: Define os recursos principais.
network_interface.tf: Configura a interface de rede.
network.tf: Define a rede virtual e a sub-rede.
outputs.tf: Exibe o IP público da VM.
variables.tf: Define variáveis do Terraform.
terraform.tfstate: Estado da infraestrutura.
script.sh: Instala Docker e configura o WordPress.
Pré-requisitos
Conta Azure e GitHub.
Terraform instalado.
Conhecimento básico de Terraform, Docker e WordPress.
Instruções
Clone o Repositório

Copiar código
git clone https:[//github.com/seu-usuario/seu-repositorio.git](https://github.com/thamireslessa/meuterraform)
cd seu-repositorio
Configure as Variáveis

Edite variables.tf para definir suas configurações de Azure.

Inicialize e Aplique o Terraform
cd seu-repositorio
Configure as Variáveis

Edite variables.tf para definir suas configurações de Azure.

Inicialize e Aplique o Terraform


Copiar código
terraform init
terraform plan
terraform apply
Acesse o WordPress

O IP público da VM será mostrado após terraform apply. Use esse IP no navegador para acessar o WordPress.

Destrua a Infraestrutura

Copiar código
terraform destroy
Observações
O script usa uma imagem Docker pública para o WordPress.
Dados do WordPress são preservados em um volume separado.
Suporte
Abra um problema no repositório GitHub para dúvidas ou problemas.

