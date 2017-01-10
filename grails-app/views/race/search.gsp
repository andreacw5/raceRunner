<%@ page import="racetrack.Race" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Ricerca</title>
</head>

<body>
<div class="body">
    <div class="nav" role="navigation" >
        <ul >
            <li title="Torna alla pagina precedente"><g:link onClick="history.back()"><i class="fa fa-mail-reply fa-2x"
                                                                                         aria-hidden="true"></i></g:link></li>
            <li title="Vai alla pagina principale" ><g:link controller="race" action="index"><i class="fa fa-home fa-2x"
                                                                                               aria-hidden="true"></i></g:link></li>
            <li title="Ricerca una gara" ><g:link controller="race" action="search"><i class="fa fa-search fa-2x"
                                                                                      aria-hidden="true"></i></g:link></li>
            <sec:ifNotLoggedIn>
                <li class="pull-right" title="Effettua l'accesso per le funzioni aggiuntive!"><g:link controller="login" action="auth"><i class="fa fa-sign-in fa-2x"  aria-hidden="true"></i></g:link></li>
            </sec:ifNotLoggedIn>
        </ul>
    </div>

    <g:if test="${flash.message}">
        <div class="alert">
            <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
            ${flash.message}
        </div>
    </g:if>

    <g:if test="${raceCount < 1}">
        <div style="text-align: center; margin: 10%" class="animated flipInX">
            <i class="fa fa-search fa-5x"
               aria-hidden="true"></i>
            <h2><g:message code="search.not.label"/></h2>
            <small><g:message code="search.small.label"/><br></small>
            <small ><g:link onClick="history.back()"><i class="fa fa-reply " style="padding-right: 5px"
                                                           aria-hidden="true"></i><g:message code="backto"/></g:link><br></small>
        </div>

    </g:if>
    <g:if test="${raceCount > 0}">
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
                            <button type="submit" id="submit" value="Cerca"><g:message
                                    code="search.search.label"/></button>
                        </form>
                    </div>
                </div>
            </div>

        </g:form>
    </g:if>
</div>
</body>
</html>