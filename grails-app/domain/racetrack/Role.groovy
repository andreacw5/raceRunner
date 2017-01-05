package racetrack

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='authority')
@ToString(includes='authority', includeNames=true, includePackage=false)
class Role implements Serializable {

	private static final long serialVersionUID = 1

	String authority
    String permission

	static constraints = {
		authority blank: false, unique: true
        permission blank: false
	}

	static mapping = {
		cache true
	}
}
