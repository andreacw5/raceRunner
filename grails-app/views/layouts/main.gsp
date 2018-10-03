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
    <asset:stylesheet src="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>

    <g:layoutHead/>
</head>

<body>
<div class="boxed-area">
    <div style="overflow: auto">
    <div class="navbar navbar-default navbar-static-top " role="navigation">
        <sec:ifLoggedIn>
            <a class="pull-right arealogin" type="submit" data-toggle="modal" data-target="#exitModal" tabindex="-1"
               aria-hidden="true">

                <i class="fa fa-unlock fa-3x"
                   title="Utente attualmente connesso come <sec:username/>!" style="text-align: center; color: #32b62e"
                   aria-hidden="true"></i>

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
    </div>
    <g:layoutBody/>

</div>
<asset:javascript src="application.js"/>
<asset:deferredScripts/>
</body>
</html>
