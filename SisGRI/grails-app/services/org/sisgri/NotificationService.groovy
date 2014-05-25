package org.sisgri

import grails.transaction.Transactional

@Transactional
class NotificationService {

    def mailService

    def sendProfile(String email, String mensagem){
    	mailService.sendMail{
    		to email
    		from "programacaotestes@gmail.com"
    		subject "Recuperar Dados - SisGRI"
    		body mensagem
    	}
    }
}
