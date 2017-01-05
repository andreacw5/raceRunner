package racetrack

class BootStrap {

    def init = { servletContext ->

        // RUOLI DEGLI UTENTI
        def adminRole = new Role(authority: 'ROLE_ADMIN', permission: "Amministratore").save()
        def userRole = new Role(authority: 'ROLE_USER', permission: "Utente").save()

        // UTENTI
        def testUser2 = new User(username: 'mRossi', password: 'password', role: userRole, userName: "Mario", userSurname: "Rossi", userSex: "M").save()
        def testUser = new User(username: 'admin', password: '1234', role: adminRole, userName: "Def", userSurname: "Def", userSex: "M").save()

        UserRole.create testUser2, userRole
        UserRole.create testUser, adminRole

    }
    def destroy = {
    }
}
