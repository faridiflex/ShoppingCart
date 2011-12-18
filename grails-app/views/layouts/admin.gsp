<%--
  Created by IntelliJ IDEA.
  User: dinesh
  Date: 7/6/11
  Time: 12:03 PM
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title><g:layoutTitle default="Grails"/></title>
    <g:layoutHead/>
    <style type="text/css">
    .maindiv {
        width: 1000px;
        height: 500px
    }

    .header {
        width: 100%;
        border: solid black 2px;
        padding-bottom: 20px;
    }

    .sidebar {
        width: 15%;
        background-color: blue;
        color: #ffffff;
        height: 500px;
        display: inline-block;
    }

    .sidebar span {
        display: inline-block;
        width: 100%;

    }

    .sidebar a {
        border: solid black 2px;
        width: 100%;
        color: #ffffff;

    }

    .content {
        width: 80%;
        background-color: red;
        height: 500px;
        display: inline-block;
        padding: 0px;
        margin: 0px;
    }

.invalidNameClass{
color: #BD1C24;
	float: none;
	font-size: 12px;
	font-weight: bold;
	margin-right: 33px;
	text-align: center;
	width: 314px;
}
    </style>
</head>

<body>

<table style="width:100%;border: solid black 1px;">
    <tr>
        <td style="width:75%;"><span style="font-size: 35px;">experience</span><sup>TM</sup></td>
        <td style="width:30%">welcome ${session.adminUser}

            <g:link controller="admin" action="changePassword">    Change Password</g:link>
            <g:link controller="admin" action="signOut">    Sign out</g:link></td>

    </tr>
</table>
<table style="width:100%;border: solid black 1px;height:100%;">

    <tr>
        <td style="width: 20%;background-color: blue;">
            <g:link  controller="sampleResume" action="adminList" style="color: #ffffff;">Manage Samples</g:link><br/>

            <g:link controller="admin" action="manageCategory" style="color: #ffffff;">Manage Categories</g:link>

        </td>
        <td style="width:80%; vertical-align: top;">

            <g:layoutBody/>

        </td>

    </tr>

</table>

</body>
</html>