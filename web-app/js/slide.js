// JavaScript Document
$(document).ready(function(){

//    $('.accordian').accordion({ collapsible: false});

//Set default open/close settings
$('.acc_container').hide(); //Hide/close all containers
//$('.acc_trigger:first').addClass('active').next().show(); //Add "active" class to first trigger, then show/open the immediate next container
//$('.acc_trigger .move-up').addClass("disable")
//$('.acc_trigger:first .move-down').addClass("disable")
//$('.acc_trigger:first .move-up').removeClass("disable")
//$('.acc_trigger:first').next().next().addClass('bottom_text');

//On Click
$('.accordion .acc_trigger').click(function(){
	jQuery('#contact_message1').html(" ");
	
		$('.acc_bottom').removeClass('bottom_text');
		//$('.acc_trigger').removeClass('active').next().slideUp(); //Remove all .acc_trigger classes and slide up the immediate next container
		$(this).toggleClass('active').next().slideToggle(); //Add .acc_trigger class to clicked trigger and slide down the immediate next container
		$(this).next().addClass('bottom_text');		
		$(this).addClass("disable");
	
	return false; //Prevent the browser jump to the link anchor
});

/*$('.save_btn').click(function(){
	$(this).parents().next().next().addClass('active').next().slideToggle();	
	
});*/

$('.findcand_role ul li a').click(function(){
	
	var rel_h1=".accordion #"+$(this).attr('rel');
	$( rel_h1).addClass("active ").next().slideDown().position("top");
	$('html,body').animate({
		scrollTop: $(rel_h1).offset().top
		}, 800);
	

	
});



});

function openNextTab(d1,d2){
	
	var rel_h1='#'+d1;
	var rel_h2='#'+d2;		
	$( rel_h1).addClass("active ").next().slideUp().position("top");
		$( rel_h2).addClass("active ").next().slideDown().position("top");
		
	
}
function closeAllTab(){
	$('#rel_id1').removeClass("active ").next().slideUp().position("top");
	$('#rel_id2').removeClass("active ").next().slideUp().position("top");
	$('#rel_id3').removeClass("active ").next().slideUp().position("top");
	$('#rel_id4').removeClass("active ").next().slideUp().position("top");
	$('#rel_id5').removeClass("active ").next().slideUp().position("top");
	$('#rel_id6').removeClass("active ").next().slideUp().position("top");
	$('#rel_id7').removeClass("active ").next().slideUp().position("top");
	$('#rel_id8').removeClass("active ").next().slideUp().position("top");
	window.location.href='#';
	
}
