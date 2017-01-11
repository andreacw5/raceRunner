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
        <li title="Ricerca una gara"><g:link controller="race" action="search"><i class="fa fa-search fa-2x"
                                                         aria-hidden="true"></i></g:link></li>
        <sec:ifNotLoggedIn>
            <li class="pull-right" title="Effettua l'accesso per le funzioni aggiuntive!"><g:link controller="login" action="auth"><i class="fa fa-sign-in fa-2x"  aria-hidden="true"></i></g:link></li>
        </sec:ifNotLoggedIn>
        <sec:ifLoggedIn>
            <g:if test="${raceCount > 0}">
                <li title="Registra una nuova gara" class="pull-right"><g:link controller="race" action="create"><i class="fa fa-plus-circle fa-2x"
                                                                 aria-hidden="true"></i></g:link></li>
            </g:if>
            <li class="pull-right" title="Forza l'iscrizione ad una gara"><g:link controller="registration" action="create"><i class="fa fa-hand-paper-o fa-2x"
                                                                     aria-hidden="true"></i></g:link></li>
        </sec:ifLoggedIn>

    </ul>
</div>
    <div id="list-race" class="content scaffold-list" role="main">

        <g:if test="${flash.message}">
            <div class="info">
                <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
                ${flash.message}
            </div>
        </g:if>
        <table id="example" class="display" width="100%" cellspacing="0">
            <tr>
                <th><g:message code="name.racecol.label"/></th>
                <th><g:message code="type.racecol.label"/></th>
                <th><g:message code="date.racecol.label"/></th>
                <th><g:message code="money.racecol.label"/></th>
                <th><g:message code="dist.racecol.label"/></th>
                <th><g:message code="city.racecol.label"/></th>
                <th><g:message code="runner.racecol.label"/></th>
                <th></th>
    <sec:ifLoggedIn>
                <th></th>
    </sec:ifLoggedIn>
                <th></th>
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
                                <strong>${it.registrations?.size()}/${it.maxRunners}</strong>
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

</body>
</html>