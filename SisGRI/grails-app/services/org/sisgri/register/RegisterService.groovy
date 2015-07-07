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

            date = date.parse("dd/MM/yyy", "01/" + params.month + "/" + params.year)
    		params.from = new SimpleDateFormat("dd/MM/yyyy").format(date)
    		
            Calendar calendar = Calendar.getInstance()
            calendar.setTime(date)
            def lastDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH)
            date = date.parse("dd/MM/yyy", lastDay + "/" + params.month + "/" + params.year)
            params.to = new SimpleDateFormat("dd/MM/yyyy").format(date)
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
        def parameters = setRegisters(registers, getPreviousBalance(params))

        parameters.each { key, value ->
            params[key] = value
        }
    }

    private def setRegisters(registers, previousBalance) {
        def parameters = [:]

        for (int i = 1; i <= 26; i++) {
            parameters["entry"+i] = 0.0
        }
        for (int i = 1; i <= 68; i++) {
            parameters["exit"+i] = 0.0
        }

        Double entryTotal = 0.0, exitTotal = 0.0

        registers.each {
        	String type = "", number = ""

            if (it.entryRegister) {
                if (it.entryRegister != "Saldo Anterior") {
                    type = "entry"
                    entryTotal += it.value
                    number = it.entryRegister.substring(2,4)
                }
            }
            else {
            	type = "exit"
            	exitTotal += it.value
            	number = it.exitRegister.substring(2,4)
            }

            if (number != "") {
                if (number[0] == '0')
                    parameters[type + number[1]] = parameters[type + number[1]] + it.value
                else
                    parameters[type + number] = parameters[type + number] + it.value
            }
        }
        
        entryTotal += previousBalance
        parameters.previousBalance = "R\$" + String.format("%10.2f", previousBalance)
        
        parameters.entryTotal = "R\$" + String.format("%10.2f", entryTotal)
        parameters.exitTotal = "R\$" + String.format("%10.2f", exitTotal)

        for (int i = 1; i <= 26; i++) {
            parameters["entry"+i] = "R\$" + String.format("%10.2f", parameters["entry"+i])
        }
        for (int i = 1; i <= 68; i++) {
            parameters["exit"+i] = "R\$" + String.format("%10.2f", parameters["exit"+i])
        }

        return parameters
    }

    private def getPreviousBalance(params) {
        Date date = new Date()
        def month = params.month.toInteger() - 1
        def year = params.year.toLong()

        if (!month) {
            month = 12;
            year--;
        }
        
        date = date.parse("dd/MM/yyyy", "01/" + month + "/" + year)

        def register = Register.findByEntryRegisterAndDate("Saldo Anterior", date)

        return register ? register.value : 0.0
    }

    def calculateTransferAndBalance(register) {
        Date date = register.date
        Calendar calendar = Calendar.getInstance()
        calendar.setTime(date)

        def month = calendar.get(Calendar.MONTH)
        def year = calendar.get(Calendar.YEAR)

        date = date.parse("dd/MM/yyyy", "01/" + (month + 1) + "/" + year)

        setTranfer(register, date)
        setBalance(register, date)
    }

    def setTranfer(register, date) {
        if (register.type != "Entrada" && register.entryRegister != "1.01 - (*) DIZIMO OBREIROS" &&
            register.entryRegister != "1.02 - (*) DIZIMO MEMBROS" && register.entryRegister != "1.03 - (*) OFERTA DOS CULTOS" &&
            register.entryRegister != "1.04 - (*) OFERTA E.B.D" && register.entryRegister != "1.05 - (*) OFERTAS ESPECÍFICA") {
            return
        }

        def transfer = Register.findByExitRegisterAndDate("2.01 - REPASSE P/ SEDE", date)

        if (!transfer) {
            transfer = new Register(date: date, type: "Saída", exitRegister: "2.01 - REPASSE P/ SEDE",
                value: 0.0, church: register.church).save(flush: true)
        }

        transfer.value += register.value * 0.3
        transfer.save(flush: true)
    }

    def setBalance(register, date) {
        def transfer = Register.findByExitRegisterAndDate("2.01 - REPASSE P/ SEDE", date)
        def balance = Register.findByEntryRegisterAndDate("Saldo Anterior", date)

        if (!balance) {
            balance = new Register(date: date, type: "Entrada", entryRegister: "Saldo Anterior",
                value: 0.0, church: register.church).save(flush: true)
        }

        if (register.type == "Entrada") {
            balance.value += register.value
        }
        else {
            balance.value -= register.value
        }

        balance.save(flush: true)
    }
}
