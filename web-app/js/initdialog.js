jQuery(document).ready(function() {


    jQuery("#delDialog").dialog({autoOpen:false,modal: true, width:500 });
    jQuery('#edu_dialog').dialog({modal:true,autoOpen:false,width:500});
    jQuery('#emp_dialog').dialog({modal:true,autoOpen:false,width:500});
    jQuery('#editDialogs').dialog({modal:true,autoOpen:false,width:500});
    jQuery('#ach_dialog').dialog({modal:true,autoOpen:false,width:500});


    jQuery('#education_startDate').datepicker({'changeYear':true,'changeMonth':true,'showOn': "button",
		'buttonImage': contextpath +"/images/calendar.gif",
		'buttonImageOnly': true,'beforeShow': customRangeMax});
    jQuery('#education_endDate').datepicker({'changeYear':true,'changeMonth':true,'showOn': "button",
		'buttonImage': contextpath +"/images/calendar.gif",
		'buttonImageOnly': true,'beforeShow': customRange});

    jQuery('#employment_startDate').datepicker({'changeYear':true,'changeMonth':true,'showOn': "button",
		'buttonImage': contextpath +"/images/calendar.gif",
		'buttonImageOnly': true,'beforeShow': customRangeMax});
    jQuery('#employment_endDate').datepicker({'changeYear':true,'changeMonth':true,'showOn': "button",
		'buttonImage': contextpath +"/images/calendar.gif",
		'buttonImageOnly': true,'beforeShow': customRange});
    jQuery('#achievement_achDate').datepicker({'changeYear':true,'changeMonth':true,'showOn': "button",
		'buttonImage': contextpath +"/images/calendar.gif",
		'buttonImageOnly': true});

    jQuery('#newResumeDialog').dialog({modal:true,autoOpen:false,show:'highlight',hide:'highlight',width:450});
    jQuery('#renameDialog').dialog({autoOpen:false,modal:true,show:'highlight',hide:'highlight',width:450});
    jQuery('#createCopyDialog').dialog({autoOpen:false,modal:true,show:'highlight',hide:'highlight',width:450});
     function customRange(a) {
    	   var b = new Date();
    	   var c = new Date(b.getFullYear(), b.getMonth(), b.getDate());
    	   if (a.id == 'employment_endDate') {
    	       if ($('#employment_startDate').datepicker('getDate') != null) {
    	           c = $('#employment_startDate').datepicker('getDate');
    	       }
    	   }
    	   else if(a.id == 'education_endDate') {
    	       if ($('#education_startDate').datepicker('getDate') != null) {
    	           c = $('#education_startDate').datepicker('getDate');
    	       }
    	   }
    	   return {
    	       minDate: c
    	   }
    	}
     function customRangeMax(a) {
  	   var b = new Date();
  	   var c = new Date(b.getFullYear(), b.getMonth(), b.getDate());
  	   if (a.id == 'employment_startDate') {
  	       if ($('#employment_endDate').datepicker('getDate') != null) {
  	           c = $('#employment_endDate').datepicker('getDate');
  	         
  	       }
  	   }
  	   else if(a.id == 'education_startDate') {
  	       if ($('#education_endDate').datepicker('getDate') != null) {
  	           c = $('#education_endDate').datepicker('getDate');
  	         
  	       }
  	   }
  	   return {
  	       maxDate: c
  	   }
  	}	
    	 

});


function setSortingCss(sec) {
	
    jQuery('#'+sec+' tbody tr').each(function(i){
        jQuery(this).removeClass('even');
        jQuery(this).removeClass('odd');

        if(i%2==0)
        jQuery(this).addClass('even');
        else
        jQuery(this).addClass('odd');


    });
}

function showNewResumeDialogWithTemplate(tmpName){
    jQuery('#create_dialog_template_id').val(tmpName);
    showNewResumeDialog();
}
function clearRenameDialog(){
	jQuery('#new_res_dialog').val('');
	jQuery('#newResumeError').html(' ');
}

function showNewResumeDialog() {

	clearRenameDialog();
jQuery('#resumeName').val('');
    jQuery('#newResumeDialog').dialog('open');

}
function clearRenameDialog(){
	jQuery('#new_res_dialog').val('');
	jQuery('#newResumeError').html(' ');
}


function showEduDialog() {
    clearEduDialog()
    jQuery('#edu_dialog').dialog('open');
    return false;
}
function clearEduDialog() {

    jQuery('#education_startDate').val('');
    jQuery('#education_endDate').val('');
    jQuery('#education_institution').val('');
    jQuery('#education_institutionAddress').val('');
    jQuery('#education_qualificationName').val('');
    jQuery('#education_qualificationType').val('');
    jQuery('#education_qualificationDescription').val('');
    jQuery('#edu_errors').html('');
}

function updateResumeFont(url) {

    jQuery.ajax({
                url:url,
                type:'GET',
                data:{
                    'cfont':jQuery('#cfont').val(),
                    'csize':jQuery('#csize').val(),
                    'res':jQuery('#res_font').val()

                },
                success:function(d) {

                }

            });
}

function resetResume() {
    jQuery.ajax({
                url:'resetResumeFont',
                type:'GET',
                data:{
                    'res':jQuery('#res_font').val()
                },

                success:function(xml) {

                    // window.location.href= window.location.href;
                    if (jQuery(xml).find('result').find('flag').text() == 'ok') {
                        var fnt=jQuery(xml).find('result').find('font').text();
                         jQuery('#preview_box').css('font-family',fnt);
                         jQuery('#cfont').val(fnt);
                        jQuery('#fontName').val(fnt);

                         var cngFnt=jQuery(xml).find('result').find('font-size').text();
                         jQuery('#preview_box').css('font-size',cngFnt+'px');
                         jQuery('#csize').val(cngFnt);
                        jQuery('#fontSize').val(cngFnt);

                        jQuery('#preview_box table tr td').css('font-family',fnt);
                        jQuery('#preview_box table tr td div').css('font-family',fnt);
                        jQuery('#preview_box p').css('font-family',fnt);

                        jQuery('#preview_box table tr td').css('font-size',cngFnt+'px');
                        jQuery('#preview_box table tr td div').css('font-size',cngFnt+'px');
                        jQuery('#preview_box table tr td p').css('font-size',cngFnt+'px');

                    }

                }
            });
}

function showAchDialog() {

    clearAchDialog()
    jQuery('#ach_dialog').dialog('open');
    return false;
}
function clearAchDialog() {
    jQuery('#achievement_achDate').val('');
    jQuery('#achievement_title').val('');
    jQuery('#achievement_description').val('');
    jQuery('#achInfo').html('');
}

function showEmpDialog() {
    clearEmpDialog()
    jQuery('#emp_dialog').dialog('open');
    return false;
}
function clearEmpDialog() {
    jQuery('#employment_startDate').val('');
    jQuery('#employment_endDate').val('');
    jQuery('#employment_position').val('');
    jQuery('#employment_organization').val('');
    jQuery('#employment_description').val('');
    jQuery('#empInfo').html('');
}

function showEmpEditDialog(rid, eid, url) {
    $.ajax({
                url:url,
                data:{'res':rid,'eid':eid},
                type: 'GET',
                success:function(d) {
                    jQuery('#editDialogs').html(d);
                    jQuery('#editDialogs').dialog('open');
                },
                failure:function() {

                },
                complete:function() {

                }
            });
    return false;
}


function showEduEditDialog(rid, eid, url) {
    $.ajax({
                url:url,
                data:{'res':rid,'eid':eid},
                type: 'GET',
                success:function(d) {
                    jQuery('#editDialogs').html(d);
                    jQuery('#editDialogs').dialog('open');
                },
                failure:function() {

                },
                complete:function() {

                }
            });
    return false;
}


function showAchEditDialog(rid, eid, url) {
    jQuery.ajax({
                url:url,
                data:{'res':rid,'eid':eid},
                type: 'GET',
                success:function(d) {
                    jQuery('#editDialogs').html(d);
                    jQuery('#editDialogs').dialog('open');
                },
                failure:function() {

                },
                complete:function() {

                }
            });
    return false;
}

function showCreateCopyDialog(idd) {
    //alert(idd);
	
    jQuery('#createCopyDialog').dialog('open');
    jQuery('#copyResumeError').html(" ");
    jQuery('#copyResId').val(idd);
    return false;
}

function showRenameDialog(idd) {
    //alert(idd);
	//clearRenameDialog();
    //alert("rname");
    jQuery('#renameDialog').dialog('open');
    jQuery('div#renameResumeError').html(" ");
    jQuery('#resId').val(idd);
    return false;
}

function showDelDialog(idd) {
    //alert("inside del dialog");
    jQuery('#delId').val(idd);
    jQuery('#delDialog').dialog('open');
    return false;

}


function hideDialog(d){
    jQuery(d).dialog('close');
    return false;
}

