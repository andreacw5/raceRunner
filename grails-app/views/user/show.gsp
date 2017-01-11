<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<div class="nav" role="navigation">
    <ul>
        <li id="nav-1" title="Torna alla pagina precedente"><g:link onClick="history.back()"><i
                class="fa fa-mail-reply fa-2x"
                aria-hidden="true"></i></g:link></li>
        <li title="Vai alla pagina principale"><g:link controller="race" action="index"><i class="fa fa-home fa-2x"
                                                                                           aria-hidden="true"></i></g:link>
        </li>
        <li title="Vai alla pagina degli Sponsor"><g:link controller="sponsor" action="index"><i
                class="fa fa-shield fa-2x"
                aria-hidden="true"></i></g:link></li>
        <li title="Vai alla pagina degli Utenti"><g:link controller="user" action="index"><i
                class="fa fa-id-badge fa-2x"
                aria-hidden="true"></i></g:link></li>
        <li title="Vai alla pagina delle Registrazioni"><g:link controller="registration" action="index"><i
                class="fa fa-reorder fa-2x"
                aria-hidden="true"></i></g:link></li>

        <li title="Registra una nuovo utente" class="pull-right"><g:link controller="user" action="create"><i
                class="fa fa-plus-circle fa-2x"
                aria-hidden="true"></i></g:link></li>
        <li class="pull-right" title="Forza l'iscrizione ad una gara"><g:link controller="registration"
                                                                              action="create"><i
                    class="fa fa-hand-paper-o fa-2x"
                    aria-hidden="true"></i></g:link></li>
        <li title="Ricerca una gara"><g:link controller="race" action="search"><i class="fa fa-search fa-2x"
                                                                                  aria-hidden="true"></i></g:link></li>
    </ul>
</div>

<div id="show-user" class="content scaffold-show" role="main">
    <h1 style="font-size: x-large"><g:message code="show.user.label"/></h1>
    <g:if test="${flash.message}">
        <div class="info">
            <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
            ${flash.message}
        </div>
    </g:if>
    <div style="padding-top: 5%; padding-left: 5%">
        <label>Nome dell'utente:</label>
        <f:display bean="user" property="username"/>
    </div>

    <div style="padding-top: 2%; padding-left: 5%">
        <label>Password:</label>
        <t>*******</t>
    </div>

    <div style="padding-top: 2%; padding-left: 5%">
        <label>Ruolo:</label>
        <f:display bean="user" property="role"/>
    </div>

    <div style="padding-top: 2%; padding-left: 5%">
        <label>Attivo:</label>
        <f:display bean="user" property="enabled"/>
    </div>

    <g:form resource="${this.user}" method="DELETE">
        <fieldset class="buttons pull-right">
            <g:link action="edit" resource="${this.user}"><g:message code="default.button.edit.label"
                                                                     default="Edit"/></g:link>
            <input type="submit"
                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                   onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
