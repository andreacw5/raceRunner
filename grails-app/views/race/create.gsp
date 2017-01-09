<!DOCTYPE html>
<html id="styl">
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'race.label', default: 'Race')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>
<body>
<style>
html{
    height: 95% !important;
}
</style>
<a href="#create-race" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><g:link onClick="history.back()"><i class="fa fa-long-arrow-left" style="padding-right: 5px" aria-hidden="true"></i><g:message code="backto"/></g:link></li>
        <sec:ifLoggedIn>
            <li><g:link controller="race" action="create"><i class="fa fa-send" style="padding-right: 5px" aria-hidden="true"></i><g:message code="new.run.add.label"/></g:link></li>
            <li><g:link controller="registration" action="create"><i class="fa fa-send-o" style="padding-right: 5px" aria-hidden="true"></i><g:message code="force.run.add.label"/></g:link></li>
        </sec:ifLoggedIn>
        <li><g:link controller="race" action="search"><i class="fa fa-search" style="padding-right: 5px" aria-hidden="true"></i><g:message code="res.home.label"/></g:link></li>
        <sec:ifNotLoggedIn>
            <li class="pull-right"><g:link controller="login" action="auth"><i class="fa fa-lock" style="padding-right: 5px" aria-hidden="true"></i><g:message code="login"/></g:link></li>
        </sec:ifNotLoggedIn>
        <sec:ifLoggedIn>
            <li class="pull-right"><g:link><i class="fa fa-user" style="padding-right: 5px" aria-hidden="true"></i><g:message code="sec.name.label"/> <sec:username/></g:link></li>
        </sec:ifLoggedIn>
    </ul>
</div>

<div id="create-race" class="content scaffold-create" role="main">
    <h1><g:message code="race.organize.label"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.race}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.race}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form action="save">
        <fieldset class="form seetab">
            <fieldset class="form">
                <h4 style="border-bottom: solid #B7B7B7"><g:message code="title.info.label"/></h4>
                <div class="seetab"><a class="seetext"><g:message code="race.name.label"/> <f:widget bean="race" property="raceName"/> </div>
                <div class="seetab"><a class="seetext"><g:message code="race.type.label"/> <f:widget bean="race" property="raceType"/> </div>
                <div class="seetab"><a class="seetext"><g:message code="race.cost.label"/> <f:widget bean="race" property="cost"/> € </div>
                <div class="seetab"><a class="seetext"><g:message code="race.distance.label"/> <f:widget bean="race" property="distance"/> <f:widget bean="race" property="distanceType" value="Km"/> </div>
                <div class="seetab"><a class="seetext"><g:message code="race.maxRunner.label"/> <f:widget bean="race" property="maxRunners"/> </div>
                <div class="seetab"><a class="seetext"><g:message code="race.date.label"/> <f:widget bean="race" property="startDateName" value= '${new Date()}'/></a></div>
                <div class="seetab"><a class="seetext"><g:message code="race.times.label"/> <f:widget bean="race" property="times" value="20:00"/></a></div>
                <h4 style="border-bottom: solid #B7B7B7"><g:message code="title.place.label"/></h4>
                    <div class="seetab"><a class="seetext"><g:message code="race.city.label"/> <f:widget bean="race" property="city"/></a></div>
                    <div class="seetab"><a class="seetext"><g:message code="race.address.label"/> <f:widget bean="race" property="addressCode"/></a></div>
                <div class="seetab"><a class="seetext"><g:message code="race.civicAd.label"/> <f:widget bean="race" property="civicAd"/></a></div>
                <div class="seetab"><a class="seetext"><g:message code="race.postCode.label"/> <f:widget bean="race" property="postalCode"/></a></div>
                <h4 style="border-bottom: solid #B7B7B7"><g:message code="title.additional.label"/></h4>
                <div class="seetab"><a class="seetext"><g:message code="race.organizator.label"/> <f:widget bean="race" property="organizator"/></a></div>
                <div class="seetab"><a class="seetext"><g:message code="race.sponsor.label"/> <f:widget bean="race" property="sponsor"/></a></div>

            </fieldset>
        </fieldset>
        <fieldset class="buttons pull-right">
            <g:submitButton name="create" class="save"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>


    </g:form>
</div>
</body>
</html>
