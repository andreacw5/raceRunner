package racetrack

class Sponsor {
    String name
    String type

    static constraints = {
        name nullable: true
        type inList: ['Abbigliamento','Attrezzature Sportive','Altro'], nullable: true
    }

    String toString() {
        return "${name}"
    }
}
