<%--
  Created by IntelliJ IDEA.
  User: dinesh
  Date: 7/8/11
  Time: 1:15 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <g:javascript library="jquery"/>
    <g:javascript library="jquery/jquery-1.5.1.min"/>
    <g:javascript library="jquery/jquery-ui-1.8.14.custom.min"/>

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}"/>
    <link rel="stylesheet" type="text/css"
          href="${resource(dir: 'css', file: 'ui-lightness/jquery-ui-1.8.14.custom.css')}"></link>

    <link rel="stylesheet" type="text/css"
          href="${resource(dir: 'css', file: 'ui-lightness/jquery-ui-1.8.14.custom.css')}"></link>


    <g:javascript>
      </g:javascript>
    <g:layoutHead/>
    <style>
    .sidemenu {
        width: 15%;
        font-size: 18px;
    }

    .maincontent {
        width: 85%;
    }
    </style>

    <g:javascript>
        function setResumeName() {
            jQuery('#newResume_nameDialog').dialog('open')

            return false;
        }

        $(document).ready(function() {
            jQuery('#newResume_nameDialog').dialog({ autoOpen: false,modal:true,width:400,height:150})
            jQuery('#createNewResume').click(setResumeName);
        });
    </g:javascript>
</head>

<body>

<table style="width:100%;border: solid black 1px;">
    <tr>
        <td colspan="2" style="width:75%;"><span style="font-size: 35px;">experience</span><sup>TM
            <span style="font-size: 30px;color:red;font-weight: bold;padding-left:25%;">Resume Manager</span>
        </sup></td>
        <td style="width:25%;">
            Welcome User
            <g:link action="signOut">Sign out</g:link>
        </td>
    </tr>
</table>
<table style="width:100%;border: solid black 1px;height:100%;">
    <tr>
        <td class=".sidemenu">

        <td style="width: 20%;background-color: blue;">
            <g:link action="viewMyResumes" style="color: #ffffff;">View My Resumes</g:link><br/>
            <g:link controller="resumeBuilder" action="myResumes"
                    style="color: #ffffff;">Create New Resume</g:link><br/>
            <g:link controller="dashboard" action="viewSamples" style="color: #ffffff;">View Samples</g:link><br/>
            <g:link controller="dashboard" action="viewTemplates" style="color: #ffffff;">View Templates</g:link>

        </td>
    </td>
        <td style="vertical-align: top;">
            <g:layoutBody/>
        </td>
    </tr>
</table>

<div id="newResume_nameDialog" style="">
    Enter New Resume Name: <input type="text" name="newResume_name" id="newResume_name"/><br/>
    <input type="button" value="OK" id="newResume_ok"/> <input type="button" value="Cancel" id="newResumeName_cancel"/>
</div>

</body>
</html>