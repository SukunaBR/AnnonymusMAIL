#!/bin/bash
# Author: MP Server Inc.
# https://github.com/SukunaBR

function banner(){
    echo -e "${red}"
    echo -e "    SEND ANONYMOUS EMAIL SPAM   "
    echo -e "                                "
    echo -e "       AnnonymusMAIL v1.0       "
    echo -e "                                "
    echo -e "    ${yellow} Made by MP Server Inc.${end}\n"
}


PWD=$(pwd)
source ${PWD}/.tools/doc/var.sh


trap ctrl_c int
function ctrl_c(){
    clear
    banner
    echo -e "\n${green}[${white}${flicker}*${end}${green}] Você está saindo do painel. ${end}"
    sleep 3; clear
    exit 1
}



function server(){
    sleep 1
    echo -e "${green} Servidor: ${red} > 1${end} \n"
    echo -e "${green} Servidor: ${red} > 2${end} \n"
    echo -e "${green} Servidor: ${red} > 3${end} \n"
    read -p $'\033[1;32m Servidor \033[0;31m> \033[0m' server

    case $server in

        1) servidor=$server1
        fakemail
        ;;

        2) servidor=$server2
        fakemail
        ;;
        
        3) servidor=$server3
        fakemail
        ;;
        *)  clear; banner
            echo -e "\n${green}[${white}${flicker}*${end}${green}] Você está saindo do painel. ${end}"
            sleep 3; clear
        ;;

    esac
}


function fakemail(){

    clear; banner; sleep 1

    read -p $'\033[1;32mEMAIL FAKE \033[0;31m> \033[0m' faker
    clear; banner

    read -p $'\033[1;32mEMAIL ALVO \033[0;31m> \033[0m' fakiado
    clear; banner

    read -p $'\033[1;32mTÍTULO \033[0;31m> \033[0m' title
    clear; banner

    read -p $'\033[1;32mMENSAGEM \033[0;31m> \033[0m' message
    sleep 1; clear; banner

    echo -e "${white} O email será enviado assim: \n ${end}" 
    echo -e "${red} > Spoofer:${green} $faker ${end} \n"
    echo -e "${red} > Alvo:${green}  $fakiado ${end} \n"
    echo -e "${red} > Título:${green}  $title ${end} \n"
    echo -e "${red} > Mensagem:${green}  $message ${end} \n"
    
    sleep 1

    read -p $'\033[1;32m Tem certeza de que deseja enviar email? \033[0;31m[s/n] > \033[0m' sure
    case $sure in

		s)
		curl --data "destinatario=$fakiado && assunto=$title && mensagem=$message && remetente=$faker" $server 
        clear
        banner
        sleep 1
        echo -e "\n${green}[${red}+${green}]${end} Sucesso! "
		;;	

		n)
			clear
            banner
            exit 1
        ;;

        *)  clear; banner
            echo -e "\n${green}[${white}${flicker}*${end}${green}] Você está saindo do painel. ${end}"
            sleep 3
        ;;

    esac

}

function main(){
    clear
    banner
    sleep 1
    server
}

main