import org.sisgri.authentication.Role
import org.sisgri.authentication.User
import org.sisgri.authentication.UserRole

class BootStrap {

   def init = { servletContext ->
        Date dateConversion = new Date()

      def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)

      def testUser = new User(username: 'admin', password: '123456', name: 'Álex', address: 'a', 
         city:'sa', zipCode:'d', birthPlace:'s', cpf:'s', rg:'s', maritalStatus:'Solteiro(a)',
         department:'Varões', post:'Congregado', observation: 'd', situation: true,
         birth: dateConversion)
      
      testUser.save(flush: true)

      UserRole.create testUser, adminRole, true

   }
}