<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="page.user.label"/></title>
</head>

<body>

<div class="nav" role="navigation">
    <ul>
        <li id="nav-1" title="Torna alla pagina precedente" ><g:link onClick="history.back()"><i class="fa fa-mail-reply fa-2x"
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

            <li title="Registra una nuovo utente" class="pull-right"><g:link controller="user" action="create"><i class="fa fa-plus-circle fa-2x"
                                                                                                                    aria-hidden="true"></i></g:link></li>
            <li class="pull-right" title="Forza l'iscrizione ad una gara"><g:link controller="registration" action="create"><i class="fa fa-hand-paper-o fa-2x"
                                                                                                                               aria-hidden="true"></i></g:link></li>
        </sec:ifLoggedIn>
        <li title="Ricerca una gara"><g:link controller="race" action="search"><i class="fa fa-search fa-2x"
                                                                                  aria-hidden="true"></i></g:link></li>
    </ul>
</div>

<div id="list-user" class="content scaffold-list" role="main">

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table id="example" class="display" width="100%" cellspacing="0">
            <tr>
                <th><g:message code="username.user.label"/></th>
                <th><g:message code="role.user.label"/></th>
                <th><g:message code="password.user.label"/></th>
                <th></th>
                <th></th>
            </tr>
            <g:each in="${userList}">
                <tr>
                    <td>${it.username}</td>
                    <td>${it.role}</td>
                    <td>********</td>
                    <td>
                        <g:link action="edit" id="${it.id}"><i style="color: darkslategray" title="Modifica" class="fa fa-edit fa-2x" aria-hidden="true"></i></g:link>
                    </td>
                    <td>
                        <g:link action="show" id="${it.id}"><i style="color: darkslategray" title="Visualizza dettagli" class="fa fa-info fa-2x" aria-hidden="true"></i></g:link>
                    </td>
                </tr>
            </g:each>
        </table>

    <g:if test="${userCount > 13}">
        <div class="buttons footer pull-right">
            <a class="formbutton"><g:paginate total="${raceCount ?: 0}"/></a>
        </div>
    </g:if>
</div>
</body>
</html>