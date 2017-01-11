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
            <li><g:link onClick="history.back()"><i class="fa fa-long-arrow-left" style="padding-right: 5px"
                                                    aria-hidden="true"></i><g:message code="backto"/></g:link></li>
            <sec:ifLoggedIn>
                <li><g:link controller="sponsor" action="index"><i class="fa fa-adn" style="padding-right: 5px"
                                                                   aria-hidden="true"></i><g:message
                        code="new.run.adn.label"/></g:link></li>
            </sec:ifLoggedIn>
            <li><g:link controller="race" action="search"><i class="fa fa-search" style="padding-right: 5px"
                                                             aria-hidden="true"></i><g:message
                    code="res.home.label"/></g:link></li>
            <sec:ifNotLoggedIn>
                <li class="pull-right"><g:link controller="login" action="auth"><i class="fa fa-lock"
                                                                                   style="padding-right: 5px"
                                                                                   aria-hidden="true"></i><g:message
                        code="login"/></g:link></li>
            </sec:ifNotLoggedIn>
            <sec:ifLoggedIn>
                <li class="pull-right"><g:link><i class="fa fa-user" style="padding-right: 5px"
                                                  aria-hidden="true"></i><g:message
                        code="sec.name.label"/> <sec:username/></g:link></li>
            </sec:ifLoggedIn>

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
