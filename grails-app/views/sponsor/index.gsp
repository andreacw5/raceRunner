<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'sponsor.label', default: 'Sponsor')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-sponsor" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><g:link controller="race" action="index"><i class="fa fa-home" style="padding-right: 5px"
                                                        aria-hidden="true"></i><g:message
                code="default.home.label"/></g:link></li>
        <sec:ifLoggedIn>
            <li><g:link controller="sponsor" action="create"><i class="fa fa-plus" style="padding-right: 5px"
                                                                aria-hidden="true"></i><g:message
                    code="new.sponsor.add.label"/></g:link></li>
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
<g:if test="${sponsorCount < 1}">
    <div style="text-align: center; margin: 10%">
        <i class="fa grails-icon">
            <asset:image src="runner-icon1.png"/>
        </i>

        <h2><g:message code="sponsor.screen.label"/></h2>
        <small><g:message code="sponsor.small.label"/></small>
    </div>

</g:if>
<g:if test="${sponsorCount > 0}">
    <div id="list-sponsor" class="content scaffold-list" role="main">

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table id="example" class="display" width="100%" cellspacing="0">
            <tr>
                <th><g:message code="name.sponsor.label"/></th>
                <th><g:message code="type.sponsor.label"/></th>
                <th></th>
            </tr>
            <g:each in="${sponsorList}">
                <tr>
                    <td>${it.name}</td>
                    <td>${it.type}</td>
                    <td>
                        <g:link action="show" id="${it.id}"><g:message code="info.racecol.label"/></g:link>
                    </td>
                </tr>

            </g:each>
            <g:if test="${sponsorCount > 13}">
                <div class="buttons footer pull-right">
                    <a class="formbutton"><g:paginate total="${raceCount ?: 0}"/></a>
                </div>
            </g:if>
    </div>
</g:if>
</body>
</html>