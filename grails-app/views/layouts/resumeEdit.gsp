<%--
  Created by IntelliJ IDEA.
  User: dinesh
  Date: 15/7/11
  Time: 12:44 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ResumeBuilder </title>
    <link href="${resource(dir: 'css', file: 'style.css')}" rel="stylesheet" type="text/css"></link>
    <link href="${resource(dir: 'css', file: 'table1.css')}" rel="stylesheet" type="text/css"></link>
    <g:javascript library="jquery" plugin="jquery"/>
    <jqui:resources themeCss="${resource(dir:'css',file:'smoothness/jquery-ui-1.8.14.custom.css')}"/>

    <g:javascript>
    function chkAndReload(e) {
    if (e == 'ok')
        window.location.reload();
    }

    </g:javascript>
    <g:javascript library="initdialog"/>
    <g:javascript library="tabSubmit"/>
    <g:layoutHead/>


</head>

<body>

<div class="main">
		<g:render template="/layouts/rb_header"/>
        <!--main_container-->
		<div class="container">
        <div class="breadcrumbs">
          <ul>
           <li><g:link controller="dashboard" action="viewMyResumes">My Resume </g:link> </li>
           <li><g:link controller="dashboard" action="templatesList" params="[resId:resume?.id]">Templates</g:link></li>
           <li>Sections</li>
          </ul>
        </div>
        <!--left_container-->
        <div class="container_left">
          <h1>Sections</h1>


             <div class="nav-container">
    			 <ul>
                    <li class="${params.tab=='intro'?'current':''}"><span></span><a href="introPage?tab=intro&res=${resume.id}"><g:message code="resume.form.Introduction.title"/></a><span style="background-position:right"></span></li>
                    <li class="${params.tab=='contact'?'current':''}"><span></span><a href="contactInfoPage?tab=contact&res=${resume.id}"><g:message code="resume.form.contact.title"/></a><span style="background-position:right"></span></li>
                    <li class="${params.tab=='edu'?'current':''}"><span></span><a href="educationPage?tab=edu&res=${resume.id}"><g:message code="resume.form.education.title"/></a><span style="background-position:right"></span></li>
                    <li class="${params.tab=='emp'?'current':''}"><span></span><a href="employmentPage?tab=emp&res=${resume.id}"><g:message code="resume.form.employment.title"/></a>
                    <span style="background-position:right"></span></li>

                    <li class="${params.tab=='ach'?'current':''}"><span></span><a href="achievements?tab=ach&res=${resume.id}"><g:message code="resume.form.achievement.title"/></a>
                    <span style="background-position:right"></span></li>

                    <li class="${params.tab=='goal'?'current':''}"><span></span><a href="goalPage?tab=goal&res=${resume.id}"><g:message code="resume.form.goal.title"/></a><span style="background-position:right"></span></li>
                    <li class="${params.tab=='skill'?'current':''}"><span></span><a href="skillsPage?tab=skill&res=${resume.id}"><g:message code="resume.form.skills.title"/></a><span style="background-position:right"></span></li>
                     <li class="${params.tab=='intr'?'current':''}"><span></span><a href="interestsPage?tab=intr&res=${resume.id}"><g:message code="resume.form.interests.title"/></a><span style="background-position:right"></span></li>
                  </ul>
    		</div>

          <div class="section_cont">
              <g:layoutBody/>
          </div>

          <div class="section_cont_bottom"><img src="${resource(dir:'images',file:'content_bottom.png')}"  /></div>

        </div>
        <!--left_container end-->

        <!--right_container-->

        <div class="container_right">
       	  <h1>YOU ARE EDITING:</h1>
            <span> ${resume?.name}</span>
            <div class="rename">
        <g:link action="viewMyResumes" controller="dashboard" onClick="return showRenameDialog(${resume.id});">Rename</g:link>
                </div>


        <g:link action="previewResume" controller="dashboard" params="[resId:resume?.id]">
                <img src="${resource(dir:'images',file:'preview.png')}"/>
            </g:link>


            <div class="download_setting">
            	<ul>
                <li><g:link controller="dashboard" action="templatesList" params="[resId:resume.id]">Change Template</g:link></li>

                <li><g:link target="_blank" action="exportDOC" class="doc" controller="dashboard" params="[resId:resume.id]">Download a DOC version</g:link></li>
                <li>
                    <g:link class="pdf" target="_blank" action="exportPDF" controller="dashboard" params="[resId:resume.id]">Download a PDF version</g:link>
                    </li>
                <li>
                    <a href="javascript:void(0)" class="creat_copy" onclick="return showCreateCopyDialog(${resume.id})"> Create Copy</a>
                </li>
                <li><a href="javascript:void(0)" onclick="showDelDialog(${resume.id})">Delete</a></li>

            	</ul>
            </div>


        </div>
        <!--right_container end-->

        </div>
		<!--main_containerEnd-->
         <!--main_footer-->
        <div class="footer">
            <ul class="footer_links">
               <li><a href="">Blog</a></li>
               <li><a href="">About Us</a></li>
               <li><a href="">For Employers</a>
               <li><a class="last" href="">For Educators</a></li>
           </ul>

        	<div class="social">
            	<span>Follow Us</span>
                <a href="javascript:void(0)"><img src="${resource(dir:'images',file:'rss.png')}" /></a>
                <a href="javascript:void(0)"><img src="${resource(dir:'images',file:'facebook.png')}" /></a>
                <a href="javascript:void(0)"><img src="${resource(dir:'images',file:'twitter.png')}" /></a>
            </div>


  		</div>
         <!--main_footer end-->
         <div class="copy_right">
         	Experience, Inc. Copyright © 2011     <a href="javascript:void(0)">Privacy Policy</a>  |  <a href="javascript:void(0)">Terms of Service</a>

          </div>
</div>

   <g:render template="../dialogs/initDialog" model="['resume':resume]" />

</body>
</html>