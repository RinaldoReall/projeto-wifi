#!/bin/bash

# Originalmente Criado por Robson Vaamonde
# Data de criação: 06/01/2021

# Adptação e melhorias no Scriot por TechLabs Technology
# Data de atualização: 29/09/2021

# Versão: 1.06

# Testado e homologado para a versão do Ubuntu Server 18.04.x LTS x64
# Testado e homologado para a versão do Unifi Controller 6.2.x, MongoDB 3.6.x, OpenJDK e OpenJRE 8.x

UBUNTU=$(lsb_release -rs)
LOG="/var/log/$(echo $0 | cut -d'/' -f2)"
#KEYSRVMONGODB="https://www.mongodb.org/static/pgp/server-3.4.asc"
#KEYUNIFI="https://dl.ui.com/unifi/unifi-repo.gpg"
export DEBIAN_FRONTEND="noninteractive"
clear
#
clear
if [ "$(nc -vz 127.0.0.1 8080 ; echo $?)" == "0" ]
	then
		echo -e "A porta: 8080 já está sendo utilizada nesse servidor.\n"
		echo -e "Verifique a porta e o serviço associada a ela e execute novamente esse script.\n"
		exit 1
	else
		echo -e "A porta: 8080 está disponível..."
		sleep 5
fi
#
if [ "$(nc -vz 127.0.0.1 8443 ; echo $?)" == "0" ]
	then
		echo -e "A porta: 8443 já está sendo utilizada nesse servidor.\n"
		echo -e "Verifique a porta e o serviço associada a ela e execute novamente esse script.\n"
		exit 1
	else
		echo -e "A porta: 8443 está disponível..."
		sleep 5
fi
#
if [ "$(nc -vz 127.0.0.1 27017 ; echo $?)" == "0" ]
	then
		echo -e "A porta: 27017 já está sendo utilizada nesse servidor.\n"
		echo -e "Verifique a porta e o serviço associada a ela e execute novamente esse script.\n"
		exit 1
	else
		echo -e "A porta: 27017 está disponível..."
		sleep 5
fi
#
clear
#
echo
echo -e "Instalação do Unifi Controller no GNU/Linux Ubuntu Server 18.04.x\n"
echo -e "Aguarde, esse processo demora um pouco dependendo do seu Link de Internet...\n"
sleep 5
#
echo -e "Adicionando o Repositório Universal do Apt, aguarde..."
	add-apt-repository universe &>> $LOG
echo -e "[OK]\n"
sleep 5
#
echo -e "Adicionando o Repositório Multiversão do Apt, aguarde..."
	add-apt-repository multiverse &>> $LOG
echo -e "[OK]\n"
sleep 5
#
echo -e "Atualizando as listas do Apt, aguarde..."
	apt update &>> $LOG
echo -e "[OK]\n"
sleep 5
#
echo -e "Atualizando todo o sistema, aguarde..."
	apt -y upgrade &>> $LOG
	#apt -y full-upgrade &>> $LOG
	#apt -y dist-upgrade &>> $LOG
echo -e "[OK]\n"
sleep 5
#
echo -e "Removendo os software desnecessários, aguarde..."
	apt -y autoremove &>> $LOG
	apt -y autoclean &>> $LOG
echo -e "[OK]\n"
sleep 5
#
echo -e "Instalando o Unifi Controller, aguarde...\n"
#
echo -e "Adicionando o repositório do MongoDB, aguarde..."
	#wget -qO - $KEYSRVMONGODB | apt-key add - &>> $LOG
	wget -qO - https://www.mongodb.org/static/pgp/server-3.4.asc | apt-key add - &>> $LOG
	cp -v mongodb-org-3.4.list /etc/apt/sources.list.d/ &>> $LOG
echo -e "[OK]\n"
sleep 5
#
echo -e "Adicionando o repositório do Unifi Controller, aguarde..."
	#wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg $KEYUNIFI &>> $LOG
	wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg &>> $LOG
	cp -v ubnt-unifi.list /etc/apt/sources.list.d/ &>> $LOG
echo -e "[OK]\n"
sleep 5
#
echo -e "Instalando as dependências do Unifi Controller, aguarde..."
	apt update &>> $LOG
	apt -y install ca-certificates apt-transport-https &>> $LOG
echo -e "[OK]\n"
sleep 5
#
echo -e "Instalando o Java OpenJDK e OpenJRE, aguarde..."
	apt -y install openjdk-8-jdk openjdk-8-jre &>> $LOG
	java -version &>> $LOG
	update-java-alternatives -l &>> $LOG
echo -e "[OK]\n"
sleep 5
#
echo -e "Instalando o Unifi Controller, aguarde..."
	apt install -y unifi &>> $LOG
echo -e "[OK]\n"
sleep 5
#
echo -e "Habilitando o Serviço do Unifi Controller, aguarde..."
	systemctl enable unifi &>> $LOG
	systemctl restart unifi &>> $LOG
echo -e "[OK]\n"
sleep 5
#
echo -e "Verificando as portas de conexões do MongoDB e do Unifi Controller, aguarde..."
	netstat -an | grep '27017\|8080\|8443'
echo -e "[OK]\n"
sleep 5
#
echo -e "Instalação do Unifi Controller feita com Sucesso!!!."
echo -e "Acesso ao Unifi Controller pela URL: https://$(hostname -I | cut -d' ' -f1):8443/\n"
echo -e "Para finalizar a instalação via Web você precisa de uma conta (ID-SSO) no https://account.ui.com\n"
echo -e "Pressione <Enter> para concluir o processo."
read
exit 1
