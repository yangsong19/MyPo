<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type='text/javascript' src='../js/jquery-1.10.2.min.js'></script>
	<!--script type='text/javascript' src='./prototype.js'></script-->
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
		
		//只有一个js库时，这样写是可以的
		$(document).ready(function() {
			
			// Modernizr is a JavaScript library that detects HTML5 and CSS3 features in the user’s browser. -- http://modernizr.com/
			// prototype.js --  http://prototypejs.org/
			
			console.log($.support); // Object { getSetAttribute=true, leadingWhitespace=true, tbody=true, 更多...}
			console.log($.browser); // undefined
			
			console.log('-----------event------------');
			//Create a new jQuery.Event object without the "new" operator.
			var e = jQuery.Event( "click" );
			// trigger an artificial click event
			jQuery( "body" ).trigger( e );
		
			// Create a new jQuery.Event object with specified event properties.
			var es = jQuery.Event( "keydown", { keyCode: 65 } );
			// trigger an artificial keydown event with keyCode 64
			jQuery( "body" ).trigger( es );		

			$( "#foo" ).on( "click", function(event) {
				var evt =  event || window.event;	
				
				console.log( 'window: ' + window );
				console.log( '$(this).val() : ' +  $(this).val() );
				console.log( 'evt.currentTarget : ' + evt.currentTarget);
				console.log( 'evt.data : ' + evt.data);
				console.log( 'evt.target : ' + evt.target);
				console.log( 'evt.delegateTarget : ' + event.delegateTarget);
				console.log( 'evt.isDefaultPrevented() : ' + event.isDefaultPrevented());
				console.log( 'evt.pageX : ' + event.pageX);
				console.log( 'evt.timeStamp : ' + evt.timeStamp);
				console.log( 'evt.type : ' + evt.type);
				console.log( 'evt.which : ' + evt.which);
				
				//evt.stopPropagation();
				//return false;
			});
			// $( "#foo" ).trigger( "click" );
			
			// trigger example
			console.log('-----------$.fn.trigger------------');
			$( "button:first" ).click(function() {
				update( $( "span:first" ) );
			});
			$( "button:eq(1)" ).click(function() {
				$( "button:first" ).trigger( "click" );
				update( $( "span:last" ) );
			});
			function update( j ) {
				var n = parseInt( j.text(), 10 );
				j.text( n + 1 );
			}

			/*
				jQuery offers convenience methods for most common events, and these are the methods you will see used most often. 
				These methods — including $.fn.click, $.fn.focus, $.fn.blur, $.fn.change, etc. — are shorthand for jQuery's $.fn.bind 
				method. The bind method is useful for binding the same handler function to multiple events, when you want to provide 
				data to the event hander, when you are working with custom events, or when you want to pass an object of multiple events and handlers. 
				
				jQuery 为大多数常见事件提供便捷方法。包括 $.fn.click, $.fn.focus, $.fn.blur, $.fn.change,etc。 $.fn.bind 通常更有用好使，它允许
				你把多个事件绑定到同一个事件处理器，同时为其提供数据，或者你在处理自定义事件，或者你想传递有一个具有多个事件和处理器的对象时。
			*/
			console.log('----------$.fn.bind------------');
			console.log('-------Connecting Events to Elements-------');
			$('input').focus(function() {
				console.log('oh,i am in');
			});					 // only can bind one event
			console.log($('input').bind(
				'click change' , // bind to multiple events
				{ foo : 'data1', zoo : 'data2' } , // pass in data
				function(eventObj) {
					console.log('event.type : ' + eventObj.type + '  |  event.data : ' + (eventObj.data)); // event.type : click  |  event.data : [object Object]
					console.log( eventObj.data );  // Object { foo="data1", zoo="data2"}
				}));  // 可见 $.fn.bind 函数在执行完成之后会返回那个选择器选择的对象，即那个被绑定的对象
			
			/*
				Quite often elements in your application will be bound to multiple events, each having a different function for handing the event. In these cases 
				you can pass an object into $.fn.bind with one or more key/value pairs, with the key being the event name and the value being the function to 
				handle the event.
				你可以传给 $.fn.bind 函数一个对象，包含各自的处理函数
			*/			
			$('input').bind({ 
				'focusin' : function() { console.log('cursor focusin'); },
				'blur' : function() { console.log('cursor blur'); },
				'keydown' : function(event) { console.log('event.which(keycode)' + event.which) }// 打印出键盘上对应的 ASCII 码，比如 a 65
			});	
			
			
			/*
				Disconnecting Events 
			*/	
			console.log('-------$.fn.unbind--------');	
			var fooFunc = function() { console.log('foo func is executing!'); };
			var barFunc = function() { console.log('bar func is executing!'); };
			 
			$('p:last').bind('click', fooFunc).bind('click', barFunc);
			$('p:last').unbind('click', barFunc); // foo is still bound to the click event

			
			/*
				Sometimes you need a particular handler to run only once — after that, you may want no handler to run, or you may want a different handler to run. 
				jQuery provides the $.fn.one method for this purpose. 
				有时你需要某个特别的处理器仅跑一次，之后，你可能不想再让处理器跑了，或者你想其它的处理器来运行。 JQuery 提供了 $.fn.one 来达到你的目的。
				
				The $.fn.one method is especially useful if you need to do some complicated setup the first time an element is clicked, but not subsequent times.
				如果第一次点击某个元素时你想处理一些复杂步骤，但是第二次点击时不想再执行那些步骤， $.fn.one 将会特别有用。
			*/
			console.log('------Connecting Events to Run Only Once-----');
			$('p:first').one('click', function(event) {
				console.log(event.currentTarget + '|' + event.which + '|' + event.type); // [object HTMLParagraphElement]|1|click
			    console.log('You just clicked this for the first time!');
				
			    $(this).click(function() { 
					console.log(event.currentTarget + '|' + event.which + '|' + event.type);	// [object HTMLParagraphElement]|1|click	
					console.log('You have clicked this before!');  // 当点击 <p/> 超过再次时，只会执行 $(this).click(function() {}  这里面的代码，其外不会执行
				});
			});
			
			/*
				Inside the Event Handling Function 
				事件内部的一些自带处理函数及属性				

				pageX, pageY
					The mouse position at the time the event occurred, relative to the top left of the page.
				type
					The type of the event (e.g. "click").
				which
					The button or key that was pressed.
				data
					Any data that was passed in when the event was bound.
				target
					The DOM element that initiated the event.
				preventDefault()
					Prevent the default action of the event (e.g. following a link).
				stopPropagation()
					Stop the event from bubbling up to other elements.
					
				In addition to the event object, the event handling function also has access to the DOM element that the handler was bound to via 
				the keyword this. To turn the DOM element into a jQuery object that we can use jQuery methods on, we simply do $(this), often following this idiom: 
				除了事件对象本身外，事件处理函数也会访问通过关键字 this 绑定的 DOM element 。为了把 DOM element 转化成一个 jQuery 对象，从而让我们可以用 jQuery 相关方法。
				通常可如下做：
				1	$('a').click(function(e) {	   *********************************************************************************	
				2	    【var $this = $(this);】   ******这个操作很重要，就是把一个 DOM element 转化成了一个 jQuery 对象！！！******
				3	    if ($this.attr('href').match('evil')) { ********************************************************************
				4	        e.preventDefault();
				5	        $this.addClass('evil');
				6	    }
				7	});
			*/
			/*********************************************do matter*************************************
			
				jQuery provides a way to trigger the event handlers bound to an element without any user interaction via the $.fn.trigger method. While this method 
				has its uses, it should not be used simply to call a function that was bound as a click handler. Instead, you should store the function you want to 
				call in a variable, and pass the variable name when you do your binding. Then, you can call the function itself whenever you want, without the need for $.fn.trigger. 
				
				jQuery 提供了一种途径来触发事件处理器，而不需要和用户有任何交互，那就是 $.fn.trigger 方法。这个方法自有其用处，它不应该那样简单地去绑定一个点击事件
				来调用一个函数这么用。与之相反，你应该把一个函数存入一个变量，然后在你需要绑定的地方传入这个方法即可。且你还可以在你想调用的地方去执行它即可，而不必 $.fn.trigger.
				案之：说白了，不就是把函数从 trigger 内部打包出来，给用一个变量存进引用里了吗，这样搞显得更易读，易用，灵活了。
				
				01	var foo = function(e) {
				02	    if (e) {
				03	        console.log(e);
				04	    } else {
				05	        console.log('this didn\'t come from an event!');
				06	    }
				07	};
				08	 
				09	 
				10	$('p').click(foo);
				11	 
				12	foo(); // instead of $('p').trigger('click')
				
			********************************************make sense**************************************/
			
			/*********************************************do matter*************************************
			
				Increasing Performance with Event Delegation
				You'll frequently use jQuery to add new elements to the page, and when you do, you may need to bind events to those new elements — events you already bound 
				to similar elements that were on the page originally. Instead of repeating your event binding every time you add elements to the page, you can use event delegation. 
				With event delegation, you bind your event to a container element, and then when the event occurs, you look to see which contained element it occurred on. 
				If this sounds complicated, luckily jQuery makes it easy with its $.fn.live and $.fn.delegate methods.

				While most people discover event delegation while dealing with elements added to the page later, it has some performance benefits even if you never add more
				elements to the page. The time required to bind event handlers to hundreds of individual elements is non-trivial; if you have a large set of elements, 
				you should consider delegating related events to a container element. 
				通过事件代理提高性能
				你将会频繁地往页面中添加新的元素，可能需要为它们绑定相关事件 -- 而这些事件呢可能和你之前绑定的类似。取代那种每往页面添加一个新元素就绑定一次事件的重复
				性做法，你可以用事件代理。通过事件代理，你把你的事件绑定到一个容器元素，而后，当同一事件再次出现，你去检视谁个包含了这些元素，它曾经出现过的。如果这个
				听起来挺复杂的，那么你的好运来了，因为 jQuery 提供的 $.fn.live and $.fn.delegate 方法让其不再复杂。
				大多数人觉悟到事件代理，是在后期往页面中添加新元素时才有的。这个嘛，有性能上的好处，即使你从来都没有添加更多元素到页面上来。当你把事件处理器绑定到成百上
				千个单独元素身上时，你就不能再说这是个无关要紧的小事了呢。如果你有个很大的元素集，你应该考虑将相关的事件代理到某个容器元素！！！
								
				Note
				The $.fn.live method was introduced in jQuery 1.3, and at that time only certain event types were supported. As of jQuery 1.4.2, the $.fn.delegate method
				is available, and is the preferred method.				
				

				Event delegation using $.fn.delegate
				view sourceprint?
				1	$('#myUnorderedList').delegate('li', 'click', function(e) {
				2	    var $myListItem = $(this);
				3	    // ...
				4	});

				Event delegation using $.fn.live
				1	$('#myUnorderedList li').live('click', function(e) {
				2	    var $myListItem = $(this);
				3	    // ...
				4	});
				
				
				Unbinding Delegated Events
				If you need to remove delegated events, you can't simply unbind them. Instead, use $.fn.undelegate for events connected with $.fn.delegate, and $.fn.die 
				for events connected with $.fn.live. As with bind, you can optionally pass in the name of the bound function.

				Unbinding delegated events
				1	$('#myUnorderedList').undelegate('li', 'click');
				2	$('#myUnorderedList li').die('click');
				
			********************************************make sense**************************************/
			
			/*
				Event Helpers 
				
				jQuery offers two event-related helper functions that save you a few keystrokes.
				下面这两个函数助手节省了你的代码，因为他们内部同时具有多个函数的功能。
				
				$.fn.hover
				The $.fn.hover method lets you pass one or two functions to be run when the mouseenter and mouseleave events occur on an element. 
				If you pass one function, it will be run for both events; if you pass two functions, the first will run for mouseenter, and the 
				second will run for mouseleave. 
				
				1	$('#menu li').hover(function() {
				2	    $(this).toggleClass('hover');
				3	});
				
				
				$.fn.toggle
				The $.fn.toggle method is triggered by the "click" event and accepts two or more functions. Each time the click event occurs, the next 
				function in the list is called. Generally, $.fn.toggle is used with just two functions; however, it will accept an unlimited number of 
				functions. Be careful, though: providing a long list of functions can be difficult to debug).

				The toggle helper function				
				1	$('p.expander').toggle(
				2	    function() {
				3	        $(this).prev().addClass('open');
				4	    },
				5	    function() {
				6	        $(this).prev().removeClass('open');
				7	    }
				8	);
			*/
			
			
			//add the dataTransfer property for use with the native `drop` event to capture information about files dropped into the browser window
			//添加 dataTransfer 属性来捕获把文件拖入浏览器的事件
			 			
			jQuery.event.props.push( "dataTransfer" );
								
		})
			
		/*	
			You can continue to use the standard $ by wrapping your code in a self-executing anonymous function; this is a standard pattern 
			for plugin authoring, where the author cannot know whether another library will have taken over the $. 
			将你的代码放入一个匿名自动执行的函数中，标准的 $ 就可以继续使用了。这是插件写法的标准样式，插件写作者不知道另一个库是否被接管。
		
		
		jQuery.noConflict();
		(function($){
			console.log(navigator.userAgent); // Mozilla/5.0 (Windows NT 5.1; rv:24.0) Gecko/20100101 Firefox/24.0
			console.log($.support); // Object { getSetAttribute=true, leadingWhitespace=true, tbody=true, 更多...}
			console.log($.browser); // undefined
			console.log(Prototype.Version); // 1.7.1
			console.log(Prototype.Browser.Gecko); // true
			console.log('----------browser support--------------');									
		})(jQuery);
		*/			
	</script>
	<body>
		<button>Button #1</button>
		<button>Button #2</button>
		<div><span>0</span> button #1 clicks.</div>
		<div><span>0</span> button #2 clicks.</div>
		
		<button id='foo'>maybe,yes</button>
		<input value='$.fn.bind' />
		
		<p>test for $.fn.one</p>
		<p>test for $.fn.unbind</p>
	</body>
</html>