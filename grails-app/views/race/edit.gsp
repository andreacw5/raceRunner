<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'race.label', default: 'Race')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
    <style>
    body {
        height: 94% !important;
    }
    </style>
</head>

<body>

<div class="nav" role="navigation">
    <ul>
        <li title="Torna alla pagina precedente"><g:link onClick="history.back()"><i class="fa fa-mail-reply fa-2x"
                                                                                     aria-hidden="true"></i></g:link></li>
        <li title="Vai alla pagina principale" ><g:link controller="race" action="index"><i class="fa fa-home fa-2x"
                                                                                            aria-hidden="true"></i></g:link></li>
        <li title="Ricerca una gara" ><g:link controller="race" action="search"><i class="fa fa-search fa-2x"
                                                                                   aria-hidden="true"></i></g:link></li>
        <sec:ifLoggedIn>
            <li title="Registra una nuova gara" class="pull-right"><g:link controller="race" action="create"><i class="fa fa-plus-circle fa-2x"
                                                                                                                aria-hidden="true"></i></g:link></li>
            <li class="pull-right" title="Forza l'iscrizione ad una gara"><g:link controller="registration" action="create"><i class="fa fa-hand-paper-o fa-2x"
                                                                                                                               aria-hidden="true"></i></g:link></li>
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
            <li class="pull-right" title="Effettua l'accesso per le funzioni aggiuntive!"><g:link controller="login" action="auth"><i class="fa fa-sign-in fa-2x"  aria-hidden="true"></i></g:link></li>
        </sec:ifNotLoggedIn>
    </ul>
</div>

<div id="edit-race" class="content scaffold-edit" role="main">

    <g:if test="${flash.message}">
        <div class="info">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
            ${flash.message}
        </div>
    </g:if>
    <g:hasErrors bean="${this.race}">
        <ul class="errors" role="alert">
        <g:eachError bean="${this.race}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                    error="${error}"/></li>
        </g:eachError>
        <fieldset class="form seetab">
            <fieldset class="form">

    </g:hasErrors>
    <g:form resource="${this.race}" method="PUT">

    <fieldset class="form seetab">
        <fieldset class="form">
            <h4 style="border-bottom: solid #B7B7B7"><g:message code="title.info.label"/></h4>

            <div class="seetab"><a class="seetext"><g:message code="race.name.label"/> <f:widget bean="race"
                                                                                                 property="raceName"/>
            </div>

            <div class="seetab"><a class="seetext"><g:message code="race.type.label"/> <f:widget bean="race"
                                                                                                 property="raceType"/>
            </div>

            <div class="seetab"><a class="seetext"><g:message code="race.cost.label"/> <f:widget bean="race"
                                                                                                 property="cost"/> €
            </div>

            <div class="seetab"><a class="seetext"><g:message code="race.distance.label"/> <f:widget bean="race"
                                                                                                     property="distance"/> <f:widget
                    bean="race" property="distanceType" value="Km"/></div>

            <div class="seetab"><a class="seetext"><g:message code="race.maxRunner.label"/> <f:widget bean="race"
                                                                                                      property="maxRunners"/>
            </div>

            <div class="seetab"><a class="seetext"><g:message code="race.date.label"/> <f:widget bean="race"
                                                                                                 property="startDateName"
                                                                                                 value='${new Date()}'/></a>
            </div>

            <div class="seetab"><a class="seetext"><g:message code="race.times.label"/> <f:widget bean="race"
                                                                                                  property="times"
                                                                                                  value="20:00"/></a>
            </div>
            <h4 style="border-bottom: solid #B7B7B7"><g:message code="title.place.label"/></h4>

            <div class="seetab"><a class="seetext"><g:message code="race.city.label"/> <f:widget bean="race"
                                                                                                 property="city"/></a>
            </div>

            <div class="seetab"><a class="seetext"><g:message code="race.address.label"/> <f:widget bean="race"
                                                                                                    property="addressCode"/></a>
            </div>

            <div class="seetab"><a class="seetext"><g:message code="race.civicAd.label"/> <f:widget bean="race"
                                                                                                    property="civicAd"/></a>
            </div>

            <div class="seetab"><a class="seetext"><g:message code="race.postCode.label"/> <f:widget bean="race"
                                                                                                     property="postalCode"/></a>
            </div>
            <h4 style="border-bottom: solid #B7B7B7"><g:message code="title.additional.label"/></h4>

            <div class="seetab"><a class="seetext"><g:message code="race.organizator.label"/> <f:widget bean="race"
                                                                                                        property="organizator"/></a>
            </div>

            <div class="seetab"><a class="seetext"><g:message code="race.sponsor.label"/> <f:widget bean="race"
                                                                                                    property="sponsor"/></a>
            </div>
            <g:hiddenField name="version" value="${this.race?.version}"/>
        </fieldset>
    </fieldset>
    <fieldset class="buttons pull-right">
        <input type="submit"
               value="${message(code: 'default.button.update.label', default: 'Update')}"/>
    </fieldset>
    </g:form>
</fieldset>
</fieldset>
</ul>
</div>
</body>
</html>
