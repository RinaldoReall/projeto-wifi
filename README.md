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
* :heavy_check_mark: É possível usar o controlador em núvem, fazendo acesso em camada 03


## Preparando o ambiente:
* Atualize os Repositórios e Pacotes do Sistema:
``` 
apt -y update && apt -y upgrade
``` 


## Instalação do UniFi Network Application V7.2.x
* Instalando a Versão 7.2.93:
```
wget https://get.glennr.nl/unifi/install/unifi-7.2.93.sh
```
```
chmod +x unifi-7.2.93.sh
```
```
./unifi-7.2.93.sh 
``` 
* SIGA OS PASSOS SOLICITADOS NA TELA DE INSTALAÇÃO.


## Configurar o UAP para acessar a controladora de forma remota
*   Acesse seu UAP via SSH, use HELP para ver as opções disponíveis
```
help
```

```
UniFi Command Line Interface - Ubiquiti Networks

   info                      display device information
   set-default               restore to factory default
   set-inform <inform_url>   attempt inform URL (e.g. set-inform http://192.168.0.8:8080/inform)
   upgrade <firmware_url>    upgrade firmware (e.g. upgrade http://192.168.0.8/unifi_fw.bin)
   fwupdate --url <firmware_url|firmware_name> [--dl-only] [--md5sum <sum_of_fw>]
            [--keep-firmware] [--keep-running] [--reboot-sys]
                                   new firmware update command
   reboot                    reboot the device
```

* Configure o SET-INFORM (Altere X.X.X.X para o endereço IP ou Domínio de sua controladora)
``` 
set-inform http://X.X.X.X:8080/inform
```


## Upgrade
* Atualize os Repositórios e Pacotes do Sistema:
``` 
apt -y update && apt -y upgrade
``` 
*   Acesse https://www.ui.com/download-software, selecione a última versão para o Sistema Linux, copie o link do arquivo .DEB (Exemplo abaixo para a versão 7.2.92)

*   Baixe o pacote diretamente do terminal do seu Linux com o WGET:
``` 
wget https://fw-download.ubnt.com/data/unifi-controller/7684-debian-7.2.92-b681295cf6634133824ff9c60cd19fe8.deb
```

*  Execute o pacote de instalação. OBS: Será solicitado realizar o backup da versão atual, selecione YES:
```
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
