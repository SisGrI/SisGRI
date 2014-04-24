package org.sisgri.authentication

import org.apache.commons.lang.builder.HashCodeBuilder

class ProfileRole implements Serializable {

	private static final long serialVersionUID = 1

	Profile profile
	Role role

	boolean equals(other) {
		if (!(other instanceof ProfileRole)) {
			return false
		}

		other.profile?.id == profile?.id &&
			other.role?.id == role?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (profile) builder.append(profile.id)
		if (role) builder.append(role.id)
		builder.toHashCode()
	}

	static ProfileRole get(long profileId, long roleId) {
		ProfileRole.where {
			profile == Profile.load(profileId) &&
			role == Role.load(roleId)
		}.get()
	}

	static ProfileRole create(Profile profile, Role role, boolean flush = false) {
		new ProfileRole(profile: profile, role: role).save(flush: flush, insert: true)
	}

	static boolean remove(Profile u, Role r, boolean flush = false) {

		int rowCount = ProfileRole.where {
			profile == Profile.load(u.id) &&
			role == Role.load(r.id)
		}.deleteAll()

		rowCount > 0
	}

	static void removeAll(Profile u) {
		ProfileRole.where {
			profile == Profile.load(u.id)
		}.deleteAll()
	}

	static void removeAll(Role r) {
		ProfileRole.where {
			role == Role.load(r.id)
		}.deleteAll()
	}

	static mapping = {
		id composite: ['role', 'profile']
		version false
	}
}
