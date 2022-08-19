![TechLabs](https://techlabs.net.br/wp-content/uploads/2021/09/logo_blog.png)

## UniFi Network Application - Install
* Repositório de Instalação e Configuração do UniFi Network Application.
 

## Requisitos do Sistema
Requisitos do sistema para instalação.
 
* :cd: Sistema Base Linux [Ubuntu 18.04, Debian 11]
* :heavy_check_mark: Processador: 2 vCPU
* :heavy_check_mark: Memória RAM: 4GB
* :heavy_check_mark: Armazenamento: 50GB
* :heavy_check_mark: Conectividade IP: Público ou Privado


## Preparando o ambiente:
* Atualize os Repositórios e Pacotes do Sistema:
``` 
apt -y update && apt -y upgrade
``` 


## Instalação do UniFi Network Application V7.2.x
* Instalando a Versão 7.2.92:
```
wget https://get.glennr.nl/unifi/install/unifi-7.2.92.sh
```
```
chmod +x unifi-7.2.92.sh
```
./unifi-7.2.92.sh 
``` 
* SIGA OS PASSOS SOLICITADOS NA TELA DE INSTALAÇÃO.


## Configurar o UAP para acessar a controladora de forma remota
*   Acesse seu UAP via SSH, configure o set-inform
``` 
set-inform http://X.X.X.X:8080/inform
```
* Alterando X.X.X.X para o endereço IP ou Domínio de sua controladora


## Upgrade
*   Acesse https://www.ui.com/download-software, selecione a última versão para o Sistema Linux, copie o link do arquivo .DEB, abra o console do seu Linux e execute o WGET, depois o DPKG:
``` 
wget https://fw-download.ubnt.com/data/unifi-controller/7684-debian-7.2.92-b681295cf6634133824ff9c60cd19fe8.deb
dpkg -i 7684-debian-7.2.92-b681295cf6634133824ff9c60cd19fe8.deb
``` 


## Para consultar todas as versões do UniFi Network Application 
*   https://glennr.nl/s/unifi-network-controller


## Referências
[![Glenn R](https://upload.wikimedia.org/wikipedia/en/thumb/9/93/Ubiquiti_Networks_2016.svg/220px-Ubiquiti_Networks_2016.svg.png)](https://glennr.nl/s/unifi-network-controller)


## Desenvolvedor :heart_eyes_cat:
[![Github Badge](https://img.shields.io/badge/-Github-000?style=flat-square&logo=Github&logoColor=white&link=https://github.com/nilsonpessim)](https://github.com/nilsonpessim)
[![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://br.linkedin.com/in/nilsonpessim)](https://br.linkedin.com/in/nilsonpessim)
[![Whatsapp Badge](https://img.shields.io/badge/-Whatsapp-4CA143?style=flat-square&labelColor=4CA143&logo=whatsapp&logoColor=white&link=https://api.whatsapp.com/send?phone=5537999351046)](https://api.whatsapp.com/send?phone=5537999351046)
