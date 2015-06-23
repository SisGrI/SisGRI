package org.sisgri.register

import java.text.SimpleDateFormat
import grails.transaction.Transactional

@Transactional
class RegisterService {

    def springSecurityService
    def parameters = []
    String total = ""

    def setParameters(params) {
        def category = "Lista Geral"
        
        if (params.entryRegister != "") {
            category = params.entryRegister
        }
        else if (params.exitRegister != "") {
            category = params.exitRegister
        }

        parameters = [churchName: springSecurityService.currentUser.person.church.name,
            category: category, from: params.from, to: params.to, total: total]
    }

    def setRestrictDates(params) {
    	if (params.from == "" && params.to == "") {
    		Date date = new Date()

    		params.from = new SimpleDateFormat("dd/MM/yyyy").format(date)
    		params.to = new SimpleDateFormat("dd/MM/yyyy").format(date)
    	}
    	else if (params.from != "" && params.to == "") {
            params.to = params.from
        }
        else if (params.to != "" && params.from == "") {
            params.from = params.to
        }

        return params
    }

    def setTotal(registers) {
        Double result = 0

        registers.each {
            result += it.value
        }

        total = "R\$" + String.format("%10.2f", result)
    }

    def setCityArticle(params, registers) {
        def parameters = [:]
        parameters += setIns(params, registers)

        parameters.each { key, value ->
            params[key] = value
        }
    }

    private def setIns(params, registers) {
        def parameters = [:]

        for (int i = 1; i <= 26; i++) {
            parameters["entry"+i] = 0.0
        }

        Double total = 0.0

        registers.each {
            total += it.value

            String number = it.entryRegister.substring(2,4)

            if (number[0] == '0')
                parameters["entry"+number[1]] = parameters["entry"+number[1]] + it.value
            else
                parameters["entry"+number] = parameters["entry"+number] + it.value
        }
        
        params.entryTotal = "R\$" + String.format("%10.2f", total)

        for (int i = 1; i <= 26; i++) {
            parameters["entry"+i] = "R\$" + String.format("%10.2f", parameters["entry"+i])
        }

        return parameters
    }
}
