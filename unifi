#!/bin/bash

# Autor: Robson Vaamonde
# Adaptador por Nilson Pessim

HORAINICIAL=$(date +%T)
USUARIO=$(id -u)
UBUNTU=$(lsb_release -rs)

LOG="/var/log/$(echo $0 | cut -d'/' -f2)"
#

KEYSRVMONGODB="https://www.mongodb.org/static/pgp/server-3.4.asc"
KEYUNIFI="https://dl.ui.com/unifi/unifi-repo.gpg"
#
export DEBIAN_FRONTEND="noninteractive"
clear
#
echo -e "Início do script $0 em: $(date +%d/%m/%Y-"("%H:%M")")\n" &>> $LOG
clear
#
sleep 5
#
echo -e "Adicionando o Repositório Universal do Apt, aguarde..."
	add-apt-repository universe &>> $LOG
echo -e "Repositório adicionado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Adicionando o Repositório Multiversão do Apt, aguarde..."
	add-apt-repository multiverse &>> $LOG
echo -e "Repositório adicionado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Atualizando as listas do Apt, aguarde..."
	apt update &>> $LOG
echo -e "Listas atualizadas com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Atualizando todo o sistema, aguarde..."
	apt -y upgrade &>> $LOG
	#apt -y full-upgrade &>> $LOG
	#apt -y dist-upgrade &>> $LOG
echo -e "Sistema atualizado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Removendo os software desnecessários, aguarde..."
	apt -y autoremove &>> $LOG
	apt -y autoclean &>> $LOG
echo -e "Software desnecessários removidos com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Instalando o Unifi Controller, aguarde...\n"
#
echo -e "Adicionando o repositório do MongoDB, aguarde..."
	wget -qO - $KEYSRVMONGODB | apt-key add - &>> $LOG
	cp -v conf/mongodb-org-3.4.list /etc/apt/sources.list.d/ &>> $LOG
echo -e "Repositório do MongoDB adicionado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Adicionando o repositório do Unifi Controller, aguarde..."
	wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg $KEYUNIFI &>> $LOG
	cp -v conf/100-ubnt-unifi.list /etc/apt/sources.list.d/ &>> $LOG
echo -e "Repositório do Unifi Controller adicionado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Instalando as dependências do Unifi Controller, aguarde..."
	apt update &>> $LOG
	apt -y install ca-certificates apt-transport-https &>> $LOG
echo -e "Dependências do Unifi Controller instaladas com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Instalando o Java OpenJDK e OpenJRE, aguarde..."
	apt -y install openjdk-8-jdk openjdk-8-jre &>> $LOG
	java -version &>> $LOG
	update-java-alternatives -l &>> $LOG
echo -e "OpenJDK e OpenJRE instalado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Instalando o Unifi Controller, aguarde..."
	apt install -y unifi &>> $LOG
echo -e "Unifi Controller instalado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Habilitando o Serviço do Unifi Controller, aguarde..."
	systemctl enable unifi &>> $LOG
	systemctl restart unifi &>> $LOG
echo -e "Serviço do Unifi Controller habilitado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Verificando as portas de conexões do MongoDB e do Unifi Controller, aguarde..."
	netstat -an | grep '27017\|8080\|8443'
echo -e "Portas de conexões verificadas com sucesso!!!, continuando com o script...\n"
sleep 5
#
read
exit 1
