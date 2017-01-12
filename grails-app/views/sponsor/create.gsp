<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'sponsor.label', default: 'Sponsor')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li title="Torna alla pagina precedente"><g:link onClick="history.back()"><i class="fa fa-mail-reply fa-2x"
                                                                                     aria-hidden="true"></i></g:link>
        </li>

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

            <li title="Registra un nuovo sponsor" class="pull-right"><g:link controller="sponsor" action="create"><i
                    class="fa fa-plus-circle fa-2x"
                    aria-hidden="true"></i></g:link></li>
        </sec:ifLoggedIn>
        <li title="Ricerca una gara"><g:link controller="race" action="search"><i class="fa fa-search fa-2x"
                                                                                  aria-hidden="true"></i></g:link></li>
    </ul>
</div>

<div id="create-sponsor" class="content scaffold-create" role="main">

    <g:form action="save">
        <g:if test="${flash.message}">
            <div class="info">
                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
                ${flash.message}
            </div>
        </g:if>
        <g:hasErrors bean="${this.sponsor}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.sponsor}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <fieldset class="form">
            <h4 style="border-bottom: solid #B7B7B7; margin: 6px;"><g:message code="title.info.label"/></h4>

                <div class="seetab"><a class="seetext">
                    <g:message code="sponsor.name.label"/><br/>
                    <f:widget class="sec" bean="sponsor" property="name" />
                </div>

                <div class="seetab"><a class="seetext">
                    <g:message code="sponsor.desc.label"/><br/>
                    <f:widget class="sec" bean="sponsor" property="desc"/>
                </div>

                <div class="seetab"><a class="seetext">
                    <g:message code="sponsor.type.label"/><br/>
                    <f:widget class="sec" bean="sponsor" property="type"/>
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
