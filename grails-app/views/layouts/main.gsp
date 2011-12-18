<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Experience</title>
    <link href="${resource(dir: 'css', file: 'style.css')}" rel="stylesheet" type="text/css"></link>
    <link href="${resource(dir: 'css', file: 'table1.css')}" rel="stylesheet" type="text/css"></link>
    <g:javascript library="jquery" plugin="jquery"/>
    <g:javascript src="jquery.validate.js"/>
    %{--<jqui:resources themeCss="${resource(dir:'css',file:'smoothness/jquery-ui-1.8.14.custom.css')}"/>--}%
 	<g:layoutHead/>
</head>

<body>

<div class="main">
		<g:render template="/layouts/rb_header"/>
        <!--main_container-->
		<div class="container">
        
        	<g:layoutBody />

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
</body>
</html>