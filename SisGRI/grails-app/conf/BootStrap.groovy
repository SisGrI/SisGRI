import org.sisgri.authentication.Role
import org.sisgri.authentication.Profile
import org.sisgri.authentication.ProfileRole
import org.sisgri.people.Person
import org.sisgri.church.Headquarter

class BootStrap {

   def init = { servletContext ->
      def headquarter = new Headquarter(name:'Igreja Sede', address:'Ocidental').save(flush:true)

      Date dateConversion = new Date()

      def testPerson = new Person(church:headquarter, name: 'Álex', address: 'a', 
         city:'sa', zipCode:'d', birthPlace:'s', cpf:'s', rg:'s', maritalStatus:'Solteiro(a)',
         department:'Varões', post:'Congregado', observation: 'd', situation: true, email: 'alex@unb.br',
         birth: dateConversion).save(flush: true)

      def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
      
      def testProfile = new Profile(username: 'admin', password: 'admin', person: testPerson)
      
      testProfile.save(flush: true)


      ProfileRole.create testProfile, adminRole, true
   }
   
}