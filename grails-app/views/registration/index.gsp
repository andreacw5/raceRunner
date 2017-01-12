<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'registration.label', default: 'Registration')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-registration" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                   default="Skip to content&hellip;"/></a>

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

<div id="list-registration" class="content scaffold-list" role="main">
    <table id="example" class="display" width="100%" cellspacing="0">
        <tr>
            <g:sortableColumn property="race" title="${message(code: 'race.registration.label', default: 'race')}" />
            <g:sortableColumn property="surname" title="${message(code: 'surname.registration.label', default: 'surname')}" />
            <g:sortableColumn property="name" title="${message(code: 'name.registration.label', default: 'name')}" />
            <g:sortableColumn property="comRes" title="${message(code: 'comRes.registration.label', default: 'password')}" />
            <g:sortableColumn style="width: 15% !important;" property="birthDate" title="${message(code: 'birthDate.registration.label', default: 'password')}" />
            <g:sortableColumn property="mobilePhone" title="${message(code: 'mobilePhone.registration.label', default: 'password')}" />
            <th style="width: 5% !important;"><i title="Modifica" class="fa fa-edit fa-2x"
                                                 aria-hidden="true"></i></th>
            <th style="width: 5% !important;"><i title="Informazioni" class="fa fa-info fa-2x"
                                                 aria-hidden="true"></i></th>
        </tr>
        <g:each in="${registrationList}">
            <tr>
                <td>${it.race}</td>
                <td>${it.surname}</td>
                <td>${it.name}</td>
                <td>${it.comRes}</td>
                <td><g:formatDate format="dd/MM/yyyy" date="${it.birthDate}"/></td>
                <td>${it.mobilePhone}</td>
                <td>
                    <g:link action="edit" id="${it.id}"><i style="color: darkslategray" title="Modifica" class="fa fa-edit fa-2x" aria-hidden="true"></i></g:link>
                </td>
                <td>
                    <g:link action="show" id="${it.id}"><i style="color: darkslategray" title="Visualizza dettagli" class="fa fa-info fa-2x" aria-hidden="true"></i></g:link>
                </td>
            </tr>
        </g:each>
    </table>



    <g:if test="${registrationCount > 13}">
        <div class="buttons footer pull-right">
            <a class="formbutton"><g:paginate total="${registrationCount ?: 0}"/></a>
        </div>
    </g:if>
</div>
</body>
</html>