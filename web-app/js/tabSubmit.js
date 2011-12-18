function ajaxIntoSubmit(action) {
    var introH = jQuery('#resume_introductionHLine').is(':checked');
    if (introH == false)
        introH = 'no';
    else
        introH = 'yes';

    $.ajax({
        url:action,
        data:{'res':jQuery('#res_id_hidden').val(), 'resume.introduction':jQuery('#resume_introduction').val() ,'resume.introductionHLine':introH},
        type: 'POST',
        success:function(d) {
            jQuery('#intro_message1').html(d);
            openNextTab('rel_id1', 'rel_id2');

        },
        failure:function(a, b) {


        },
        complete:function(d) {

        }
    });
}
function ajaxGoalSubmit(action) {
    var goalH = jQuery('#resume_goalsHLine').is(':checked');
    if (goalH == false)
        goalH = 'no';
    else
        goalH = 'yes';

    $.ajax({
        url:action,
        data:{'res':jQuery('#res_id_hidden').val(),'resume.goals':jQuery('#resume_goals').val() ,'resume.goalsHLine':goalH},

        type: 'POST',
        success:function(d) {
            jQuery('#goal_message1').html(d);

            openNextTab('rel_id6', 'rel_id7');
        },
        failure:function(a, b) {

        },
        complete:function(d) {

        }
    });


}
function ajaxSkillSubmit(action) {
    var skillH = jQuery('#resume_skillsHLine').is(':checked');
    if (skillH == false)
        skillH = 'no';
    else
        skillH = 'yes';

    $.ajax({
        url:action,
        data:{'res':jQuery('#res_id_hidden').val(),'resume.skills':jQuery('#resume_skills').val() ,'resume.skillsHLine':skillH},
        type: 'POST',
        success:function(d) {
            jQuery('#skills_message1').html(d);
            openNextTab('rel_id7', 'rel_id8');

        },
        failure:function(a, b) {

        },
        complete:function(d) {
            jQuery('#message1').html(d);

        }



    });


}
function ajaxContactSubmit(action) {
    var contactH = jQuery('#resume_contactHLine').is(':checked');
    if (contactH == false)
        contactH = 'no';
    else
        contactH = 'yes';

    $.ajax({
        url:action,
        data:{

            'contact.fullName':jQuery('#contact_fullName').val().trim(),
            'contact.streetAddress':jQuery('#contact_streetAddress').val().trim(),
            'contact.extendedAddress':jQuery('#contact_extendedAddress').val().trim(),
            'contact.city':jQuery('#contact_city').val().trim(),
            'contact.state':jQuery('#contact_state').val(),
            'contact.zipCode':jQuery('#contact_zipCode').val(),
            'contact.pStreetAddress':jQuery('#p_contact_streetAddress').val().trim(),
            'contact.pExtendedAddress':jQuery('#p_contact_extendedAddress').val().trim(),
            'contact.pCity':jQuery('#p_contact_city').val().trim(),
            'contact.pState':jQuery('#p_contact_state').val(),
            'contact.pZipCode':jQuery('#p_contact_zipCode').val(),
            'contact.phone1':jQuery('#contact_phone1').val().trim(),
            'contact.phone2':jQuery('#contact_phone2').val().trim(),
            'contact.email':jQuery('#contact_email').val().trim(),
            'resume.contactHLine':contactH

        },
        type: 'POST',
        success:function(d) {
            if (d == 'ok') {
                //jQuery('#contact_message1').html(d);
                jQuery('#contact_message1').html(" ");
                openNextTab('rel_id2', 'rel_id3');

                // alert(jQuery('#contact_fullName').val().trim());
                jQuery('#contact_fullName').val(jQuery('#contact_fullName').val().trim());
                jQuery('#contact_streetAddress').val(jQuery('#contact_streetAddress').val().trim());
                jQuery('#contact_extendedAddress').val(jQuery('#contact_extendedAddress').val().trim());
                jQuery('#contact_city').val(jQuery('#contact_city').val().trim());
                jQuery('#contact_state').val();
                jQuery('#contact_zipCode').val();
                jQuery('#p_contact_streetAddress').val(jQuery('#p_contact_streetAddress').val().trim());
                jQuery('#p_contact_extendedAddress').val(jQuery('#p_contact_extendedAddress').val().trim());
                jQuery('#p_contact_city').val(jQuery('#p_contact_city').val().trim());
                jQuery('#p_contact_state').val();
                jQuery('#p_contact_zipCode').val();
                jQuery('#contact_phone1').val(jQuery('#contact_phone1').val().trim());
                jQuery('#contact_phone2').val(jQuery('#contact_phone2').val().trim());
                jQuery('#contact_email').val(jQuery('#contact_email').val().trim());
            }
            else {

                jQuery('#contact_message1').html(d);
            }
        },
        failure:function(a, b) {
        },
        complete:function(d) {
        }



    });

}
function ajaxInterestSubmit(action) {
    var interestH = jQuery('#resume_interestsHLine').is(':checked');
    if (interestH == false)
        interestH = 'no';
    else
        interestH = 'yes';
    $.ajax({
        url:action,
        data:{'res':jQuery('#res_id_hidden').val(),'resume.interests':jQuery('#resume_interests').val() ,'resume.interestsHLine':interestH},
        type: 'POST',
        success:function(d) {

            jQuery('#interests_message1').html(d);
            closeAllTab();
        },
        failure:function(a, b) {
        },
        complete:function(d) {
        }
    });
}

function hideDelDialog() {
    jQuery('#delDialog').dialog('close');
}

function saveNewEdu(action) {
    //alert(ujQery('#edu_id_hidden').val());
    //alert(jQuery('#education_startDate').val());
    jQuery.ajax({

        url:action,
        type:'POST',
        dataType:'XML',
        data:{
            'res':jQuery('#res_id_hidden').val(),
            'education.startDate':jQuery('#education_startDate').val(),
            'education.endDate':jQuery('#education_endDate').val(),
            'education.institution':jQuery('#education_institution').val(),
            'education.institutionAddress':jQuery('#education_institutionAddress').val(),
            'education.qualificationName':jQuery('#education_qualificationName').val(),
            'education.qualificationType':jQuery('#education_qualificationType').val(),
            'education.qualificationDescription':jQuery('#education_qualificationDescription').val()

        },
        success:function(xml) {
            if (jQuery(xml).find('result').find('flag').text() == 'ok') {
                var txt = '<tr id=' + (jQuery(xml).find('result').find('edu_id').text()) + ' class="' + ((jQuery('#sort_edu tr:last').attr('class') == 'even') ? 'odd' : 'even') + '">';
                txt += '<td>' + jQuery('#education_startDate').val() + '</td>';
                txt += '<td>' + jQuery('#education_endDate').val() + '</td>';
                txt += '<td>' + jQuery('#education_qualificationName').val() + '</td>';
                txt += '<td id="ct"><a onclick="return showEduEditDialog(' + (jQuery('#res_id_hidden').val()) + ',' + (jQuery(xml).find('result').find('edu_id').text()) + ');" href="resumeSectionTabs">Edit</a>&nbsp;|&nbsp;';
                txt += '<a href="#" onclick="return deleteEducation(' + (jQuery(xml).find('result').find('edu_id').text()) + ',' + (jQuery('#res_id_hidden').val()) + ');return false;">&nbsp;Delete</a></td>';


                jQuery('#edu_dialog').dialog('close');
                jQuery('#sort_edu tbody').append(txt);
                jQuery('#sort_edu tbody tr:last').effect('highlight', 1000);

            }
            else
            if (jQuery(xml).find('result').find('flag').text() == 'fail') {

                jQuery(xml).find('result').find('error').each(function(i, ele) {
                    //alert(i+ '  ' +$(this).text());
                    jQuery('#edu_errors').append($(this).text());
                    jQuery('#edu_errors').append('<br/>');

                });


            }

        }

    });

}
function updateEmp(action) {
    jQuery.ajax({
        url:action,
        type:'POST',
        dataType:'XML',
        data:{
            'res':jQuery('#res_id_hidden').val(),
            'eid':jQuery('#edit_id_hidden').val(),
            'employment.startDate':jQuery('#employment_startDate_edit').val(),
            'employment.endDate':jQuery('#employment_endDate_edit').val(),
            'employment.position':jQuery('#employment_position_edit').val(),
            'employment.organization':jQuery('#employment_organization_edit').val(),
            'employment.description':jQuery('#employment_description_edit').val()


        },
        success:function(xml) {
            if (jQuery(xml).find('result').find('flag').text() == 'ok') {
                //alert("hi"+jQuery('#sort_ach tr#' + emp_id).find('td#ct').html());
                //jQuery('#sort_edu tr#' + edu_id).find('td#ct').html()
//                        var edu_id = jQuery('#edu_edit_id_hidden').val();
//                        var edu_res = '<td>' + jQuery('#education_startDate_edit').val() + '</td>';
//                        edu_res += '<td>' + jQuery('#education_endDate_edit').val() + '</td>';
//                        edu_res += '<td>' + jQuery('#education_qualificationName_edit').val() + '</td>';
//                        edu_res += '<td id="ct">' + jQuery('#sort_edu tr#' + edu_id).find('td#ct').html() + '</td>';

                var emp_id = jQuery('#edit_id_hidden').val();
                var emp_res = '<td>' + jQuery('#employment_startDate_edit').val() + '</td>';
                emp_res += '<td>' + jQuery('#employment_endDate_edit').val() + '</td>';
                emp_res += '<td>' + jQuery('#employment_position_edit').val() + '</td>';
                emp_res += '<td id="ct">' + jQuery('#sort_emp tr#' + emp_id).find('td#ct').html() + '</td>';

                //emp_res += '<td id="ct">' + jQuery('#sort_emp tr#' + emp_id).find('td#ct').html() + '</td>';


                //emp_res += '' + jQuery('#sort_emp tr#' + emp_id).find('span#ct2').html() + '</td>';

                jQuery('#editDialogs').dialog('close');
                jQuery('#sort_emp ').find('tr#' + emp_id).html(emp_res);
                jQuery('#sort_emp ').find('tr#' + emp_id).effect('highlight', 1000);

                emp_res = '';
            }
            else {

                jQuery('#emp_edit_errors').html(" ");
                jQuery(xml).find('result').find('error').each(function(i, ele) {
                    //alert(i+ '  ' +$(this).text());
                    jQuery('#emp_edit_errors').append($(this).text());
                    jQuery('#emp_edit_errors').append('<br/>');

                });


            }
        }

    });

}

function updateEdu(action) {
    jQuery.ajax({
        url:action,
        type:'POST',
        dataType:'XML',
        data:{
            'res':jQuery('#res_id_hidden').val(),
            'eid':jQuery('#edu_edit_id_hidden').val(),
            'education.startDate':jQuery('#education_startDate_edit').val(),
            'education.endDate':jQuery('#education_endDate_edit').val(),
            'education.institution':jQuery('#education_institution_edit').val(),
            'education.institutionAddress':jQuery('#education_institutionAddress_edit').val(),
            'education.qualificationName':jQuery('#education_qualificationName_edit').val(),
            'education.qualificationType':jQuery('#education_qualificationType_edit').val(),
            'education.qualificationDescription':jQuery('#education_qualificationDescription_edit').val()


        },
        success:function(xml) {

            if (jQuery(xml).find('result').find('flag').text() == 'ok') {
                //alert("edu"+jQuery('#sort_edu tr#' + edu_id).find('td#ct').html());
                /*
                 * var emp_id = jQuery('#edit_id_hidden').val();
                 var emp_res = '<td>' + jQuery('#employment_startDate_edit').val() + '</td>';
                 emp_res += '<td>' + jQuery('#employment_endDate_edit').val() + '</td>';
                 emp_res += '<td>' + jQuery('#employment_position_edit').val() + '</td>';
                 emp_res += '<td id="ct">' + jQuery('#sort_ach').find('tr#' + emp_id).find('td#ct').html() + '</td>';
                 //emp_res += '<td id="ct">' + jQuery('#sort_emp tr#' + emp_id).find('td#ct').html() + '</td>';



                 //emp_res += '' + jQuery('#sort_emp tr#' + emp_id).find('span#ct2').html() + '</td>';

                 jQuery('#editDialogs').dialog('close');
                 jQuery('#sort_emp ').find('tr#' + emp_id).html(emp_res);
                 jQuery('#sort_emp ').find('tr#' + emp_id).effect('highlight', 1000);

                 emp_res = '';*/

                var edu_id = jQuery('#edu_edit_id_hidden').val();
                var edu_res = '<td>' + jQuery('#education_startDate_edit').val() + '</td>';
                edu_res += '<td>' + jQuery('#education_endDate_edit').val() + '</td>';
                edu_res += '<td>' + jQuery('#education_qualificationName_edit').val() + '</td>';
                edu_res += '<td id="ct">' + jQuery('#sort_edu tr#' + edu_id).find('td#ct').html() + '</td>';
                //edu_res += '' + jQuery('#sort_edu tr#' + edu_id).find('td#ct2').html() + '</td>';

                jQuery('#editDialogs').dialog('close');
                jQuery('#sort_edu ').find('tr#' + edu_id).html(edu_res);
                jQuery('#sort_edu ').find('tr#' + edu_id).effect('highlight', 1000);

                edu_res = '';
            }
            else {

                jQuery('#edu_edit_errors').html(" ");
                jQuery(xml).find('result').find('error').each(function(i, ele) {
                    //alert(i+ '  ' +$(this).text());
                    jQuery('#edu_edit_errors').append($(this).text());
                    jQuery('#edu_edit_errors').append('<br/>');

                });


            }
        }

    });

}


function updateAch(action) {
    jQuery.ajax({
        url:action,
        type:'POST',
        dataType:'XML',
        data:{
            'res':jQuery('#res_id_hidden').val(),
            'eid':jQuery('#ach_edit_id_hidden').val(),
            'achievement.achDate':jQuery('#achievement_achDate_edit').val(),
            'achievement.title':jQuery('#achievement_title_edit').val(),
            'achievement.description':jQuery('#achievement_description_edit').val()
        },
        success:function(xml) {

            if (jQuery(xml).find('result').find('flag').text() == 'ok') {
                var ach_id = jQuery('#ach_edit_id_hidden').val();

                var ach_res = '<td>' + jQuery('#achievement_achDate_edit').val() + '</td>';
                ach_res += '<td>' + jQuery('#achievement_title_edit').val() + '</td>';
                ach_res += '<td id="ct">' + jQuery('#sort_ach').find('tr#' + ach_id).find('td#ct').html() + '</td>';

                jQuery('#editDialogs').dialog('close');
                jQuery('#sort_ach').find('tr#' + ach_id).html(ach_res);
                jQuery('#sort_ach ').find('tr#' + ach_id).effect('highlight', 1000);

                ach_res = '';
            }
            else {
                jQuery('#achInfo').html(" ");
                jQuery(xml).find('result').find('error').each(function(i, ele) {
                    //alert(i+ '  ' +$(this).text());
                    jQuery('#achInfo').append($(this).text());
                    jQuery('#achInfo').append('<br/>');

                });

            }
        }

    });

}


function deleteEmployment(action, eid, rid) {
    jQuery.ajax({

        url:action,
        data:{emp:eid,res:rid},
        type: 'POST',
        dataType:'XML',
        async:true,
        success:function(xml) {
            if (jQuery(xml).find('result').find('flag').text() == 'ok') {
                jQuery('#sort_emp tbody tr#' + eid).fadeOut('slow', function() {
                    jQuery('#sort_emp tbody tr#' + eid).remove();

                    setSortingCss('sort_emp');

                });

            }
            else {
                // alert('An Error Occured');
            }


        },
        complete:function() {

        }



    });

    return false;

}


function deleteAchievement(action, eid, rid) {
    jQuery.ajax({

        url:action,
        data:{ach:eid,res:rid},
        type: 'POST',
        dataType:'XML',
        success:function(xml) {
            if (jQuery(xml).find('result').find('flag').text() == 'ok') {
                jQuery('#sort_ach tbody tr#' + eid).fadeOut('slow', function() {
                    jQuery('#sort_ach tbody tr#' + eid).remove();
                    setSortingCss('sort_ach');
                });
            }
            else {
                // alert('An Error Occured');
            }

        }



    });

    return false;

}

function deleteEducation(action, eid, rid) {
    jQuery.ajax({

        url:action,
        data:{edu:eid,res:rid},
        type: 'POST',
        dataType:'XML',
        success:function(xml) {
            if (jQuery(xml).find('result').find('flag').text() == 'ok') {
                jQuery('#sort_edu tbody tr#' + eid).fadeOut('slow', function() {
                    jQuery('#sort_edu tbody tr#' + eid).remove();
                    setSortingCss('sort_edu');
                });
            }
            else {
                // alert('An Error Occured');
            }

        }
    });

    return false;
}


function submitOrderEmployment(action) {
    var res = jQuery('#res_id_hidden').val();
    var order = jQuery('#sort_emp tbody').sortable('toArray', {'key':'order'});
    var empH = jQuery('#empH').is(':checked');
    if (empH == false)
        empH = 'no'
    else
        empH = 'yes'
//        window.location.href = 'saveEmploymentOrder?res=' + res + '&order=' + order + '&empH=no';
//    else
//        window.location.href = 'saveEmploymentOrder?res=' + res + '&order=' + order + '&empH=yes';

    jQuery.ajax({
        url:action + '?res=' + res + '&order=' + order + '&empH=' + empH,
        type: 'GET',

        success:function(d) {
            if (d == 'ok') {
                jQuery('#sort_emp').effect('highlight', 1000);
            }
            else {
                jQuery('#sort_emp').effect('highlight', 1000);
            }
            openNextTab('rel_id4', 'rel_id5');
        }
    });

    return false;
}

function saveNewEmp(action) {
    jQuery.ajax({
        url:action,
        type:'POST',
        dataType:'XML',
        data:{
            'res':jQuery('#res_id_hidden').val(),
            'employment.startDate':jQuery('#employment_startDate').val(),
            'employment.endDate':jQuery('#employment_endDate').val(),
            'employment.position':jQuery('#employment_position').val(),
            'employment.organization':jQuery('#employment_organization').val(),
            'employment.description':jQuery('#employment_description').val()
        },
        success:function(xml) {
            if (jQuery(xml).find('result').find('flag').text() == 'ok') {
                var txt = '<tr id=' + (jQuery(xml).find('result').find('emp_id').text()) + ' class="' + ((jQuery('#sort_emp tr:last').attr('class') == 'even') ? 'odd' : 'even') + '">';
                txt += '<td>' + jQuery('#employment_startDate').val() + '</td>';
                txt += '<td>' + jQuery('#employment_endDate').val() + '</td>';
                txt += '<td>' + jQuery('#employment_position').val() + '</td>';
                txt += '<td id="ct"><a onclick="return showEmpEditDialog(' + (jQuery('#res_id_hidden').val()) + ',' + (jQuery(xml).find('result').find('emp_id').text()) + ');" href="resumeSectionTabs">Edit&nbsp;</a>&nbsp;|&nbsp;';
                txt += '' +
                    '<a href="#" onclick="return deleteEmployment(' + (jQuery(xml).find('result').find('emp_id').text()) + ',' + (jQuery('#res_id_hidden').val()) + ');return false;">Delete</a></td>';


                jQuery('#emp_dialog').dialog('close');
                jQuery('#sort_emp tbody').append(txt);
                jQuery('#sort_emp tbody tr:last').effect('highlight', 1000);

            }
            else
            if (jQuery(xml).find('result').find('flag').text() == 'fail') {

                jQuery(xml).find('result').find('error').each(function(i, ele) {
                    //alert(i+ '  ' +$(this).text());
                    jQuery('#empInfo').append($(this).text());
                    jQuery('#empInfo').append('<br/>');

                });


            }

        }



    });
}

function submitEducationOrder(action) {
    var res = jQuery('#res_id_hidden').val();
    var order = jQuery('#sort_edu tbody').sortable('toArray', {'key':'order'});
    var eduH = jQuery('#eduH').is(':checked');
    if (eduH == false)
        eduH = 'no'
    else
        eduH = 'yes'
//        window.location.href = 'saveEmploymentOrder?res=' + res + '&order=' + order + '&empH=no';
//    else
//        window.location.href = 'saveEmploymentOrder?res=' + res + '&order=' + order + '&empH=yes';

    jQuery.ajax({
        url:action + '?res=' + res + '&order=' + order + '&eduH=' + eduH,
        type: 'GET',

        success:function(d) {
            if (d == 'ok') {
                jQuery('#sort_edu').effect('highlight', 1000);
            }
            else {
                jQuery('#sort_edu').effect('highlight', 1000);
            }
            openNextTab('rel_id3', 'rel_id4')
        }
    });

    return false;
}


//function submitOrder() {
//    var res = jQuery('#res_id_hidden').val();
//    var order = jQuery('#sort tbody').sortable('toArray', {'key':'order'});
//    var eduH = jQuery('#eduH').is(':checked');
//    if (eduH == false)
//        window.location.href = 'saveEducationOrder?res=' + res + '&order=' + order + '&eduH=no';
//    else
//        window.location.href = 'saveEducationOrder?res=' + res + '&order=' + order + '&eduH=yes';
//
//
//}

function saveNewAch(action) {
    jQuery.ajax({
        url:action,
        type:'POST',
        dataType:'XML',
        data:{
            'res':jQuery('#res_id_hidden').val(),
            'achievement.achDate':jQuery('#achievement_achDate').val(),
            'achievement.title':jQuery('#achievement_title').val(),
            'achievement.description':jQuery('#achievement_description').val()
        },
        success:function(xml) {
            if (jQuery(xml).find('result').find('flag').text() == 'ok') {
                var txt = '<tr id="' + (jQuery(xml).find('result').find('ach_id').text()) + '" class="' + ((jQuery('#sort_ach tr:last').attr('class') == 'even') ? 'odd' : 'even') + '">';
                txt += '<td>' + jQuery('#achievement_achDate').val() + '</td>';
                txt += '<td>' + jQuery('#achievement_title').val() + '</td>';
                txt += '<td id="ct"><a onclick="return showAchEditDialog(' + (jQuery('#res_id_hidden').val()) + ',' + (jQuery(xml).find('result').find('ach_id').text()) + ');" href="resumeSectionTabs">Edit</a>&nbsp;|&nbsp;';
                txt += '' +
                    '<a href="#" onclick="return deleteAchievement(' + (jQuery(xml).find('result').find('ach_id').text()) + ',' + (jQuery('#res_id_hidden').val()) + ');return false;">&nbsp;Delete</a></td>';
                jQuery('#ach_dialog').dialog('close');
                jQuery('#sort_ach tbody').append(txt);
                jQuery('#sort_ach tbody tr:last').effect('highlight', 1000);
            }
            else
            if (jQuery(xml).find('result').find('flag').text() == 'fail') {

                jQuery(xml).find('result').find('error').each(function(i, ele) {
                    //alert(i+ '  ' +$(this).text());
                    jQuery('#achInfo').append($(this).text());
                    jQuery('#achInfo').append('<br/>');

                });


            }
        }
    });

}
function submitOrderAchievement(action) {
    var res = jQuery('#res_id_hidden').val();
    var order = jQuery('#sort_ach tbody').sortable('toArray', {'key':'order'});
    var achH = jQuery('#achH').is(':checked');
    if (achH == false)
        achH = 'no'
    else
        achH = 'yes'
//        window.location.href = 'saveEmploymentOrder?res=' + res + '&order=' + order + '&empH=no';
//    else
//        window.location.href = 'saveEmploymentOrder?res=' + res + '&order=' + order + '&empH=yes';

    jQuery.ajax({
        url:action + '?res=' + res + '&order=' + order + '&achH=' + achH,
        type: 'GET',

        success:function(d) {
            if (d == 'ok') {
                jQuery('#sort_ach').effect('highlight', 1000);
            }
            else {
                jQuery('#sort_ach').effect('highlight', 1000);
            }
            openNextTab('rel_id5', 'rel_id6');
        }
    });

    return false;

}

function cancelEducationTab() {
    jQuery('#edu_dialog').dialog('close');

}
function cancelEditEducationTab() {

    jQuery('#eduEdit_dialog').dialog('close');
}
function cancelEmploymentTab() {


    jQuery('#emp_dialog').dialog('close');

}
function cancelAchievementTab() {


    jQuery('#ach_dialog').dialog('close');

}
function trimFun(t_id) {

    alert(document.getElementById(t_id).value.trim());


}
function copyCurrentToPermanent() {

    //alert('val ' + jQuery('#contact_streetAddress').val());
    jQuery('#p_contact_streetAddress').val(jQuery('#contact_streetAddress').val());
    jQuery('#p_contact_extendedAddress').val(jQuery('#contact_extendedAddress').val());
    jQuery('#p_contact_city').val(jQuery('#contact_city').val());
    jQuery('#p_contact_state').val(jQuery('#contact_state').val());
    jQuery('#p_contact_zipCode').val(jQuery('#contact_zipCode').val());
}
   