package racetrack

class Race {

    // Race information
    String times
    String organizator
    int cost
    int distance
    String distanceType
    int maxRunners
    String raceName
    String raceType
    Date startDateName
    Sponsor sponsor
    // Race place information
    String city
    String addressCode
    String postalCode
    String civicAd

    // Race Domain contain registration
    static hasMany = [registrations: Registration]

    static constraints = {
        city inList: ['Milano', 'Roma', 'Pisa']
        civicAd nullable: true
        times nullable: true
        addressCode nullable: true
        postalCode nullable: true
        organizator nullable: true
        raceType inList: ['Passo accellerato', 'Corsa veloce', 'Maratona', 'Corsa']
        cost nullable: true
        distance nullable: true
        maxRunners nullable: true
        raceName nullable: true
        startDateName nullable: true
        sponsor nullable: true
        distanceType inList: ['Km', 'm']
    }

    // Call domain into String

    String toString() {
        return "${raceName}"
    }
}
