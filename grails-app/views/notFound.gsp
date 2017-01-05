<!doctype html>
<html>
    <head>
        <title>Page Not Found</title>
        <meta name="layout" content="main">
        <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
    </head>
    <body>
    <div class="nav" role="navigation">
        <ul>
            <li><g:link onClick="history.back()"><i class="fa fa-long-arrow-left" style="padding-right: 5px" aria-hidden="true"></i><g:message code="backto"/></g:link></li>
            <li><g:link action="create"><i class="fa fa-send" style="padding-right: 5px" aria-hidden="true"></i><g:message code="new.run.add.label"/></g:link></li>
            <li><g:link action="search"><i class="fa fa-search" style="padding-right: 5px" aria-hidden="true"></i><g:message code="res.home.label"/></g:link></li>

            <li class="pull-right"><g:link controller="login" action="auth"><i class="fa fa-lock" style="padding-right: 5px" aria-hidden="true"></i><g:message code="login"/></g:link></li>        </ul>
    </div>
    <div style="text-align: center; margin: 20%">
        <h1 style="font-size: xx-large; color: #a12222"> ERRORE 404</h1>
        <small>Non ho trovato quello che stai cercando! <br></small>
        <g:if env="development">
            <h1 style="font-size: small"> Url cercato: ${request.forwardURI}</h1>
        </g:if>


    </div>
    </body>
</html>
