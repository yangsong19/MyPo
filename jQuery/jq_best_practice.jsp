<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type='text/javascript' src='../js/jquery-1.10.2.min.js'></script>
	 <style>
		div {
			color: blue,
			margin: 5px,
			background: yellow
		}
		span {
			color: red;
		}
		button {
			margin: 5px,
			font-size: 14px
		}
		p {
			margin: 5px,
			color: blue
		}
	</style>
	<script type='text/javascript'>
		$(document).ready(function() {
			/*
				Using $.data on a DOM element instead of calling $.fn.data on a jQuery selection can be up to 10 times faster. 
				Be sure you understand the difference between a DOM element and a jQuery selection before doing this, though.
				对一个 DOM 元素使用 $.data 而不是在一个 jQuery 选择器上调用 $.fn.data ，这样可以把速度提升十倍！！！
				但有一点，在使用它之前，你必须要确切地知道 DOM element and jQuery selection 之间的差异。
			
				// regular  -- 常规
				var $elem = $('#myList');
				$elem.data(key,value);
				 
				// 10x faster  --  十倍速度
				$.data($elem,key,value);
			*/	
				// example1
				var div = $('div');
				var div1 = div[ 0 ];
				
				console.log(div);
				console.log(div1);
				//console.log(console);
				//console.log(console.dir(div1));
				
				jQuery.data( div1, "test", {
					first: 16,
					last: "pizza!"
				});
				$( "span:first" ).text( jQuery.data( div1, "test" ).first );
				$( "span:eq(1)" ).text( jQuery.data( div1, "test" ).last );
				
				var col = div.get(0).children; // = div1.children
				$.each(col, function(idx, value) {
					console.log(idx + ':' + value);
				});
				
				
				// example 2
							
				$( "button" ).click( function(e, arg) {
					var value,
						div = $( "div" )[ 0 ];
						//console.log(div.innerHTML); 从这个地方再次强化这样一个概念，$('div')[0] 得到的是一个 DOM element
						//console.log($('div')[1].innerHTML); 而且 $('div') 会取得所有的 div 对应的 jQuery object
						
					switch ( $( "button" ).index( this ) ) {
						case 0 :
							value = jQuery.data( div, "blah" );
							break;
						case 1 :
							jQuery.data( div, "blah", "hello" );
							value = "Stored!";
							break;
						case 2 :
							jQuery.data( div, "blah", 86 );
							value = "Stored!";
							break;
						case 3 :
							jQuery.removeData( div, "blah" );
							value = "Removed!";
							break;
						default :
							console.log('default situation');//在这个例子中，此种情况是不会出现的，故可以舍弃
					}
					$( "span:last" ).text( "" + value );					
				});
			
			/*
				Cache length during loops 
				In a for loop, don't access the length property of an array every time; cache it beforehand.
				1	var myLength = myArray.length;
				2	 
				3	for (var i = 0; i < myLength; i++) {
				4	    // do stuff
				5	}
			*/
			
			/*
				Append new content outside of a loop 
				01	// this is bad
				02	$.each(myArray, function(i, item) {
				03	   var newListItem = '<li>' + item + '</li>';
				04	   $('#ballers').append(newListItem);
				05	});
				06	 
				07	// better: do this
				08	var frag = document.createDocumentFragment();
				09	 
				10	$.each(myArray, function(i, item) {
				11	    var newListItem = '<li>' + item + '</li>';
				12	    frag.appendChild(newListItem);
				13	});
				14	$('#ballers')[0].appendChild(frag);
				15	 
				16	// or do this
				17	var myHtml = '';
				18	 
				19	$.each(myArray, function(i, item) {
				20	    html += '<li>' + item + '</li>';
				21	});
				22	$('#ballers').html(myHtml);
			*/
			
			/*				
				Keep things DRY
				Don't repeat yourself; if you're repeating yourself, you're doing it wrong.
				不要写大量重复的代码，你可以去重新思考，重新发挥对象，数组这些基本容量的好处
				
				01	// BAD
				02	if ($eventfade.data('currently') != 'showing') {
				03	    $eventfade.stop();
				04	}
				05	 
				06	if ($eventhover.data('currently') != 'showing') {
				07	    $eventhover.stop();
				08	}
				09	 
				10	if ($spans.data('currently') != 'showing') {
				11	    $spans.stop();
				12	}
				13	 
				14	// GOOD!!
				15	var $elems = [$eventfade, $eventhover, $spans];
				16	$.each($elems, function(i,elem) {
				17	    if (elem.data('currently') != 'showing') {
				18	        elem.stop();
				19	    }
				20	});
			*/
			
			/*				
				Beware anonymous functions
				Anonymous functions bound everywhere are a pain. They're difficult to debug, maintain, test, or reuse. Instead, 
				use an object literal to organize and name your handlers and callbacks.
				这里在讲，匿名函数会带来高度，重用，运维时的不便。我们用一个对象字面量来组织及命名处理器和回调函数
				
				01	// BAD
				02	$(document).ready(function() {
				03	    $('#magic').click(function(e) {
				04	        $('#yayeffects').slideUp(function() {
				05	            // ...
				06	        });
				07	    });
				08	 
				09	    $('#happiness').load(url + ' #unicorns', function() {
				10	        // ...
				11	    });
				12	});
				13	 
				14	// BETTER
				15	var PI = {
				16	    onReady : function() {
				17	        $('#magic').click(PI.candyMtn);
				18	        $('#happiness').load(PI.url + ' #unicorns', PI.unicornCb);
				19	    },
				20	 
				21	    candyMtn : function(e) {
				22	        $('#yayeffects').slideUp(PI.slideCb);
				23	    },
				24	 
				25	    slideCb : function() { ... },
				26	 
				27	    unicornCb : function() { ... }
				28	};
				29	 
				30	$(document).ready(PI.onReady);
			*/
			
			/*
				Optimize Selectors 
				Selector optimization is less important than it used to be, as more browsers implement document.querySelectorAll() 
				and the burden of selection shifts from jQuery to the browser. However, there are still some tips to keep in mind.
				选择器优化相比过去已经变得不那么重要了，是因为大多数浏览器实现了 document.querySelectorAll() ，其负担已经转移给了
				浏览器。但是仍然有一些需要注意的地方。
				
				ID-Based Selectors
				Beginning your selector with an ID is always best.
				1	// fast
				2	$('#container div.robotarm');
				3	 
				4	// super-fast
				5	$('#container').find('div.robotarm');
				
				
				Specificity
				Be specific on the right-hand side of your selector, and less specific on the left.
				1	// unoptimized
				2	$('div.data .gonzalez');
				3	 
				4	// optimized
				5	$('.data td.gonzalez');

				Use tag.class if possible on your right-most selector, and just tag or just .class on the left.

				Avoid excessive specificity.
				1	$('.data table.attendees td.gonzalez');
				2	 
				3	// better: drop the middle if possible
				4	$('.data td.gonzalez');
				
				
				Avoid the Universal Selector
				Selections that specify or imply that a match could be found anywhere can be very slow.
				1	$('.buttons > *');  // extremely expensive
				2	$('.buttons').children();  // much better
				3	 
				4	$('.gender :radio');  // implied universal selection
				5	$('.gender *:radio'); // same thing, explicit now
				6	$('.gender input:radio'); // much better
				
				
				Use Event Delegation 
				Event delegation allows you to bind an event handler to one container element (for example, an unordered list) 
				instead of multiple contained elements (for example, list items). jQuery makes this easy with $.fn.live and 
				$.fn.delegate. Where possible, you should use $.fn.delegate instead of $.fn.live, as it eliminates the need 
				for an unnecessary selection, and its explicit context (vs. $.fn.live's context of document) reduces overhead by approximately 80%.

				In addition to performance benefits, event delegation also allows you to add new contained elements to your page 
				without having to re-bind the event handlers for them as they're added.
				
				1	// bad (if there are lots of list items)
				2	$('li.trigger').click(handlerFn);
				3	 
				4	// better: event delegation with $.fn.live
				5	$('li.trigger').live('click', handlerFn);
				6	 
				7	// best: event delegation with $.fn.delegate
				8	// allows you to specify a context easily
				9	$('#myList').delegate('li.trigger', 'click', handlerFn);
				
				
				Detach Elements to Work With Them
				The DOM is slow; you want to avoid manipulating it as much as possible. jQuery introduced $.fn.detach in version 
				1.4 to help address this issue, allowing you to remove an element from the DOM while you work with it. 
				
				1	var $table = $('#myTable');
				2	var $parent = $table.parent();
				3	 
				4	$table.detach();
				5	// ... add lots and lots of rows to table
				6	$parent.append(table);
				
				
				Use Stylesheets for Changing CSS on Many Elements
				If you're changing the CSS of more than 20 elements using $.fn.css, consider adding a style tag to the page instead for a nearly 60% increase in speed.
				1	// fine for up to 20 elements, slow after that
				2	$('a.swedberg').css('color', '#asd123');
				3	$('<style type="text/css">a.swedberg { color : #asd123 }</style>')
				4	    .appendTo('head');
				
				
				
				Don't Act on Absent Elements
				jQuery won't tell you if you're trying to run a whole lot of code on an empty selection — it will proceed as though nothing's wrong. 
				It's up to you to verify that your selection contains some elements.
				jQuery不会告诉你，你是否需要尝试运行一个空选择器内的所有代码，它会去处理(即使为空，其实没有必要的，因为jQuery不知道，这个事要由我们来判断)
				01	// BAD: this runs three functions
				02	// before it realizes there's nothing
				03	// in the selection
				04	$('#nosuchthing').slideUp();
				05	 
				06	// Better
				07	var $mySelection = $('#nosuchthing');
				08	if ($mySelection.length) { $mySelection.slideUp(); }
				09	 
				10	// BEST: add a doOnce plugin
				11	jQuery.fn.doOnce = function(func){
				12	    this.length && func.apply(this);
				13	    return this;
				14	}
				15	 
				16	$('li.cartitems').doOnce(function(){
				17	    // make it ajax! \o/
				18	});
				This guidance is especially applicable for jQuery UI widgets, which have a lot of overhead even when the selection doesn't contain elements. 
				这个指导在 jQuery UI 小工具开发时具有很强的适用性，因为当一个选择器不包含元素时，会导致很多开销。
				
				
				Variable Definition
				Variables can be defined in one statement instead of several.
				变量可以在一行语句中被同时定义，而不是分别定义在几行中。
				1	// old & busted
				2	var test = 1;
				3	var test2 = function() { ... };
				4	var test3 = test2(test);
				5	 
				6	// new hotness
				7	var test = 1,
				8	    test2 = function() { ... },
				9	    test3 = test2(test);
				In self-executing functions, variable definition can be skipped all together. 
				在自执行的函数中，变量的定义可以被一起跳过	(function(foo, bar) { ... })(1, 2);
				
				
				Conditionals
				1	// old way
				2	if (type == 'foo' || type == 'bar') { ... }
				3	 
				4	// better
				5	if (/^(foo|bar)$/.test(type)) { ... }
				6	 
				7	// object literal lookup
				8	if (({ foo : 1, bar : 1 })[type]) { ... }
				这种做法太狠了点儿吧。。。
			*/
				// var str00 = new String('string bound');
				// console.log(str00.length + ':' + str00.toUpperCase());
			
		})			
	</script>
		<div>
			The values stored were
			<span></span>
			and
			<span></span>
		</div>
		
		<div>A div</div>
		<button>Get "blah" from the div</button>
		<button>Set "blah" to "hello"</button>
		<button>Set "blah" to 86</button>
		<button>Remove "blah" from the div</button>
		<p>The "blah" value of this div is <span>?</span></p>
		
		<input value='test for jq' />
</html>