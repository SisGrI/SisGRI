package org.sisgri.authentication

import org.sisgri.people.Person

class Profile {

	transient springSecurityService

	String username
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static belongsTo = [person: Person]

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		person nullable: false, unique:true
		enabled display: false
		accountExpired display: false
		accountLocked display: false
		passwordExpired display: false
	}

	static mapping = {
		person cascade: "save-update"
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
}
