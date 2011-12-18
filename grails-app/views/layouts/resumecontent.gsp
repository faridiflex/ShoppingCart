<%--
  Created by IntelliJ IDEA.
  User: dinesh
  Date: 10/7/11
  Time: 4:58 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Simple GSP page</title>
   <g:javascript>
    function chkAndReload(e) {
    if (e == 'ok')
        window.location.reload();
        }

        jQuery(document).ready(function(){
                jQuery('#edu_dialog').dialog({modal:true,autoOpen:false,width:500});
                jQuery('#education_startDate').datepicker({'changeYear':true,'changeMonth':true});
                jQuery('#education_endDate').datepicker({'changeYear':true,'changeMonth':true});
               });
    </g:javascript>

    <g:layoutHead/>
</head>
<body>
<g:layoutBody/>
</body>
</html>