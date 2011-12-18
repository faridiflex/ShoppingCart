<%--
  Created by IntelliJ IDEA.
  User: Raviraj
  Date: 7/29/11
  Time: 2:43 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ResumeBuilder - Education</title>
    <g:javascript>
	  var contextpath =   "${request.contextPath}";
    </g:javascript>
    <link href="${resource(dir: 'css', file: 'style.css')}" rel="stylesheet" type="text/css">  </link>
    <link href="${resource(dir: 'css', file: 'table1.css')}" rel="stylesheet" type="text/css"> </link>
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
    <div class="container">
        <div class="breadcrumbs">
            <ul>
                <li><g:link controller="dashboard" action="viewMyResumes">My Resume</g:link></li>
                <li>Templates</li>
            </ul>
        </div>


        <!--left_container-->
        <div class="container_left">
            <h1>Choose Template</h1>


            <div class="big_box_layout">
                <div class="bigboxL"></div>

                <div class="big_box_mid_text">
                    <g:layoutBody/>
                </div>

                <div class="bigboxR"></div>
            </div>


            <div class="section_cont_bottom"><img src="${resource(dir: 'images', file: 'content_bottom.png')}"/></div>

        </div>
    <!--left_container end-->

    <!--right_container-->
        <g:if test='${resume?.id}'>
            <div class="container_right_btn">
                <h1>YOU ARE EDITING:</h1>
            </div>


            <div class="container_right">
                <span>${resume?.name}</span>

                <div class="rename"><g:link action="viewMyResumes" controller="dashboard"
                                            onClick="return showRenameDialog(${resume?.id});">Rename</g:link></div>
                <g:link action="previewResume" controller="dashboard" params="[resId:resume?.id]">
                    <img src="${resource(dir: 'images', file: 'preview.png')}"/>
                </g:link>

                <div class="download_setting">
                    <ul>
                        <li><g:link controller="dashboard" action="templatesList"
                                    params="[resId:resume?.id]">Change Template</g:link></li>

                        <li><g:link target="_blank" action="exportDOC" class="doc" controller="dashboard"
                                    params="[resId:resume?.id]">Download a DOC version</g:link></li>
                        <li>
                            <g:link class="pdf" target="_blank" action="exportPDF" controller="dashboard"
                                    params="[resId:resume?.id]">Download a PDF version</g:link>
                        </li>
                        <li>
                            <a href="javascript:void(0)" class="creat_copy"
                               onclick="return showCreateCopyDialog(${resume?.id})">Create a Copy</a>
                        </li>
                        <li><a href="javascript:void(0)" class="delete"
                               onclick="showDelDialog(${resume?.id})">Delete</a></li>

                    </ul>
                </div>

            </div>
        </g:if>
        <g:else>
            <div class="container_right_btn">
                <h1>YOU ARE EDITING:</h1>
            </div>


            <div class="container_right">
                <span>${resume?.name}</span>

                <div class="rename"><g:link action="viewMyResumes" controller="dashboard">Rename</g:link></div>
                <g:link action="viewMyResumes" controller="dashboard">
                    <img src="${resource(dir: 'images', file: 'preview.png')}"/>
                </g:link>

                <div class="download_setting">
                    <ul>
                        <li><g:link controller="dashboard" action="templatesList"
                                    params="[resId:resume?.id]">Change Template</g:link></li>

                        <li><g:link action="viewMyResumes" controller="dashboard"
                                    class="doc">Download a DOC version</g:link></li>
                        <li>
                            <g:link action="viewMyResumes" controller="dashboard"
                                    class="pdf">Download a PDF version</g:link>
                        </li>
                        <li>
                            <g:link action="viewMyResumes" controller="dashboard"
                                    class="creat_copy">Create a Copy</g:link></a>
                        </li>
                        <li><g:link action="viewMyResumes" controller="dashboard" class="delete">Delete</g:link></li>

                    </ul>
                </div>

            </div>
        </g:else>
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
            <a href="javascript:void(0)"><img src="${resource(dir: 'images', file: 'rss.png')}"/></a>
            <a href="javascript:void(0)"><img src="${resource(dir: 'images', file: 'facebook.png')}"/></a>
            <a href="javascript:void(0)"><img src="${resource(dir: 'images', file: 'twitter.png')}"/></a>
        </div>

    </div>
    <!--main_footer end-->
    <div class="copy_right">
        Experience, Inc. Copyright © 2011     <a href="javascript:void(0)">Privacy Policy</a>  |  <a
            href="javascript:void(0)">Terms of Service</a>

    </div>
</div>

<g:render template="../dialogs/initDialog"/>

</body>
</html>
