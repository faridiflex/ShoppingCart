    jQuery(document).ready(function() {
		//create Bubble Popups for each "button" element with a loading image...
		jQuery('#intro_help,#contact_help,#edu_help,#emp_help,#ach_help,#skill_help,#goal_help,#interest_help').CreateBubblePopup({
										position: 'top',
										align: 'center',
										innerHtml: '<img src='+contextpath+'/images/loading.gif" style="border:0px; vertical-align:middle; margin-right:10px; display:inline;" />loading!',
										innerHtmlStyle: { color:'#FFFFFF', 'text-align':'center' },
								 		themeName: 'orange',
										themePath:contextpath+'/images/jquerybubblepopup-theme',
										mouseOver:'hide'

								  	  });

		// add a mouseover event for the "button" element...
		jQuery('#intro_help,#contact_help,#edu_help,#emp_help,#ach_help,#skill_help,#goal_help,#interest_help').click(function(){
			var button = jQuery(this);
            button.ShowBubblePopup();
				jQuery.get('getHelpMessage?sec='+jQuery(this).attr('id'), function(data) {
					var seconds_to_wait = 2;
					function pause(){
						var timer = setTimeout(function(){
							seconds_to_wait--;
							if(seconds_to_wait > 0){
								pause();
							}else{
								//set new innerHtml for the Bubble Popup
								button.SetBubblePopupInnerHtml('<span style="color:black">'+data+'</span>', false); //false -> it shows new innerHtml but doesn't save it, then the script is forced to load everytime the innerHtml...
								// take a look in documentation for SetBubblePopupInnerHtml() method

							};
						},1000);
					};pause();
					//////////////////////////////////////////////////////////

				});
            return false;
		}); //end mouseover event

    });
