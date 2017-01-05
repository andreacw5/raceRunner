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
        <li><g:link controller="race" action="index"><i class="fa fa-home" style="padding-right: 5px" aria-hidden="true"></i><g:message code="default.home.label"/></g:link></li>
        <li><g:link controller="race" action="create"><i class="fa fa-send" style="padding-right: 5px" aria-hidden="true"></i><g:message code="new.run.add.label"/></g:link></li>
        <li><g:link controller="race" action="search"><i class="fa fa-search" style="padding-right: 5px" aria-hidden="true"></i><g:message code="res.home.label"/></g:link></li>

        <li class="pull-right"><g:link controller="login" action="auth"><i class="fa fa-lock" style="padding-right: 5px" aria-hidden="true"></i><g:message code="login"/></g:link></li>

    </ul>
</div>
<div id="list-race" class="content scaffold-list" role="main">

%{--<g:if test="${paging == 11}">
    <h1>
        <g:if test="${raceList?.size() == 1}">
            Una sola gara è stata trovata con i parametri di ricerca:
        </g:if>
        <g:else>
            ${raceList?.size()} Ecco le gare che corrispondono hai tuoi parametri di ricerca:
        </g:else>
    </h1>
</g:if>--}%

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
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
        </tr>
        <g:each in="${raceList}">
            <tr>
                <td>${it.raceName}</td>
                <td>${it.raceType}</td>
                <td><g:formatDate format="dd/MM/yyyy" date="${it.startDateName}"/></td>
                <td><g:formatNumber number="${it.cost}" type="currency" currencyCode="EUR"/></td>
                <td>${it.distance} m</td>
                <td>${it.city}</td>
                <td>
                    <g:if test="${
                        it.registrations?.size() < it.maxRunners}">
                        <span class="actionButton"> <strong>${it.registrations?.size()}/${it.maxRunners}</strong> <small>
                            <g:link controller="registration"
                                    action="register"
                                    id="${it.id}"><g:message code="registratiom.racecol.label"/>
                            </g:link>
                        </small>
                        </span>
                    </g:if>
                    <g:else><small><g:message code="complete.racecol.label"/></small></g:else>
                </td>
                <td>
                    <g:link action="show" id="${it.id}"><g:message code="info.racecol.label"/></g:link>
                </td>
            </tr>
        </g:each>
    </table>
    <g:if test="${raceCount > 13}">
        <div class="buttons footer pull-right">
            <a class="formbutton"> <g:paginate total="${raceCount ?: 0}"/></a>
        </div>
    </g:if>

</div>
</body>
</html>