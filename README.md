![LOGO-TECHLABS](https://github.com/nilsonpessim/projeto-wifi/assets/6774062/a8859e6f-18ae-45f8-b119-c572429bb83d)

## UniFi Network Application - Install
* Repositório de Instalação e Configuração do UniFi Network Application.
 
## YouTube Tutorial Playlist
[Acessar Playlist](https://www.youtube.com/watch?v=f9THohalRB0&list=PLxU94wRRr-7xkvOapzNhJTgA-EqZvle3d)

## Requisitos do Sistema
Requisitos do sistema para instalação.
 
* :cd: Sistema Base Linux [Ubuntu 22.04, Debian 11]
* :heavy_check_mark: Processador: 2 vCPU
* :heavy_check_mark: Memória RAM: 4GB
* :heavy_check_mark: Armazenamento: 50GB
* :heavy_check_mark: Conectividade IP: Público ou Privado
* :heavy_check_mark: É possível adotar um UAP em uma controladora remota. (L3)


## Preparando o ambiente:
* Atualize os Repositórios e Pacotes do Sistema:
``` 
apt -y update && apt -y upgrade
``` 


## Instalação do UniFi Network Application V8.2.x
* Instalando a Versão 8.1.127:
```
wget https://get.glennr.nl/unifi/install/unifi-8.2.93.sh
```
```
chmod +x unifi-8.2.93.sh
```
```
./unifi-8.2.93.sh
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

* Resetar o UAP via SSH
``` 
syswrapper.sh restore-default
```


## Upgrade
* Atualize os Repositórios e Pacotes do Sistema:
``` 
apt -y update && apt -y upgrade
``` 
*   Dentro da Network Application, acesse "Setting > System > Check for Updates [Network Application Updates]"
![image](https://user-images.githubusercontent.com/6774062/194638399-97c5b336-71ec-42b8-9f51-dd5235fdae28.png)

* No Popup carregado, copie o link com o botão direto do mouse.
![image](https://user-images.githubusercontent.com/6774062/194638741-e32eec70-6f97-4954-bbb5-89f8f2a89308.png)

* Baixe o pacote diretamente do terminal do seu Linux com o WGET:
``` 
wget https://fw-download.ubnt.com/data/unifi-controller/7fe4-debian-7.2.94-60da5d445e0f47779a6d635724185886.deb
```

*  Execute o pacote de instalação. OBS: Será solicitado realizar o backup da versão atual, selecione YES:
```
dpkg -i 7fe4-debian-7.2.94-60da5d445e0f47779a6d635724185886.deb
``` 

## Para consultar todas as versões do UniFi Network Application 
*   https://glennr.nl/s/unifi-network-controller

## Referências
[![Glenn R](https://upload.wikimedia.org/wikipedia/commons/b/ba/Ubiquiti_Networks.svg)](https://glennr.nl/s/unifi-network-controller)


## Desenvolvedor :heart_eyes_cat:
[![Github Badge](https://img.shields.io/badge/-Github-000?style=flat-square&logo=Github&logoColor=white&link=https://github.com/nilsonpessim)](https://github.com/nilsonpessim)
[![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://br.linkedin.com/in/nilsonpessim)](https://br.linkedin.com/in/nilsonpessim)
[![Whatsapp Badge](https://img.shields.io/badge/-Whatsapp-4CA143?style=flat-square&labelColor=4CA143&logo=whatsapp&logoColor=white&link=https://api.whatsapp.com/send?phone=5537999351046)](https://api.whatsapp.com/send?phone=5537999351046)

## :sparkling_heart: Nos Ajude a Crescer
>Se este Material foi útil para você, ajude se inscrevendo no meu canal do YouTube.
>
>(https://youtube.com/techlabs94?sub_confirmation=1)
> 
>Isso me incentiva a trazer mais materiais como este e muitos outros de redes e tecnologia.
> 
>## ![YouTube Channel Subscribers](https://img.shields.io/youtube/channel/subscribers/UCWN6suTq5sZGqnSLos992Yw?style=social)
