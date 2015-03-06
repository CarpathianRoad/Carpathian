var frame;
(function($) {

	$.fn.spasticNav = function(options) {
	
		options = $.extend({
			overlap : 20,
			speed : 500,
			reset : 99999999999
		}, options);
	
		return this.each(function() {
		
		 	var nav = $(this),
		 		currentPageItem = $('#allMenu', nav),
		 		blob,
		 		reset;
		 		
		 	$('<div id="blob"></div>').css({
		 		width : currentPageItem.outerWidth(),
		 		height : 45,
		 		left : currentPageItem.position().left
		 	}).appendTo(this);
		 	blob = $('#blob', nav);
                        frame = blob;
		 	
			$('li:not(#blob)').hover(function() {
				// mouse over
                                //console.log($(this));
				clearTimeout(reset);
				blob.animate(
					{
						left : $(this).position().left,
						width : $(this).width()
					},
					{
						duration : options.speed,
						easing : options.easing,
						queue : false
					}
				);
			}, function() {
			});
		
		}); // end each
	
	};

})(jQuery);
