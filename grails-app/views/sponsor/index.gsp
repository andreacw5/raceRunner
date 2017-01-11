<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="sponsor.page.label"/></title>
</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li title="Torna alla pagina precedente" ><g:link onClick="history.back()"><i class="fa fa-mail-reply fa-2x"
                                                aria-hidden="true"></i></g:link></li>
        <li title="Vai alla pagina principale"><g:link controller="race" action="index"><i class="fa fa-home fa-2x"
                                                                                           aria-hidden="true"></i></g:link></li>
        <li title="Vai alla pagina degli Sponsor"><g:link controller="sponsor" action="index"><i class="fa fa-shield fa-2x"
                                                                                                 aria-hidden="true"></i></g:link></li>
        <sec:ifNotLoggedIn>
            <li class="pull-right" title="Effettua l'accesso per le funzioni aggiuntive!"><g:link controller="login" action="auth"><i class="fa fa-sign-in fa-2x"  aria-hidden="true"></i></g:link></li>
        </sec:ifNotLoggedIn>
        <sec:ifLoggedIn>
            <li title="Vai alla pagina degli Utenti"><g:link controller="user" action="index"><i class="fa fa-id-badge fa-2x"
                                                                                                 aria-hidden="true"></i></g:link></li>
            <li title="Vai alla pagina delle Registrazioni"><g:link controller="registration" action="index"><i class="fa fa-reorder fa-2x"
                                                                                                                aria-hidden="true"></i></g:link></li>

            <g:if test="${sponsorCount > 0}">
                <li title="Registra una nuova gara" class="pull-right"><g:link controller="sponsor" action="create"><i class="fa fa-plus-circle fa-2x"
                                                                                                                    aria-hidden="true"></i></g:link></li>
            </g:if>
            <li class="pull-right" title="Forza l'iscrizione ad una gara"><g:link controller="registration" action="create"><i class="fa fa-hand-paper-o fa-2x"
                                                                                                                               aria-hidden="true"></i></g:link></li>
        </sec:ifLoggedIn>
        <li title="Ricerca una gara"><g:link controller="race" action="search"><i class="fa fa-search fa-2x"
                                                                                  aria-hidden="true"></i></g:link></li>
    </ul>
</div>
<g:if test="${sponsorCount < 1}">
    <div style="text-align: center; margin: 10%" class="animated flipInX">
        <sec:ifLoggedIn>
            <i class="fa grails-icon">
                <asset:image src="runner-icon1.png"/>
            </i>

            <h2><g:message code="sponsor.screen.label"/><br></h2>
            <g:link controller="sponsor" action="create">
                <i class="fa fa-send" style="padding-right: 5px"
                   aria-hidden="true"></i><g:message
                    code="new.sponsor.pp.label"/>
            </g:link>
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn class="animated flipInX">
            <i class="fa grails-icon">
                <asset:image src="runner-icon1.png"/>
            </i>

            <h2><g:message code="sponsor.screen.label"/></h2>
            <small><g:message code="sponsor.small.label"/></small>
        </sec:ifNotLoggedIn>
    </div>
</g:if>
<g:if test="${sponsorCount > 0}">
    <div id="list-sponsor" class="content scaffold-list" role="main">

        <g:if test="${flash.message}">
            <div class="info">
                <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
                ${flash.message}
            </div>

        </g:if>
        <table id="example" class="display" width="100%" cellspacing="0">
            <tr>
                <g:sortableColumn style="min-width: 80px !important;" property="name" title="${message(code: 'name.sponsor.label', default: 'name')}" />
                <g:sortableColumn property="type" title="${message(code: 'type.sponsor.label', sponsor: 'type')}" />
                <g:sortableColumn property="desc" title="${message(code: 'decs.sponsor.label', default: 'name')}" />
                <sec:ifLoggedIn>
                    <th><i title="Modifica" class="fa fa-edit fa-2x"
                           aria-hidden="true"></i></th>
                </sec:ifLoggedIn>
                <th><i title="Informazioni" class="fa fa-info fa-2x"
                       aria-hidden="true"></i></th>
            </tr>
            <g:each in="${sponsorList}">
                <tr>
                    <td>${it.name}</td>
                    <td>${it.type}</td>
                    <td>${it.desc}</td>
                    <sec:ifLoggedIn>
                        <td>
                            <g:link action="edit" id="${it.id}"><i style="color: darkslategray" title="Modifica" class="fa fa-edit fa-2x" aria-hidden="true"></i></g:link>
                        </td>
                    </sec:ifLoggedIn>
                    <td>
                        <g:link action="show" id="${it.id}"><i style="color: darkslategray" title="Visualizza dettagli" class="fa fa-info fa-2x" aria-hidden="true"></i></g:link>
                    </td>
                </tr>

            </g:each><g:if test="${sponsorCount > 13}">
                <div class="buttons footer pull-right">
                    <a class="formbutton"><g:paginate total="${raceCount ?: 0}"/></a>
                </div>
            </g:if>
    </div>

</g:if>
</body>
</html>