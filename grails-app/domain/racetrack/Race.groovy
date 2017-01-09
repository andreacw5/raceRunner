package racetrack

class Race {

    // Informazioni richieste
    String city
    String civicAd
    String times
    String addressCode
    String postalCode
    String organizator
    int cost
    int distance
    String distanceType
    int maxRunners
    String raceName
    String raceType
    Date startDateName
    Sponsor sponsor

    static hasMany = [ registrations : Registration]

    static constraints = {
        city inList: ['Milano','Roma','Pisa']
        civicAd nullable: true
        times nullable: true
        addressCode nullable: true
        postalCode nullable: true
        organizator nullable: true
        raceType inList: ['Passo accellerato','Corsa veloce','Maratona','Corsa']
        cost nullable: true
        distance nullable: true
        maxRunners nullable: true
        raceName nullable: true
        startDateName nullable: true
        sponsor nullable: true
        distanceType inList: ['Km','m']
    }

    // PAGINA 77 CRUD

    String toString() {
        return "${raceName}, ${maxRunners}"
    }
}
