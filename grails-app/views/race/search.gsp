<%@ page import="racetrack.Race" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Ricerca</title>
    <asset:stylesheet src="boxinglayout.css"/>
</head>

<body>
<div class="body">
    <div class="nav" role="navigation" >
        <ul >
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

                <g:if test="${raceCount > 0}">
                    <li title="Registra una nuova gara" class="pull-right"><g:link controller="race" action="create"><i class="fa fa-plus-circle fa-2x"
                                                                                                                        aria-hidden="true"></i></g:link></li>
                </g:if>
                <li class="pull-right" title="Forza l'iscrizione ad una gara"><g:link controller="registration" action="create"><i class="fa fa-hand-paper-o fa-2x"
                                                                                                                                   aria-hidden="true"></i></g:link></li>
            </sec:ifLoggedIn>
            <li title="Ricerca una gara"><g:link controller="race" action="search"><i class="fa fa-search fa-2x"
                                                                                      aria-hidden="true"></i></g:link></li>
        </ul>
    </div>

    <g:if test="${flash.message}">
        <div class="info">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
            ${flash.message}
        </div>
    </g:if>
    <div style="text-align: center; padding-top: 25px">
        <i class="fa fa-search fa-5x"
           aria-hidden="true"></i>
        <h1 style="font-size: xx-large; padding-top: 1px">Cerca...</h1>
    </div>

    <g:form action="search" method="post">
        <div class="dialog">
            <div class="login-page" style="padding-top: 2px">
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