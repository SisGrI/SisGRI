package org.sisgri.authentication

import org.sisgri.people.NaturalPerson

class Profile {

	transient springSecurityService

	String username
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static belongsTo = [person: NaturalPerson]

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		person blank: false, unique:true
		enabled display: false
		accountExpired display: false
		accountLocked display: false
		passwordExpired display: false
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		ProfileRole.findAllByProfile(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}

	boolean deleteProfileCurrent(Profile profileInstance) {
        if(springSecurityService.currentUser == profileInstance) {
            profileInstance.person.discard()
            ProfileRole.removeAll(profileInstance)
            profileInstance.delete flush:true

            return true
        }
        else {
            profileInstance.person.discard()
            ProfileRole.removeAll(profileInstance)
            profileInstance.delete flush:true

            return false
        }
    }

    String toString(){
		return username
	}
}
