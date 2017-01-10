<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;
charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Iscrizione</title>
    <style>
    body {
        height: 85% !important;
    }
    </style>
</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li title="Torna alla pagina precedente"><g:link onClick="history.back()"><i class="fa fa-mail-reply fa-2x"
                                                                                     aria-hidden="true"></i></g:link>
        </li>
        <li title="Vai alla pagina principale"><g:link controller="race" action="index"><i class="fa fa-home fa-2x"
                                                                                           aria-hidden="true"></i></g:link>
        </li>
        <li title="Ricerca una gara"><g:link controller="race" action="search"><i class="fa fa-search fa-2x"
                                                                                  aria-hidden="true"></i></g:link></li>

        <sec:ifNotLoggedIn>
            <li class="pull-right" title="Effettua l'accesso per le funzioni aggiuntive!"><g:link controller="login"
                                                                                                  action="auth"><i
                        class="fa fa-sign-in fa-2x" aria-hidden="true"></i></g:link></li>
        </sec:ifNotLoggedIn>

    </ul>
</div>

<div class="body">
    <div>
        <h1 style="font-size: xx-large; text-align: center">Ti stai iscrivendo alla corsa <f
                style="font-style: italic; color: #3380b1;">${race.raceName}</f></h1>

        <h1 style="font-size: large; text-align: center">Si svolgerà a ${race.city} il <g:formatDate
                date="${race.startDateName}"
                format="dd/MM/yyyy (EEEE)"/></h1>

        <div style="font-size: small; margin-left: 20px">
            <i class="fa fa-road" aria-hidden="true"></i>  Lunghezza percorso: ${race.distance} <br>
            <i class="fa fa-rss" aria-hidden="true"></i>  Tipologia di gara: ${race.raceType} <br>
            <i class="fa fa-users"
               aria-hidden="true"></i> Numero di iscritti attuali: ${race.registrations?.size()} <br>
            <i class="fa fa-user"
               aria-hidden="true"></i>  Posti rimanenti: ${race.maxRunners - race.registrations?.size()} <br>
            <i class="fa fa-eur" aria-hidden="true"></i> Costo di iscrizione: <g:formatNumber number="${race.cost}"
                                                                                              type="currency"
                                                                                              currencyCode="EUR"/><br>
        </div>

    </div>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${registration}">
        <div class="errors">
            <g:renderErrors bean="${registration}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form action="register" method="post">
        <g:hiddenField name="race.id" value="${race.id}"/>
        <div class="dialog" style="margin: 15px">
            <table style="padding-top: 1px">
                <tr class='prop'>
                    <td valign='top' class='name'>
                        <label>Nome:</label>
                    </td>
                    <td valign='top'
                        class='value
${hasErrors(bean: registration, field: 'name', 'errors')}'>
                        <input type="text" maxlength='50' name='name'
                               value='${registration?.name}'>
                    </td>
                </tr>
                <tr class='prop'>
                    <td valign='top' class='name'>
                        <label>Cognome:</label>
                    </td>
                    <td valign='top'
                        class='value
${hasErrors(bean: registration, field: 'surname', 'errors')}'>
                        <input type="text" name="surname" maxlength='50'
                               value='${registration?.surname}'>
                    </td>
                </tr>
                <tr class='prop'>
                    <td valign='top' class='name'>
                        <label>Data di nascita:</label>
                    </td>
                    <td valign='top'
                        class='value
${hasErrors(bean: registration, field: 'birthDate', 'errors')}'>
                        <g:datePicker name='birthDate'
                                      precision='day'>${registration?.birthDate}</g:datePicker>
                    </td>
                </tr>
                <tr class='prop'>
                    <td valign='top' class='name'>
                        <label for='gender'>Sesso:</label>
                    </td>
                    <td valign='top' class='value
${hasErrors(bean: registration, field: 'gender', 'errors')}'>
                        <g:radio name='gender' value='M'
                                 checked='${registration?.gender?.equals("M")}'>
                        </g:radio>
                        Maschio
                        <g:radio name='gender' value='F'
                                 checked='${registration?.gender?.equals("F")}'>
                        </g:radio>
                        Femmina
                    </td>
                </tr>
                <tr class='prop'>
                    <td valign='top' class='name'>
                        <label>Indirizzo:</label>
                    </td>
                    <td valign='top'
                        class='value
${hasErrors(bean: registration, field: 'postalAddress', 'errors')}'>
                        <input name='postalAddress'>
                        ${registration?.postalAddress}
                    </input>
                    </td>
                </tr>
                <tr class='prop'>
                    <td valign='top' class='name'>
                        <label>Comune di:</label>
                    </td>
                    <td valign='top'
                        class='value
${hasErrors(bean: registration, field: 'comRes', 'errors')}'>
                        <input type="text" maxlength='50'
                               name='comRes'
                               value='${registration?.comRes}'>
                    </td>
                </tr>
                <tr class='prop'>
                    <td valign='top' class='name'>
                        <label>E-mail:</label>
                    </td>
                    <td valign='top'
                        class='value
${hasErrors(bean: registration, field: 'emailAddress', 'errors')}'>
                        <input type="text" maxlength='50'
                               name='emailAddress'
                               value='${registration?.emailAddress}'>
                    </td>
                </tr>
                <tr class='prop'>
                    <td valign='top' class='name'>
                        <label>Cellulare:</label>
                    </td>
                    <td valign='top'
                        class='value
${hasErrors(bean: registration, field: 'mobilePhone', 'errors')}'>
                        <input type="text" maxlength='50'
                               name='mobilePhone'
                               value='${registration?.mobilePhone}'>
                    </td>
                </tr>
            </table>
        </div>

        <div class="buttons footer pull-right">
            <input type="submit" value="Registrati"
                   class="formbutton">
            <input type="button" value="Annulla"
                   onClick="history.back()"
                   class="formbutton">
        </div>
    </g:form>
</div>
</body>
</html>