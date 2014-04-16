import org.sisgri.authentication.Role
import org.sisgri.authentication.User
import org.sisgri.authentication.UserRole

class BootStrap {

   def init = { servletContext ->

      def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)

      def testUser = new User(username: 'admin', password: '123456')
      testUser.save(flush: true)

      UserRole.create testUser, adminRole, true

   }
}