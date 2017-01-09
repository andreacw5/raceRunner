<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'race.label', default: 'Race')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>
<style>
body {
    height: 95% !important;
}
</style>
<body>
<a href="#show-race" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><g:link onClick="history.back()"><i class="fa fa-long-arrow-left" style="padding-right: 5px"
                                                aria-hidden="true"></i><g:message code="backto"/></g:link></li>
        <sec:ifLoggedIn>
            <li><g:link controller="race" action="create"><i class="fa fa-send" style="padding-right: 5px"
                                                             aria-hidden="true"></i><g:message
                    code="new.run.add.label"/></g:link></li>
            <li><g:link controller="registration" action="create"><i class="fa fa-send-o" style="padding-right: 5px"
                                                                     aria-hidden="true"></i><g:message
                    code="force.run.add.label"/></g:link></li>
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
        </sec:ifLoggedIn></ul>
</div>
<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<div>
    <h1 style="font-size: xx-large; text-align: center"><g:link
            controller="race">${race.raceName}</g:link></h1>

    <h1 style="font-size: large; text-align: center">Si svolgerà a ${race.city} il <g:formatDate
            date="${race.startDateName}"
            format="dd/MM/yyyy (EEEE)"/> alle ore ${race.times}</h1>

    <div style="font-size: small; margin-left: 20px">
        <h1 style="font-size: large; text-align: center">Dettagli sull'evento</h1>

        <div style="margin-inside: 3px; padding-top: 5px">
            <b>I numeri:</b> <br>
            <i class="fa fa-users"
               aria-hidden="true"></i> Numero di iscritti attuali: ${race.registrations?.size()} <br>
            <i class="fa fa-users" aria-hidden="true"></i> Corridori massimi: ${race.maxRunners} <br>

            <i class="fa fa-user"
               aria-hidden="true"></i>  Posti rimanenti: ${race.maxRunners - race.registrations?.size()} <br>

        </div>

        <div style="margin-inside: 3px; padding-top: 5px">
            <b>I dati:</b><br>
            <i class="fa fa-road" aria-hidden="true"></i>  Lunghezza percorso: ${race.distance} <br>
            <i class="fa fa-rss" aria-hidden="true"></i>  Tipologia di gara: ${race.raceType} <br>
        </div>

        <div style="margin-inside: 3px; padding-top: 5px;">
            <b>L'organizzazione:</b><br>
            <i class="fa fa-male" aria-hidden="true"></i> Organizzatore: ${race.organizator}<br>
            <i class="fa fa-adn" aria-hidden="true"></i>  Sponsor della gara: ${race.sponsor} <br>
        </div>

        <i class="fa fa-eur" aria-hidden="true"></i> Costo di iscrizione: <g:formatNumber number="${race.cost}"
                                                                                          type="currency"
                                                                                          currencyCode="EUR"/><br>

        <h1 style="font-size: large; text-align: center">Dove si svolge?</h1>
        <i class="fa fa-road" aria-hidden="true"></i>  Via: ${race.addressCode} <br>
        <i class="fa fa-sort-numeric-asc" aria-hidden="true"></i>  Civico: ${race.civicAd} <br>
        <i class="fa fa-id-card" aria-hidden="true"></i>  C.A.P.: ${race.postalCode} <br>
        <i class="fa fa-bell" aria-hidden="true"></i>  Comune di: ${race.city} <br>
    </div>

</div>
<sec:ifLoggedIn>
    <g:form resource="${this.race}" method="DELETE">
        <fieldset class="buttons footer pull-right">
            <g:link class="edit" action="edit" resource="${this.race}"><g:message code="default.button.edit.label"
                                                                                  default="Edit"/></g:link>
            <input class="delete" type="submit"
                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                   onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</sec:ifLoggedIn>
<div style="font-size: small; margin-left: 20px; padding-top: 45px">
    <h1 style="font-size: large; text-align: center">I partecipanti iscritti</h1>
    <f:widget bean="race" property="registrations"/><br>
</div>
</body>
</html>
