package org.sisgri.people

import org.sisgri.church.Church
import org.sisgri.authentication.Profile
import java.text.SimpleDateFormat

class NaturalPerson extends Person {

	boolean situation
	String cellular
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
	String type
	String post

    static hasOne = [profile:Profile]
    static belongsTo = [church:Church]

    static transients = ['stringBirth', 'stringBaptism', 'stringMemberSince', 'stringMarriageDate', 'stringConversion']

    static constraints = {
        church blank:false
    	cpf nullable:true, unique:true
    	rg nullable:true, unique:true
    	situation blank:false
    	profession nullable:true
    	cellular nullable:true
    	birth nullable:true, attributes:[years:1920..2014]
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
    	department blank:false, inList:['Varões','Senhoras','Jovens','Crianças']
    	type blank:false, inList:['Congregado','Membro']
    	post nullable:true, inList:['Cooperador(a)','Diácono(a)','Presbítero','Evangelista','Missionário(a)','Pastor']
        profile nullable:true, display: false
    }

    public String getStringBirth() {
        if(this.birth != null)
            return new SimpleDateFormat("dd/MM/yyyy").format(this.birth)
        else
            return ""
    }

    public void setStringBirth(String stringBirth) {
        if(stringBirth != null && stringBirth != "") {
            this.birth = new SimpleDateFormat("dd/MM/yyyy").parse(stringBirth)
        }
    }

    public String getStringBaptism() {
        if(this.baptism != null)
            return new SimpleDateFormat("dd/MM/yyyy").format(this.baptism)
        else
            return ""
    }

    public void setStringBaptism(String stringBaptism) {
        if(stringBaptism != null && stringBaptism != "") {
            this.baptism = new SimpleDateFormat("dd/MM/yyyy").parse(stringBaptism)
        }
    }

    public String getStringMemberSince() {
        if(this.memberSince != null)
            return new SimpleDateFormat("dd/MM/yyyy").format(this.memberSince)
        else
            return ""
    }

    public void setStringMemberSince(String stringMemberSince) {
        if(stringMemberSince != null && stringMemberSince != "") {
            this.memberSince = new SimpleDateFormat("dd/MM/yyyy").parse(stringMemberSince)
        }
    }

    public String getStringMarriageDate() {
        if(this.marriageDate != null)
            return new SimpleDateFormat("dd/MM/yyyy").format(this.marriageDate)
        else
            return ""
    }

    public void setStringMarriageDate(String stringMarriageDate) {
        if(stringMarriageDate != null && stringMarriageDate != "") {
            this.marriageDate = new SimpleDateFormat("dd/MM/yyyy").parse(stringMarriageDate)
        }
    }

    public String getStringConversion() {
        if(this.conversion != null)
            return new SimpleDateFormat("dd/MM/yyyy").format(this.conversion)
        else
            return ""
    }

    public void setStringConversion(String stringConversion) {
        if(stringConversion != null && stringConversion != "") {
            this.conversion = new SimpleDateFormat("dd/MM/yyyy").parse(stringConversion)
        }
    }
}
