<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'registration.label', default: 'Registration')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-registration" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><g:link onClick="history.back()"><i class="fa fa-long-arrow-left" style="padding-right: 5px" aria-hidden="true"></i><g:message code="backto"/></g:link></li>
                <li><g:link action="create"><i class="fa fa-send" style="padding-right: 5px" aria-hidden="true"></i><g:message code="new.run.add.label"/></g:link></li>
                <li><g:link action="search"><i class="fa fa-search" style="padding-right: 5px" aria-hidden="true"></i><g:message code="res.home.label"/></g:link></li>

                <li class="pull-right"><g:link controller="login" action="auth"><i class="fa fa-lock" style="padding-right: 5px" aria-hidden="true"></i><g:message code="login"/></g:link></li>            </ul>
        </div>
        <div id="list-registration" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${registrationList}" />

            <div class="pagination">
                <g:paginate total="${registrationCount ?: 0}" />
            </div>
        </div>
    </body>
</html>