package racetrack

class Registration {

    // Registrazione di un partecipante
    Date dateCreated
    Date birthDate
    String emailAddress
    String gender
    String name
    String surname
    String postalAddress
    String comRes // Comune di residenza
    String mobilePhone
    Race race



    static constraints = {
        name nullable: true
        surname nullable: true
        gender nullable: true, inList: ['Uomo','Donna']
        birthDate nullable: true
        postalAddress nullable: true
        emailAddress nullable: true, email: true
        dateCreated nullable: true
        comRes nullable: true
        mobilePhone nullable: true
        race nullable: true

    }

    String toString() {
        return "${name} ${surname}, ${emailAddress}"
    }
}
