

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'racetrack.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'racetrack.UserRole'
grails.plugin.springsecurity.authority.className = 'racetrack.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/race/**',     access: ['permitAll']],
	[pattern: '/**/i18n/**',     access: ['permitAll']],
	[pattern: '/**/registration/show/**',     access: ['permitAll']],
	[pattern: '/**/registration/**',          access: ['ROLE_ADMIN']],
	[pattern: '/**/race/create',              access: ['ROLE_ADMIN']],
	[pattern: '/**/Registration/register',    access: ['permitAll']],
	[pattern: '/**/Registration/create',      access: ['ROLE_ADMIN']],
	[pattern: '/**/favicon.ico', access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

