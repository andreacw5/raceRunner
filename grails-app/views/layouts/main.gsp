<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="/../font-awesome-4.7.0/css/font-awesome.css"/>

    <g:layoutHead/>
</head>

<body class="tablet">

<div class="navbar navbar-default navbar-static-top " role="navigation">
    <sec:ifLoggedIn>
        <a class="pull-right arealogin" href="/race/index">

            <i class="fa fa-male green" title="<g:message
                    code="sec.name.label"/> <sec:username/>" style="padding-right: 5px; text-align: center"
               aria-hidden="true"></i><g:message
                code="sec.name.label"/> <sec:username/>!

        </a>
    </sec:ifLoggedIn>
    <div class="container">
        <div class="navbar-header">

            <a class="navbar-brand" href="/race/index" style="font-size: large">
                <i class="fa grails-icon">
                    <asset:image src="runner-icon.png"/>
                </i> Race Runner
            </a>
        </div>

        <div class="navbar-collapse collapse" aria-expanded="false" style="height: 0.8px;">
        </div>
    </div>
</div>
<g:layoutBody/>

<asset:javascript src="application.js"/>
<asset:deferredScripts/>
</body>
</html>
