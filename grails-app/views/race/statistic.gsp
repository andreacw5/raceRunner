<%--
  Created by IntelliJ IDEA.
  User: Andrea Zago
  Date: 09/01/2017
  Time: 15:11
--%>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Statistiche</title>
    <script src= "https://cdn.zingchart.com/zingchart.min.js"></script>

    <script> zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9","ee6b7db5b51705a13dc2339db3edaf6d"];</script></head>
<body>
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
        </sec:ifLoggedIn>
</div>
<div id='myChart'><a class="zc-ref" href="https://www.zingchart.com/">Charts by ZingChart</a></div>
<asset:javascript src="zingaLiune.js"/>
</body>
</html>