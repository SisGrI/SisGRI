package org.sisgri.register

class Entry extends Register{

	String category
	String name
	float value

    static constraints = {
    	category blank:false, inList:['1.01 - (*) DIZIMO OBREIROS', '1.02 - (*) DIZIMO MEMBROS', 
    		'1.03 - (*) OFERTA DOS CULTOS', '1.04 - (*) ESCOLA DOMINICAL', 
    		'1.05 - REPASSE DE SUB-SEDE', '1.06 - REPASSE CONGREGAÇÃO', 
    		'1.07 - REPASSE SUB-CONGREG.', '1.08 - REPASSE CONG. ADOLESC.', 
    		'1.09 - REPASSE CONG. MISSÕES', '1.10 - REPASSE CONG. CIBE', 
    		'1.11 - REPASSE CONG. MISSÕES', '1.12 - OFERTAS CIBE', '1.13 - OFERTAS MOCIDADE', 
    		'1.14 - OFERTAS ADOLESCENTES', '1.15 - OFERTAS CRIANÇAS', '1.16 - OFERTAS MISSÕES', 
    		'1.17 - OFERTAS ESPECÍFICAS', '1.18 - VENDA BENS MOV/IMÓVEIS', 
    		'1.19 - VENDA REVISTA EBD/JORNAIS', '1.20 - RECEITAS FINANCEIRAS', 
    		'1.21 - TAXA CARTÃO MEMBRO', '1.22 - TAXA ESCOLA MÚSICA', 
    		'1.23 - TAXA CONS. DIACONAL', '1.24 - OUTRAS TREC.E RENDA', 
    		'1.25 - REPASSE ADMINIST. SEDE', '1.99 - EMPRESTÍMO ADQUIRIDOS']
    	name blank: false
		value blank: false
    }

    static mapping = {
        table 'entry_register'
    }

    String toString() {
        "$category"
    }
}