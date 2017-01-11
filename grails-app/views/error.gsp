<!doctype html>
<html>
    <head>
        <title><g:if env="development">Grails Runtime Exception</g:if><g:else>Error</g:else></title>
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
        <g:if env="development">
            <g:if test="${Throwable.isInstance(exception)}">
                <g:renderException exception="${exception}" />
            </g:if>
            <g:elseif test="${request.getAttribute('javax.servlet.error.exception')}">
                <g:renderException exception="${request.getAttribute('javax.servlet.error.exception')}" />
            </g:elseif>
            <g:else>
                <ul class="errors">
                    <li>An error has occurred</li>
                    <li>Exception: ${exception}</li>
                    <li>Message: ${message}</li>
                    <li>Path: ${path}</li>
                </ul>
            </g:else>
        </g:if>
        <g:else>
            <ul class="errors">
                <li>An error has occurred</li>
            </ul>
        </g:else>
    </body>
</html>
