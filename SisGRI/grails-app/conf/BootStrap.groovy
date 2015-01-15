import org.sisgri.authentication.Role
import org.sisgri.authentication.Profile
import org.sisgri.authentication.ProfileRole
import org.sisgri.people.Person
import org.sisgri.church.Headquarter

class BootStrap {

   def init = { servletContext ->
      if (!Headquarter.get(1)) {
            def headquarter = new Headquarter(name:'Igreja Sede', address:'Ocidental').save(flush:true)

            def testPerson = new Person(church:headquarter, name: 'Administrador', address: 'Ocidental',
               city:'Ocidental', zipCode:'00000-000', birthPlace:'Ocidental', cpf:'000.000.000-00', rg:'0000000', maritalStatus:'Solteiro(a)',
               department:'Varões', type:'Congregado', situation: true, email: 'administrador@sisgri.com',
               birth: new Date()).save(flush: true)

            def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
            def secretaryRole = new Role(authority: 'ROLE_SECRETARY').save(flush: true)
            def treasurerRole = new Role(authority: 'ROLE_TREASURER').save(flush: true)

            def testProfile = new Profile(username: 'admin', password: 'admin', person: testPerson)

            testProfile.save(flush: true)


            ProfileRole.create testProfile, adminRole, true
      }
   }

}
