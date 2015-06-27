import org.sisgri.authentication.Role
import org.sisgri.authentication.Profile
import org.sisgri.authentication.ProfileRole
import org.sisgri.people.NaturalPerson
import org.sisgri.church.Church
import org.sisgri.register.Register

class BootStrap {

   def init = { servletContext ->
      if (!Church.get(1)) {
            def church = new Church(name:'ADOCI JARDIM ABC',
               address:'Quadra 20, Lote X, Parque das Américas').save(flush:true)

            def testNaturalPerson = new NaturalPerson(church:church, name: 'Administrador', address: 'Ocidental',
               city:'Ocidental', zipCode:'00000-000', birthPlace:'Ocidental', cpf:'000.000.000-00', rg:'0000000', maritalStatus:'Solteiro(a)',
               department:'Varões', type:'Congregado', situation: true, email: 'administrador@sisgri.com',
               birth: new Date()).save(flush: true, failOnError: true)

            def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
            def secretaryRole = new Role(authority: 'ROLE_SECRETARY').save(flush: true)
            def treasurerRole = new Role(authority: 'ROLE_TREASURER').save(flush: true)

            def testProfile = new Profile(username: 'admin', password: 'admin', person: testNaturalPerson)

            testProfile.save(flush: true)

            ProfileRole.create testProfile, adminRole, true
      }

      if (!Register.get(1)) {
         def church = Church.get(1)

         def date = new Date()
         Calendar calendar = Calendar.getInstance()
         calendar.setTime(date)

         def month = calendar.get(Calendar.MONTH)
         def year = calendar.get(Calendar.YEAR)

         date = date.parse("dd/MM/yyyy", "01/" + (month) + "/" + year)
         new Register(date: date, type: "Entrada", entryRegister: "Saldo Anterior",
            value: 0.0, church: church).save(flush: true)

         date = date.parse("dd/MM/yyyy", "01/" + (month + 1) + "/" + year)
         new Register(date: date, type: "Saída", exitRegister: "2.01 - REPASSE P/ SEDE",
            value: 0.0, church: church).save(flush: true)
      }
   }

}
