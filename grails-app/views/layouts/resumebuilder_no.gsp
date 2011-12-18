<%--
  Created by IntelliJ IDEA.
  User: dinesh
  Date: 9/7/11
  Time: 12:08 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <style>
    .menu1 {
        width: 20%;
        height: 100%;
        vertical-align: top;
        font-size: 11px;
    }

    .content1 {
        width: 80%;
        background-color: #b2d1ff;
        height: 100%;
        vertical-align: top;
        padding-left: 5%;
        padding-right: 5%;
    }

    .header1 {
        width: 100%;
        height: 13%;
        font-size: 10px;

    }

    .title1 {
        width: 30%;
        float: left;
        display: inline-block;
        color: #006dba;
        font-size: 28px;
        padding-top: 3%;
        font-weight: bold;

    }

    .title2 {
        width: 70%;
        text-align: right;
        float: right;
        display: inline-block;
    }

    .content2 {
        width: 100%;
        height: 87%;
        vertical-align: top;
        background-color: #ffffff;

    }

    iframe#mainFrame {
        width: 100%;
        height: 100%;
        border: solid gray 1px;
        border-top: solid #000000 6px;

    }

    </style>
    <g:javascript library="jquery" plugin="jquery"/>
    <g:javascript>


        function callPage(e) {
            jQuery('#mainFrame').attr('src', e.data.pag);
            return false;
        }

        $(document).ready(function() {
            jQuery('#create_resume').click({'pag':'startNewResume'}, callPage);
            jQuery('#resume_intro').click({'pag':'resumeSectionTabs?tab=0'}, callPage);
            jQuery('#resume_contact_info').click({'pag':'resumeSectionTabs?tab=1'}, callPage);
            jQuery('#resume_edu').click({'pag':'resumeSectionTabs?tab=2'}, callPage);
            jQuery('#resume_emp').click({'pag':'resumeSectionTabs?tab=3'}, callPage);
            jQuery('#resume_ach').click({'pag':'resumeSectionTabs?tab=4'}, callPage);
            jQuery('#resume_goals').click({'pag':'resumeSectionTabs?tab=5'}, callPage);
            jQuery('#resume_skills').click({'pag':'resumeSectionTabs?tab=6'}, callPage);
            jQuery('#resume_interests').click({'pag':'resumeSectionTabs?tab=7'}, callPage);
            jQuery('#resume_preview').click({'pag':'previewResume'}, callPage);
            jQuery('#manage_category').click({'pag':'manageCategory'}, callPage);
        });
    </g:javascript>
    <g:layoutHead/>

</head>


<body scroll="no">
<table border="1" style="width:100%;height:100%;">
    <tr>
        <td class="menu1">
            <ul id="list1">
                <li>
                    <g:link controller="resumeBuilder" action="myResumes">Resume Builder Dashboard</g:link>
                    <ul>
                        <li><a href="" id="create_resume">Create Resume</a></li>
                        <li><a href="" id="create_resume_templates">Create Resume_Templates</a></li>
                        <li><a href="" id="resume_intro">Intro</a></li>
                        <li><a href="" id="resume_contact_info">Contact Info</a></li>
                        <li><a href="" id="resume_edu">Education</a></li>
                        <li><a href="" id="resume_emp">Employment History</a></li>
                        <li><a href="" id="resume_ach">Achievements</a></li>
                        <li><a href="" id="resume_goals">Goals</a></li>
                        <li><a href="" id="resume_skills">Skills</a></li>
                        <li><a href="" id="resume_interests">Interests</a></li>
                    </ul>
                </li>
                <li><a href="previewResume" id="resume_preview">Preview</a></li>
                <li>Manage Resume
                  <ul>
                      <li><a href="" id="resume_sample">Sample Resumes </a> </li>
                      <li><a href="" id="resume_add_new">Add New Resume </a> </li>
                  </ul>
                </li>
            </ul>
            
            
      
                       
                                       
        
            
            
        </td>
        <td class="content1">
            <div class="header1">
                <span class="title1">experience</span>
                <span class="title2">
                    <span style="color: #006dba;">
                        Hi Test | Sign out<br/>
                        My Account | Need Help | Contact Us
                    </span>
                    <br/>&nbsp;<br/>&nbsp;

                <g:link controller="resumeBuilder" action="myResumes">DASHBOARD</g:link> |
                <g:link>JOB CENTER</g:link> |
                <g:link>PORTFOLIO</g:link> |
                <g:link>RESOURCES</g:link> |
                <g:link>MY RESUME</g:link> |
                <g:link>PREMIUM</g:link>
                </span>
            </div>


            <div class="content2">
                <g:layoutBody/>
            </div>
        </td>

    </tr>

</table>

</body>
</html>