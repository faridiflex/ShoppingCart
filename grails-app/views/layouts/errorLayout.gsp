<%--
  Created by IntelliJ IDEA.
  User: dinesh
  Date: 15/7/11
  Time: 12:44 AM
  To change this template use File | Settings | File Templates.
--%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ResumeBuilder - Education</title>
    <link href="${resource(dir: 'css', file: 'style.css')}" rel="stylesheet" type="text/css"> </link>
      <link href="${resource(dir: 'css', file: 'table1.css')}" rel="stylesheet" type="text/css"> </link>
      <g:javascript library="jquery" plugin="jquery"/>
      <g:javascript library="popup"/>
      <g:javascript library="jquery.tablesorter.min"/>
      <jqui:resources themeCss="${resource(dir:'css',file:'smoothness/jquery-ui-1.8.14.custom.css')}"/>

      <g:javascript>

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


        <!--left_container-->
        <div class="container_left dashboard_left">
            <h1>
                <img src="${resource(dir:'images',file:'u27_original.png')}"/>
            </h1>
            <!--left_container-->
            <div class="dashboard">

                    <g:layoutBody/>

            </div>
            <!--left_container-->

        </div>

        <!--left_container end-->

        <!--right_container-->

        <div class="container_right dashboard_right">
            <span>SHORT INSTRUCTIONS HERE</span>

            <p>"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
            aliqua. Ut enim ad minim veniam</p>
            <a href="javascript:void(0)" class="create_new"  title="${message(code: 'createResume.popup_help')}" onclick="showNewResumeDialog('no');return false;"><img src="images/create_new.png"/></a>

            <div class="download_setting">
                <ul>

                    <li><g:link controller="dashboard"  title="${message(code: 'create.template.popup_help')}" action="templatesList">Templates</g:link></li>
                </ul>
            </div>
        </div>
        <!--right_container end-->

    </div>
    <!--main_containerEnd-->
    <!--main_footer-->

    <div class="footer">
    <div class="footer_container">
        <ul class="footer_links">
            <li><a class="first" href="">Blog</a></li>
            <li><a href="">About Us</a></li>
            <li><a href="">For Employers</a></li>
            <li><a class="last" href="">For Educators</a></li>
        </ul>

        <div class="social">
            <span>Follow Us</span>
            <a href="javascript:void(0)"><img src="images/rss.png"/></a>
            <a href="javascript:void(0)"><img src="images/facebook.png"/></a>
            <a href="javascript:void(0)"><img src="images/twitter.png"/></a>

        </div>
    </div>

    <div class="copy_right">Experience, Inc. Copyright © 2011     <a href="javascript:void(0)">Privacy Policy</a>  |  <a
            href="javascript:void(0)">Terms of Service</a>
    </div>
</div>
</div>

<g:render template="../dialogs/initDialog"/>

</body>
</html>