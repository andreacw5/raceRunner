<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sponsor.label', default: 'Sponsor')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-sponsor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
        <div id="show-sponsor" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="sponsor" />
            <g:form resource="${this.sponsor}" method="DELETE">
                <fieldset class="buttons pull-right">
                    <g:link class="edit" action="edit" resource="${this.sponsor}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>

    </body>
</html>
