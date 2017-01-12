<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'registration.label', default: 'Registration')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li title="Vai alla pagina principale"><g:link controller="race" action="index"><i class="fa fa-home fa-2x"
                                                                                           aria-hidden="true"></i></g:link>
        </li>
        <li title="Vai alla pagina degli Sponsor"><g:link controller="sponsor" action="index"><i
                class="fa fa-shield fa-2x"
                aria-hidden="true"></i></g:link></li>
        <sec:ifNotLoggedIn>
            <li class="pull-right" title="Effettua l'accesso per le funzioni aggiuntive!"><g:link controller="login"
                                                                                                  action="auth"><i
                        class="fa fa-sign-in fa-2x" aria-hidden="true"></i></g:link></li>
        </sec:ifNotLoggedIn>
        <sec:ifLoggedIn>
            <li title="Vai alla pagina degli Utenti"><g:link controller="user" action="index"><i
                    class="fa fa-id-badge fa-2x"
                    aria-hidden="true"></i></g:link></li>
            <li title="Vai alla pagina delle Registrazioni"><g:link controller="registration" action="index"><i
                    class="fa fa-reorder fa-2x"
                    aria-hidden="true"></i></g:link></li>

            <li class="pull-right" title="Forza l'iscrizione ad una gara"><g:link controller="registration"
                                                                                  action="create"><i
                        class="fa fa-hand-paper-o fa-2x"
                        aria-hidden="true"></i></g:link></li>
        </sec:ifLoggedIn>
        <li title="Ricerca una gara"><g:link controller="race" action="search"><i class="fa fa-search fa-2x"
                                                                                  aria-hidden="true"></i></g:link></li>
    </ul>
</div>

<div id="create-registration" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="info">
            <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
            ${flash.message}
        </div>
    </g:if>
    <g:hasErrors bean="${this.registration}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.registration}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form action="save">
        <fieldset class="form">
            <div style="overflow:auto; height:520px;padding-right: 15%; width: auto">
                <h4>Informazioni personali</h4>
                <f:widget class="sec" bean="registration" property="name" placeholder="Nome"/>
                <f:widget class="sec" bean="registration" property="surname" placeholder="Cognome"/><br>
                <f:widget class="sec" bean="registration" property="gender"/>
                <f:widget class="sec" bean="registration" property="emailAddress" placeholder="Nome"/><br>
                <f:widget class="sec" bean="registration" property="postalAddress" placeholder="Nome"/><br>
                <f:widget class="sec" bean="registration" property="birthDate" placeholder="Nome"/>
                <f:widget class="sec" bean="registration" property="comRes" placeholder="Nome"/><br>
                <f:widget class="sec" bean="registration" property="mobilePhone" placeholder="Nome"/><br>
                <h4>Informazioni personali</h4>
                <f:widget class="sec" bean="registration" property="race" placeholder="Nome"/><br>
                <f:widget class="sec" bean="registration" property="name" placeholder="Nome"/><br>
                <f:widget class="sec" bean="registration" property="name" placeholder="Nome"/><br>
            </div>
        </fieldset>
        <fieldset class="buttons pull-right">
            <g:submitButton name="create"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
