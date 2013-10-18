<html>
	<head>
		<title>Event Delegation</title>
		<script type="text/javascript" src="./jquery-1.10.2.min.js"></script>
		<script type="text/javascript">
			$(function(){
				/*								
					This means that anytime you click one of our bound anchor tags, you are effectively clicking 
					the entire document body! This is called 【event bubbling】 or 【event propagation】. 
					
					关键词：事件冒泡或事件传播，事件传递
				*/
				$('#list a').on('click', function( event ) {
					event.preventDefault();
					alert($(this).text());
				});
				
				/*
					If we were to click our newly added item, nothing would happen. This is because of the 【【directly
					bound event handler】】 that we attached previously. Direct events are only attached to elements at
					the time the .on() method is called. In this case, since our new anchor did not exist when .on() 
					was called, it does not get the event handler. 	

					关键词：直接绑定的事件处理器
				*/
				$('#add').on('click', function( event ) {
					$('#list').append("<li><a href='http://www.baidu.com'>Item #5</a></li>");
				});
				
				/*Since we know how events bubble, we can create a delegated event;  attach a 【【delegated event】】 .*/
				$( "#list" ).on( "click", "a", function( event ) {
					event.preventDefault();
					alert($(this).text());
				});
				
				/* 					
					Event delegation refers to the process of using event propagation (bubbling) to handle events at a higher 
					level in the DOM than the element on which the event originated. It allows us to attach a single event 
					listener for elements that exist now or in the future. 
					
					attach a delegated event with a more refined selector.
					
					关键词：事件代理
				*/
				$('#list').on('click', 'a', function( event ) {
					event.preventDefault();
					var $ele = $(this);
					if($ele.is("[href^='http']")) {
						//alert('http');
						$ele.attr('target', '_blank');
					}
				});
				
				// attach a delegated event with a more refined selector
				$( "#list" ).on( "click", "a[href^='http']", function( event ) {
					$( this ).attr( "target", "_blank" );
				});
			});
		</script>
	</head>
	<body>
		<div id="container">
			<ul id="list">
				<li><a href="#">Item #1</a></li>
				<li><a href="#">Item #2</a></li>
				<li><a href="#">Item #3</a></li>
				<li><a href="#">Item #4</a></li>
			</ul>
		</div>
		<div id="add">
			<input type="button" name="add" value="add" id="add" />
		</div>
	</body>
</html>