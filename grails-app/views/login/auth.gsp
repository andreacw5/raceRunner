<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        Login
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="boxinglayout.css"/>

</head>

<body class="tablet">
<div class="nav" role="navigation">
    <ul>
        <li><a href="${createLink(uri: '/')}"><i class="fa fa-home" style="padding-right: 5px" aria-hidden="true"></i><g:message code="default.home.label"/></a></li>
        <li><g:link controller="race" action="search"><i class="fa fa-search" style="padding-right: 5px" aria-hidden="true"></i><g:message code="res.home.label"/></g:link></li>
    </ul>
</div>

<g:if test="${flash.message}">
    <div class="alert">
        <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
        ${flash.message}
    </div>
</g:if>

<div class="login-page">
    <div class="form">
        <form class="login-form" action="/login/authenticate" method="POST" id="loginForm" autocomplete="off">
            <input type="text" class="text_" name="username" id="username" placeholder="Nome utente"/>
            <input type="password" class="text_" name="password" id="password" placeholder="password"/>
            <button type="submit" id="submit" value="Login">Accedi</button>
        </form>
    </div>
</div>
<script>
    (function() {
        document.forms['loginForm'].elements['username'].focus();
    })();
    $('.message a').click(function(){
        $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
    });
</script>
</body>
</html>
