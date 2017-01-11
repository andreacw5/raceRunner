package racetrack

class Sponsor {
    String name
    String desc
    String type

    static constraints = {
        name nullable: true
        desc nullable: true
        type inList: ['Abbigliamento','Attrezzature Sportive','Altro'], nullable: true

    }

    String toString() {
        return "${name}"
    }
}
