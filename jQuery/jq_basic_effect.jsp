<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type='text/javascript' src='../js/jquery-1.10.2.min.js'></script>
	 <style type='text/css' rel='stylesheet' >
		button {
			margin: 10px;
		}
		div {
			color: blue;
			font-weight: bold;
		}
		span {
			color: red;
		}
	</style>
	<script type='text/javascript'>

		$(document).ready(function() {
			// For complete details on jQuery effects, visit http://api.jquery.com/category/effects/. 
			//$('div:first').show(1000);
			$('div:first').fadeIn(1000);
			$('div:first').fadeOut(1000);
			$('div:first').fadeIn('slow');
			
			/*				
				jQuery.fx.speeds
				jQuery has an object at jQuery.fx.speeds that contains the default speed, as well as settings for "slow" and "fast".
				1	speeds: {
				2	    slow: 600,
				3	    fast: 200,
				4	    // Default speed
				5	    _default: 400
				6	}
			*/
			jQuery.fx.speeds.blazing = 100; // not jQuery.[fn].speeds
			jQuery.fx.speeds.turtle = 2000;
			$('div:eq(1)').fadeIn('blazing');					
			$('div:eq(1)').fadeOut('turtle');
			$('div:eq(1)').fadeIn('blazing');	
			
			/*
				Note that if your selection doesn't return any elements, your callback will never run! You can solve this problem by 
				testing whether your selection returned any elements; if not, you can just run the callback immediately. 
			 
				$('div.old').fadeOut('turtle', function(){
					$(this).remove();
				});
			*/
			var $target = $('div.old');	// 这个地方很重要，要特别小心。$target 就是 $done 函数内部 this 指向的 DOM element,而非 jQuery object!!!!!
			var $done = function() {
				var $this = $(this);
				console.log(this);		// <div class="old" style="display: none;">  -- this -- DOM element  
				console.log($this);		// Object[div.old] -- $(this) -- jQuery object
				console.log(this.innerHTML);	// <span>3</span> button #3 clicks. --- 足以证明这是个 DOM element 了吧 :)
				console.log($this.html());	// <span>3</span> button #3 clicks.	--- 和上面相比返回同样的结果，但是所有的方法却是各自独有的！！！
				
				console.log(this === $target);  // fasle
				console.log('this.length:' + $target.length + ' | $this.size:' + $this.size());
				console.log(dir($target));
				console.log('done');
			}
			
			if($target.length) {
				$target.fadeOut('turtle', $done);
			} else {
				$done();
			}
			
		})			
					
	</script>
	<body>
		<div style='display:none'><span>0</span> button #0 clicks.</div>
		<div style='display:none'><span>1</span> button #1 clicks.</div>
		<div class='old'><span>3</span> button #3 clicks.</div>
		<div class='old'><span>4</span> button #4 clicks.</div>
	</body>
</html>