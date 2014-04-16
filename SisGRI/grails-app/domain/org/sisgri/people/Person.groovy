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
	Date batism
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
    	name blank:false
    	address blank:false
    	city blank:false
    	zipCode blank:false
    	birth blank:false
    	birthPlace blank:false
    	cpf blank:false
    	rg blank:false
    	maritalStatus blank:false, inList:['Solteiro(a)','Casado(a)']
    	department blank:false
    	post blank:false
    }

    static mapping = {
    	photo sqlType:'longblob'
    }
}
