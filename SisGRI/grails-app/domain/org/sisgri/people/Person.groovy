package org.sisgri.people

class Person {
	byte[] photo
	boolean situation
	String name
	String address
	String city
	String zipCode
	String telephone
	String cellular
	String email
	Date birth
	String birthPlace
	String father
	String mother
	Date baptism
	Date memberSince
	String cpf
	String rg
	String maritalStatus
	String spouse
	Date marriageDate
	String department
	String profession
	boolean baptismHollySpirit
	Date conversion
	String post
	String observation

    static constraints = {
    	photo nullable:true
    	name blank:false
    	cpf blank:false
    	rg blank:false
    	situation blank:false
    	profession nullable:true
    	address blank:false
    	city blank:false
    	zipCode blank:false
    	telephone nullable:true
    	cellular nullable:true
    	email nullable:true, email:true
    	birth blank:false, attributes:[years:1920..2014]
    	birthPlace blank:false
    	father nullable:true
    	mother nullable:true
    	baptism nullable:true, attributes:[years:1920..2014]
    	memberSince nullable:true, attributes:[years:1920..2014]
    	conversion nullable:true, attributes:[years:1920..2014]
    	baptismHollySpirit nullable:true
    	maritalStatus blank:false, inList:['Solteiro(a)','Casado(a)','Divorciado(a)','Viuvo(a)' ]
    	spouse nullable:true
    	marriageDate nullable:true, attributes:[years:1920..2014]
    	department blank:false, inList:['Varões','Senhoras','Jovens', 'Adolescentes','Crianças']
    	post blank:false, inList:['Congregado','Membro','Cooperador(a)','Diácono(a)','Presbítero','Evangelista','Missionário(a)','Pastor']
    	observation nullable:true, widget:'textarea'
    }

    static mapping = {
    	photo sqlType:'longblob'
    }
}
