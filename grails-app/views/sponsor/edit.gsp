<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sponsor.label', default: 'Sponsor')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>





        <a href="#edit-sponsor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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

                <li title="Registra una nuova gara" class="pull-right"><g:link controller="registration" action="create"><i class="fa fa-plus-circle fa-2x"
                                                                                                                            aria-hidden="true"></i></g:link></li>
            </sec:ifLoggedIn>
            <li title="Ricerca una gara"><g:link controller="race" action="search"><i class="fa fa-search fa-2x"
                                                                                      aria-hidden="true"></i></g:link></li>
        </ul>
    </div>
        <div id="edit-sponsor" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="info">
                    <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
                    ${flash.message}
                </div>
            </g:if>
            <g:hasErrors bean="${this.sponsor}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.sponsor}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.sponsor}" method="PUT">
                <g:hiddenField name="version" value="${this.sponsor?.version}" />
                <fieldset class="form">
                    <f:all bean="sponsor"/>
                </fieldset>
                <fieldset class="buttons pull-right">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
