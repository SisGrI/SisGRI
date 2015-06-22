package org.sisgri.register

import org.sisgri.church.Church
import org.sisgri.people.Person
import java.text.SimpleDateFormat

class Register {
	Date date = new Date()
    Person person
	String name
	String type
    String entryRegister
    String exitRegister
	Double value

	static belongsTo = [church: Church]

    static transients = ['formatedValue', 'stringDate']

    static constraints = {
    	church blank: false
    	date blank: false
    	type blank: false, inList: ['Entrada', 'Saída']
        entryRegister nullable: true, inList: ['1.01 - (*) DIZIMO OBREIROS', '1.02 - (*) DIZIMO MEMBROS', 
            '1.03 - (*) OFERTA DOS CULTOS', '1.04 - (*) OFERTA E.B.D', '1.05 - (*) OFERTAS ESPECÍFICAS',
            '1.06 - VENDA DE BENS MÓVEIS/IMÓVEIS', '1.07 - VINDO SUB-SEDE/CONG.',
            '1.08 - REPASSE DE CONG. ADOLESCENTES', '1.09 - REPASSE DE CONG. CRIANÇAS',
            '1.10 - REPASSE DE CONG. CIBE', '1.11 - REPASSE MISSÕES',
            '1.12 - OFERTA CIBE', '1.13 - OFERTA MOCIDADE', '1.14 - OFERTA ADOLESCENTES',
            '1.15 - OFERTA CRIANÇAS', '1.16 - OFERTA MISSÕES', '1.17 - REPASSE CONGREGAÇÃO',
            '1.18 - OUTRAS TAXAS, REC, REND.', '1.19 - VENDA REVISTAS',
            '1.20 - REPASSE ADM. P/ SEDE', '1.22 - TAXA ESC. MÚSICA',
            '1.23 - TAXA CONS. DIACONAL', '1.24 - AQUIS. IMÓVEIS', '1.25 - OFERTA CONAMAD',
            '1.26 - EMPRES. ADIQUIRIDO']
        exitRegister nullable: true, inList: ['2.01 - REPASSE P/ SEDE', '2.02 - REP. CONGRESSO JOVENS', 
            '2.03 - REP. CONGRES. ADOLESCENTES', '2.04 - REP. CONGRES. CRIANÇAS', 
            '2.05 - REP. CONGRESSO CIBE', '2.06 - REP. CONGRESSO MISSÕES', 
            '2.07 - REP. OUTRAS FINALIDADES', '2.08 - REP. P/ CONGREGAÇÃO', 
            '2.09 - AJUDA SOCIAL', '2.10 - CONGRESSO DE JOVENS', '2.11 - DEP. MUSICAL', 
            '2.12 - DEP. E.B.D', '2.13 - DEP. CIBE/CIBEC', '2.14 - DEP. MOCIDADE', 
            '2.15 - DEP. ADOLESCENTES', '2.16 - DEP. CRIANÇAS', '2.17 - DEP. MISSÕES', 
            '2.18 - AUXILIO OBREIRO', '2.19 - PREBENDA PASTORAL', 
            '2.20 - AGUA/LUZ PASTORAL', '2.21 - ANUIDADES CONVENCIONAIS', 
            '2.22 - VIAGENS E ESTADIAS', '2.23 - CONS. TEMPLOS', 
            '2.24 - DESPESAS C/ FESTIVIDADES', '2.25 - DESPESAS C/ VESTUÁRIOS', 
            '2.26 - SEGUROS EM GERAL', '2.27 - PRODUTOS ALIMENTÍCIOS', 
            '2.28 - FOLHA PGAMENTO EMPREGADOS', '2.29 - 13º SALÁRIO', '2.30 - FÉRIAS DE EMPREGADOS', 
            '2.31 - INSS - FOLHA DE PAGAMENTO', '2.32 - INSS - OBREIROS', '2.33 - FGTS - EMPREGADOS', 
            '2.34 - REPASSE CONAMAD', '2.35 - PIS FOLHA PAGAMENTO', 
            '2.36 - RECOLHIMENTO IRRF', '2.37 - MULTAS E JUROS', 
            '2.38 - OUTROS IMPOSTOS E TAXAS', '2.39 - ENERGIA ELÉTRICA', '2.40 - ÁGUA E ESGOTO', 
            '2.41 - TELEFONES/INTERNET', '2.42 - MAT. ELET./CONST.', '2.43 - MATERIAL DE LIMPEZA', 
            '2.44 - MATERIAL DE EXPEDIENTE', '2.45 - MATERIAL DE CONSUMO', 
            '2.46 - MATERIAL SANTA-CEIA', '2.47 - MANUTEÇÃO VEÍCULO', 
            '2.48 - COMBUST. LUBRIFICANTE', '2.49 - ALUGUEL IMÓVEIS TEMPLO', 
            '2.50 - FRETES E TANSPORTES', '2.51 - SERV. PESSOA JURÍDICA', '2.52 - SERV. PESSOA FÍSICA', 
            '2.53 - DESPESAS POSTAIS', '2.54 - TARIFAS BANCÁRIAS', '2.55 - REPAROS E MANUTENÇÃO', 
            '2.56 - PRESTAÇÃO DE IMÓVEIS', '2.57 - FOLHETO LITERATURA', 
            '2.58 - OUTRAS DESPESAS CUSTEIO', '2.59 - AQUIS. APARELHAGEM SOM', 
            '2.60 - AQUIS. MOVEIS E UTENSIL.', '2.61 - AQUIS. MAQ. E EQUIPAMENTOS', 
            '2.62 - AQUIS. EQUIP. INFORMATICA', '2.63 - AQUS. IMÓVEIS', '2.64 - AQUIS. VEÍCULOS', 
            '2.65 - BENS PEQ. VALOR', '2.66 - AQUIS. SOFTWARES', '2.67 - OFERTAS REPASSADAS', 
            '2.99 - PAGAMENTO EMPRÉSTIMO']
    	name blank: false
        person nullable: true
		value blank: false
    }

    String getFormatedValue() {
        return this.value ? "R\$" + String.format("%10.2f", this.value) : ""
    }

    public String getStringDate() {
        return new SimpleDateFormat("dd/MM/yyyy").format(this.date)
    }

    public void setStringDate(String stringDate) {
        if(stringDate != null && stringDate != "") {
            this.date = new SimpleDateFormat("dd/MM/yyyy").parse(stringDate)
        }
    }
}
