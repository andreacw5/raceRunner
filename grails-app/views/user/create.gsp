<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="page.user.new.label"/></title>
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

<div id="create-user" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.user}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form action="save">
        <fieldset class="form">
            <f:all bean="user"/>
        </fieldset>
        <fieldset class="buttons pull-right">
            <g:submitButton name="create"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
