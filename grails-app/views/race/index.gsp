<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'race.label', default: 'race')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav" role="navigation">
    <ul>
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

            <g:if test="${raceCount > 0}">
                <li title="Registra una nuova gara" class="pull-right"><g:link controller="race" action="create"><i class="fa fa-plus-circle fa-2x"
                                                                 aria-hidden="true"></i></g:link></li>
            </g:if>
            <li class="pull-right" title="Forza l'iscrizione ad una gara"><g:link controller="registration" action="create"><i class="fa fa-hand-paper-o fa-2x"
                                                                     aria-hidden="true"></i></g:link></li>
        </sec:ifLoggedIn>
        <li title="Ricerca una gara"><g:link controller="race" action="search"><i class="fa fa-search fa-2x"
                                                                                  aria-hidden="true"></i></g:link></li>

    </ul>
</div>
<g:if test="${raceCount < 1}">
    <div style="text-align: center; margin: 10%" class="animated flipInX">
        <i class="fa grails-icon">
            <asset:image src="runner-icon1.png"/>
        </i>
        <sec:ifLoggedIn>
            <h2><g:message code="adm.screen.label"/></h2>
            <small><g:message code="adm.small.label"/><br></small>
            <small>
                <g:link controller="race" action="create">
                    <i class="fa fa-send" style="padding-right: 5px"
                                          aria-hidden="true"></i><g:message
                                          code="new.creatiomn.add.label"/>
                </g:link>
            </small>
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
            <h2><g:message code="home.screen.label"/></h2>
            <small><g:message code="home.small.label"/></small>
        </sec:ifNotLoggedIn>
    </div>

</g:if>

<g:if test="${raceCount > 0}">
    <div id="list-race" class="content scaffold-list" role="main">

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table id="example" class="display" width="100%" cellspacing="0">
            <tr>
                <g:sortableColumn style="min-width: 100px !important;" property="raceName" title="${message(code: 'name.racecol.label', default: 'name')}" />
                <g:sortableColumn property="raceType" title="${message(code: 'type.racecol.label', default: 'type')}" />
                <g:sortableColumn property="startDateName" defaultOrder="desc" title="${message(code: 'date.racecol.label', default: 'name')}" />
                <g:sortableColumn property="cost" title="${message(code: 'money.racecol.label', default: 'name')}" />
                <g:sortableColumn property="distance" title="${message(code: 'dist.racecol.label', default: 'name')}" />
                <g:sortableColumn property="city" title="${message(code: 'city.racecol.label', default: 'name')}" />
                <g:sortableColumn property="maxRunners" title="${message(code: 'runner.racecol.label', default: 'name')}" />
                <th style="width: 5% !important;"><i title="Disponibilità iscrizione" class="fa fa-calendar-o fa-2x"
                       aria-hidden="true"></i></th>
    <sec:ifLoggedIn>
                <th style="width: 5% !important;"><i title="Modifica" class="fa fa-edit fa-2x"
                       aria-hidden="true"></i></th>
    </sec:ifLoggedIn>
                <th style="width: 5% !important;"><i title="Informazioni" class="fa fa-info fa-2x"
                       aria-hidden="true"></i></th>
            </tr>
            <g:each in="${raceList}">
                <tr>
                    <td>${it.raceName}</td>
                    <td>${it.raceType}</td>
                    <td><g:formatDate format="dd/MM/yyyy" date="${it.startDateName}"/></td>
                    <td><g:formatNumber number="${it.cost}" type="currency" currencyCode="EUR"/></td>
                    <td>${it.distance} ${it.distanceType}</td>
                    <td>${it.city}</td>
                    <g:if test="${ it.registrations?.size() < it.maxRunners}">
                        <td>
                                <strong style="font-size: large">${it.registrations?.size()}/${it.maxRunners}</strong>
                        </td>
                        <td>
                            <g:link controller="registration" action="register" id="${it.id}"><i style="color: #17b654" title="Iscriviti alla gara!" class="fa fa-pencil fa-2x" aria-hidden="true"></i>
                            </g:link>
                        </td>
                    </g:if>
                    <g:else>
                        <td>
                            <strong>${it.registrations?.size()}/${it.maxRunners}</strong>
                        </td>
                        <td>
                            <i style="color: red" title="Al completo, non è possibile iscriversi!" class="fa fa-ban fa-2x" aria-hidden="true"></i>
                        </td>
                    </g:else>
                    <sec:ifLoggedIn>
                    <td>
                        <g:link action="edit" id="${it.id}"><i style="color: darkslategray" title="Modifica" class="fa fa-edit fa-2x" aria-hidden="true"></i></g:link>
                    </td>
                    </sec:ifLoggedIn>
                    <td>
                        <g:link action="show" id="${it.id}"><i style="color: darkslategray" title="Visualizza dettagli" class="fa fa-info fa-2x" aria-hidden="true"></i></g:link>
                    </td>
                </tr>
            </g:each>
        </table>
        <g:if test="${raceCount > 13}">
            <div class="buttons footer pull-right">
                <a class="formbutton"><g:paginate total="${raceCount ?: 0}"/></a>
            </div>
        </g:if>
    </div>
</g:if>

</body>
</html>