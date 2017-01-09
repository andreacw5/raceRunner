<%@ page import="racetrack.Race" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Ricerca</title>
    <asset:stylesheet src="boxinglayout.css"/>
</head>

<body>
<div class="body">
    <div class="nav" role="navigation">
        <ul>
            <li><g:link onClick="history.back()"><i class="fa fa-long-arrow-left" style="padding-right: 5px"
                                                    aria-hidden="true"></i><g:message code="backto"/></g:link></li>
            <sec:ifLoggedIn>
                <li><g:link controller="race" action="create"><i class="fa fa-send" style="padding-right: 5px" aria-hidden="true"></i><g:message code="new.run.add.label"/></g:link></li>
                <li><g:link controller="registration" action="create"><i class="fa fa-send-o" style="padding-right: 5px" aria-hidden="true"></i><g:message code="force.run.add.label"/></g:link></li>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
                <li class="pull-right"><g:link controller="login" action="auth"><i class="fa fa-lock" style="padding-right: 5px" aria-hidden="true"></i><g:message code="login"/></g:link></li>
            </sec:ifNotLoggedIn>
            <sec:ifLoggedIn>
                <li class="pull-right"><g:link><i class="fa fa-user" style="padding-right: 5px" aria-hidden="true"></i><g:message code="sec.name.label"/> <sec:username/></g:link></li>
            </sec:ifLoggedIn>
    </div>

    <g:if test="${flash.message}">
        <div class="alert">
            <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
            ${flash.message}
        </div>
    </g:if>

    <h1 style="text-align: center; font-size: xx-large"><g:message code="search.title.label"/></h1>

    <g:form action="search" method="post">
        <div class="dialog">
            <div class="login-page" style="padding-top: 5px">
                <div class="form">
                    <form class="login-form"
                          autocomplete="off">
                        <h2 style=""><g:message code="search.title1.label"/></h2>
                        <g:textField name='raceName' type="text">
                        </g:textField>
                        <h2 style=""><g:message code="search.title2.label"/></h2>

                        <select id="soflow" name='city' from='["", "Milano", "Pisa", "Roma"]'>
                            <!-- This method is nice because it doesn't require extra div tags, but it also doesn't retain the style across all browsers. -->
                            <option><g:message code="search.city.label"/></option>
                            <option><g:message code="search.milano.label"/></option>
                            <option><g:message code="search.pisa.label"/></option>
                            <option><g:message code="search.rome.label"/></option>
                        </select>
                        <h2 style="margin-top: 20px"></h2>
                        <button type="submit" id="submit" value="Cerca"><g:message code="search.search.label"/></button>
                    </form>
                </div>
            </div>
        </div>

    </g:form>
</div>
</body>
</html>