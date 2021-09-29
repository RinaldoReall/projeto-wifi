#!/bin/bash

# Originalmente Criado por Robson Vaamonde
# Adptação e melhorias no Script por TechLabs Technology
# Versão: 0.06

# Testado e homologado para a versão do Ubuntu Server 18.04.x LTS x64
# Testado e homologado para a versão do Unifi Controller 6.2.x, MongoDB 3.6.x, OpenJDK e OpenJRE 8.x

UBUNTU=$(lsb_release -rs)
LOG="/var/log/$(echo $0 | cut -d'/' -f2)"

export DEBIAN_FRONTEND="noninteractive"
#
echo
echo -e "## --- Instalação do Unifi Controller - Ubuntu Server 18.04 ARM64 Raspberry Pi --- ##\n"
sleep 5
#
echo -e "[TECHLABS] Adicionando o Repositório Universal do Apt"
	add-apt-repository universe &>> $LOG
echo -e "[OK]\n"
sleep 5
#
echo -e "[TECHLABS] Adicionando o Repositório Multiversão do Apt"
	add-apt-repository multiverse &>> $LOG
echo -e "[OK]\n"
sleep 5
#
echo -e "[TECHLABS] Atualizando as listas do Apt"
	apt update &>> $LOG
echo -e "[OK]\n"
sleep 5
#
echo -e "[TECHLABS] Atualizando sistema"
	apt -y upgrade &>> $LOG
	#apt -y full-upgrade &>> $LOG
	#apt -y dist-upgrade &>> $LOG
echo -e "[OK]\n"
sleep 5
#
echo -e "[TECHLABS] Removendo os software desnecessários"
	apt -y autoremove &>> $LOG
	apt -y autoclean &>> $LOG
echo -e "[OK]\n"
sleep 5
#
echo -e "## --- Instalando o Unifi Controller --- ##\n"
#
echo -e "[TECHLABS] Adicionando o repositório do MongoDB"
	wget -qO - https://www.mongodb.org/static/pgp/server-3.4.asc | apt-key add - &>> $LOG
	cp -v arquivos/mongodb-org-3.4.list /etc/apt/sources.list.d/ &>> $LOG
echo -e "[OK]\n"
sleep 5
#
echo -e "[TECHLABS] Adicionando o repositório do Unifi Controller"
	wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg &>> $LOG
	cp -v arquivos/ubnt-unifi.list_pi /etc/apt/sources.list.d/ &>> $LOG
echo -e "[OK]\n"
sleep 5
#
echo -e "[TECHLABS] Instalando as dependências do Unifi Controller"
	apt update &>> $LOG
	apt -y install ca-certificates apt-transport-https &>> $LOG
echo -e "[OK]\n"
sleep 5
#
echo -e "[TECHLABS] Instalando o Java OpenJDK e OpenJRE"
	apt -y install openjdk-8-jdk openjdk-8-jre &>> $LOG
	java -version &>> $LOG
	update-java-alternatives -l &>> $LOG
echo -e "[OK]\n"
sleep 5
#
echo -e "[TECHLABS] Instalando o Unifi Controller"
	apt install -y unifi &>> $LOG
echo -e "[OK]\n"
sleep 5
#
echo -e "[TECHLABS] Habilitando o Serviço do Unifi Controller"
	systemctl enable unifi &>> $LOG
	systemctl restart unifi &>> $LOG
echo -e "[OK]\n"
sleep 5
#
echo -e "[TECHLABS] Instalação do Unifi Controller feita com Sucesso"
echo -e "Acesse o Unifi Controller pela URL: https://$(hostname -I | cut -d' ' -f1):8443/\n"
echo -e "É necessário realizar o cadastro no https://account.ui.com\n"
echo -e "Pressione <Enter> para concluir o processo."
read
exit 1
