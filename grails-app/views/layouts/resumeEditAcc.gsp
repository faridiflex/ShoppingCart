<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ResumeBuilder - Education</title>
    <link href="${resource(dir: 'css', file: 'style.css')}" rel="stylesheet" type="text/css"/>
    <link href="${resource(dir: 'css', file: 'table2.css')}" rel="stylesheet" type="text/css"/>
    
     <g:javascript>
	  var contextpath =   "${request.contextPath}";
     </g:javascript>
    
    
    <g:javascript library="jquery" plugin="jquery"/>
    <jqui:resources themeCss="${resource(dir:'css',file:'smoothness/jquery-ui-1.8.14.custom.css')}"/>

    <link href="${resource(dir:'css',file:'jquery.bubblepopup.v2.3.1.css')}" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'slide.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.bubblepopup.v2.3.1.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'help.js')}"></script>


    <g:javascript>
        function chkAndReload(e) {
            if (e == 'ok')
                window.location.reload();
        }
        
        
       

        jQuery(document).ready(function() {
//
//
//            $('#intro_help').CreateBubblePopup({ innerHtml: 'Resume introduction should not exceed 800 characters', themeName: 'orange',themePath:'../images/jquerybubblepopup-theme' });
//            $('#contact_help').CreateBubblePopup({ innerHtml: 'Phone1 format xxx-xxx-xxxx<br/>Extended Address and Phone2 is optional<br/>',themeName: 'orange',themePath:'../images/jquerybubblepopup-theme' });
//            $('#edu_help').CreateBubblePopup({ innerHtml: 'Drag on education details to sort row display order<br/>Edit to Update Education<br/>Add and Delete Education',themeName: 'orange',themePath:'../images/jquerybubblepopup-theme' });
//            $('#emp_help').CreateBubblePopup({ innerHtml: 'Drag on employment details to sort row display order<br/>Edit to Update Employment<br/>Add and Delete Employment',themeName: 'orange',themePath:'../images/jquerybubblepopup-theme' });
//            $('#ach_help').CreateBubblePopup({ innerHtml: 'Drag on achievement details to sort row display order<br/>Edit to Update Achievement<br/>Add and Delete Achievement',themeName: 'orange',themePath:'../images/jquerybubblepopup-theme' });
//            $('#skill_help').CreateBubblePopup({ innerHtml: 'Resume Skill should not exceed 5000 characters',themeName: 'orange',themePath:'../images/jquerybubblepopup-theme' });
//            $('#goal_help').CreateBubblePopup({ innerHtml: 'Resume Goal should not exceed 750 characters',themeName: 'orange',themePath:'../images/jquerybubblepopup-theme' });
//            $('#interest_help').CreateBubblePopup({ innerHtml: 'Resume Interest should not exceed 5000 characters',themeName: 'orange',themePath:'../images/jquerybubblepopup-theme' });


            jQuery('#sort_emp tbody').sortable({
            update:function(event, ui) {
            setSortingCss('sort_emp');
            } 

            });
                       
            jQuery('#sort_edu tbody').sortable({
                update: function(event, ui) {
                    jQuery('#sort_edu tbody tr').each(function(i){

                        jQuery(this).removeClass('even');
                        jQuery(this).removeClass('odd');

                        if(i%2==0)
                        jQuery(this).addClass('even');
                        else
                        jQuery(this).addClass('odd');


                    });
                }
            });
            jQuery('#sort_ach tbody').sortable({

             update: function(event, ui) {
                    jQuery('#sort_ach tbody tr').each(function(i){

                        jQuery(this).removeClass('even');
                        jQuery(this).removeClass('odd');

                        if(i%2==0)
                        jQuery(this).addClass('even');
                        else
                        jQuery(this).addClass('odd');


                    });
                }

            });
            
            closeAllTab();


        });
    </g:javascript>
    <g:javascript library="initdialog"/>
    <g:javascript library="tabSubmit"/>
    <g:layoutHead/>

</head>

<body>
<div class="main">
    <g:render template="/layouts/rb_header"/>
    <!--main_container-->
    <g:layoutBody/>

</div>


<div class="add_botom">You have reached the bottom of your resume content. Click PREVIEW to see how it actually looks now.</div>

<g:link action="previewResume" title="${message(code: 'preview.popup_help')}" controller="dashboard" params="[resId:resume?.id]" class="add_prev">
    <img src="${resource(dir:'images',file:'preview.png')}"/>
</g:link>


</div>

<div class="bigboxR"></div>
</div>


<div class="section_cont_bottom"><img src="${resource(dir:'images',file:'content_bottom.png')}"/></div>

</div>
<!--left_container end-->

<!--right_container-->
<div class="container_right_btn">
    <h1>YOU ARE EDITING:</h1>
</div>

<div class="container_right">
    <span>${resume?.name}</span>

    <div class="rename"><g:link action="viewMyResumes" controller="dashboard" title="${message(code: 'rename.popup_help')}"
                                onClick="return showRenameDialog(${resume.id});">Rename</g:link></div>
    <g:link action="previewResume" title="${message(code: 'preview.popup_help')}" controller="dashboard" params="[resId:resume?.id]">
        <img src="${resource(dir:'images',file:'preview.png')}"/>
    </g:link>

    <div class="findcand_role">
        <span>JUMP TO SECTION:</span>
        <ul style="list-style: disc">
            <li><a href="javascript:void(0)" rel="rel_id1">Introduction</a></li>
            <li><a href="javascript:void(0)" rel="rel_id2">Contact Info</a></li>
            <li><a href="javascript:void(0)" rel="rel_id3">Education</a></li>
            <li><a href="javascript:void(0)" rel="rel_id4">Employment History</a></li>
            <li><a href="javascript:void(0)" rel="rel_id5">Achievements</a></li>
            <li><a href="javascript:void(0)" rel="rel_id6">Goals</a></li>
            <li><a href="javascript:void(0)" rel="rel_id7">Skills</a></li>
            <li><a href="javascript:void(0)" rel="rel_id8">Interests</a></li>
        </ul>
    </div>


    <div class="download_setting">
        <ul>
            <li><g:link action="templatesList" class="page_change" title="${message(code: 'create.template.popup_help')}" controller="dashboard"
                        params="[resId:resume.id]">Change Template</g:link></li>
            <li><g:link target="_blank" action="exportDOC" title="${message(code: 'doc.popup_help')}" class="doc" controller="dashboard"
                        params="[resId:resume.id]">Download a DOC version</g:link></li>
            <li><g:link class="pdf" target="_blank"  title="${message(code: 'pdf.popup_help')}" action="exportPDF" controller="dashboard"
                        params="[resId:resume.id]">Download a PDF version</g:link></li>
            <li><a href="javascript:void(0)" onclick="return showCreateCopyDialog(${resume.id})" title="${message(code: 'copy.popup_help')}" class="creat_copy">Create Copy</a></li>
            <li><a href="javascript:void(0)" onclick="showDelDialog(${resume.id})" title="${message(code: 'delete.popup_help')}" class="delete">Delete</a></li>

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
            <a href="javascript:void(0)"><img src="${resource(dir:'images',file:'rss.png')}"/></a>
            <a href="javascript:void(0)"><img src="${resource(dir:'images',file:'facebook.png')}"/></a>
            <a href="javascript:void(0)"><img src="${resource(dir:'images',file:'twitter.png')}"/></a>
        </div>
    </div>

    <div class="copy_right">Experience, Inc. Copyright © 2011     <a href="javascript:void(0)">Privacy Policy</a>  |  <a
            href="javascript:void(0)">Terms of Service</a>
    </div>
</div>
</div>
<g:render template="/dialogs/initDialog" model="['resume':resume]"/>
</body>
</html>
