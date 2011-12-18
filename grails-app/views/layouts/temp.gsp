<%--
  Created by IntelliJ IDEA.
  User: dinesh
  Date: 7/24/11
  Time: 1:17 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ResumeBuilder - Education</title>
    <link href="${resource(dir: 'css', file: 'style.css')}" rel="stylesheet" type="text/css"></link>
    <link href="${resource(dir: 'css', file: 'table1.css')}" rel="stylesheet" type="text/css"></link>
    <g:javascript library="jquery" plugin="jquery"/>
    <jqui:resources themeCss="${resource(dir:'css',file:'smoothness/jquery-ui-1.8.14.custom.css')}"/>
    <g:javascript library="initdialog"/>
    <g:javascript library="tabSubmit"/>

    <g:layoutHead/>
</head>

<body>

<div class="main">
		<g:render template="/layouts/rb_header"/>

        <!--main_container-->
		<div class="container"  style="width:100%">
        <div class="breadcrumbs">
            <ul>
                  <img src="../images/edit_ico.png" style="width:16px; height:15px; margin-left: -82px;" /><li><g:link controller="resumeBuilder" class="edit" action="resumeSectionAccordian" params="[res:resume.id]">Edit Mode </g:link>|</li>
             %{--<li><g:link  controller="dashboard" action="viewMyResumes" class="breadcrumbs_preview">Back/Close Preview</g:link></li>--}%
            </ul>

        </div>
        <!--left_container-->
        <div  style="width:100%">
          <h1 class="preview">Preview Resume</h1>
          <div class="big_box_layout"  style="width:100%">
                	<g:layoutBody/>
          </div>

          <div class="section_cont_bottom"><img src="${resource(dir:'images',file:'content_bottom.png')}"  /></div>
        </div>
        <!--left_container end-->

        <!--right_container-->

        <!--right_container end-->

        </div>
		<!--main_containerEnd-->
         <!--main_footer-->
        <div class="footer">
            <ul class="footer_links">
               <li><a href="">Blog</a></li>
               <li><a href="">About Us</a></li>
               <li><a href="">For Employers</a></li>
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

<g:render template="../dialogs/initDialog"/>

</body>
</html>
