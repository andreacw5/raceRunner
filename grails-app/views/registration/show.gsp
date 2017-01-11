<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'registration.label', default: 'Registration')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>
<style>
body {
    height: 95% !important;
}
</style>
<body>
<a href="#show-registration" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                   default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><g:link onClick="history.back()"><i class="fa fa-long-arrow-left" style="padding-right: 5px"
                                                aria-hidden="true"></i><g:message code="backto"/></g:link></li>
        <li><g:link action="create"><i class="fa fa-send" style="padding-right: 5px" aria-hidden="true"></i><g:message
                code="new.run.add.label"/></g:link></li>
        <li><g:link action="search"><i class="fa fa-search" style="padding-right: 5px" aria-hidden="true"></i><g:message
                code="res.home.label"/></g:link></li>

        <li class="pull-right"><g:link controller="login" action="auth"><i class="fa fa-lock" style="padding-right: 5px"
                                                                           aria-hidden="true"></i><g:message
                code="login"/></g:link></li></ul>
</div>

<div id="show-registration" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="info">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
            ${flash.message}
        </div>
    </g:if>
    <f:display bean="registration"/>
    <g:form resource="${this.registration}" method="DELETE">
        <fieldset class="buttons pull-right">
            <g:link action="edit" resource="${this.registration}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <input type="submit"
                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                   onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
