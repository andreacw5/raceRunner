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
            <li><g:link controller="race" action="create"><i class="fa fa-send" style="padding-right: 5px" aria-hidden="true"></i><g:message code="new.run.add.label"/></g:link></li>
            <li><g:link controller="race" action="search"><i class="fa fa-search" style="padding-right: 5px" aria-hidden="true"></i><g:message code="res.home.label"/></g:link></li>

            <li class="pull-right"><g:link controller="login" action="auth"><i class="fa fa-lock" style="padding-right: 5px" aria-hidden="true"></i><g:message code="login"/></g:link></li>
    </div>

    <g:if test="${flash.message}">
        <div class="alert">
            <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
            ${flash.message}
        </div>
    </g:if>

    <h1 style="text-align: center; font-size: xx-large">Cerca...</h1>

    <g:form action="search" method="post">
        <div class="dialog">
            <div class="login-page" style="padding-top: 5px">
                <div class="form">
                    <form class="login-form"
                          autocomplete="off">
                        <h2 style="">... in base al nome dell'evento</h2>
                        <g:textField name='raceName' type="text">
                        </g:textField>
                        <h2 style="">... alla città in cui si svolge</h2>

                        <select id="soflow" name='city' from='["", "Milano", "Pisa", "Roma"]'>
                            <!-- This method is nice because it doesn't require extra div tags, but it also doesn't retain the style across all browsers. -->
                            <option>Seleziona una città</option>
                            <option>Milano</option>
                            <option>Pisa</option>
                            <option>Roma</option>
                        </select>
                        <h2 style="margin-top: 20px"></h2>
                        <button type="submit" id="submit" value="Cerca">Cerca!</button>
                    </form>
                </div>
            </div>
        </div>

    </g:form>
</div>
</body>
</html>