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

                <li class="pull-right" title="Forza l'iscrizione ad una gara"><g:link controller="registration" action="create"><i class="fa fa-hand-paper-o fa-2x"
                                                                                                                                   aria-hidden="true"></i></g:link></li>
            </sec:ifLoggedIn>
            <li title="Ricerca una gara"><g:link controller="race" action="search"><i class="fa fa-search fa-2x"
                                                                                      aria-hidden="true"></i></g:link></li>
        </ul>
    </div>
    <div style="text-align: center; margin: 20%">
        <h1 style="font-size: xx-large; color: #a12222"> ERRORE 404</h1>
        <small>Non ho trovato quello che stai cercando! <br></small>
        <small><g:link onClick="history.back()"><i class="fa fa-mail-reply fa-2x" style="color: #99241d;"
                                                   aria-hidden="true"></i><t style="font-size: large; padding-left: 5px; color: #99241d"><g:message code="backto"/></t></g:link> <br></small>
        <g:if env="development">
            <h1 style="font-size: small"> Url cercato: ${request.forwardURI}</h1>
        </g:if>


    </div>
    </body>
</html>
