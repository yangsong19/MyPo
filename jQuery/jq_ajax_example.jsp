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
			/*
				The XMLHttpRequest method (XHR) allows browsers to communicate with the server without requiring a page reload. 
				This method, also known as Ajax (Asynchronous JavaScript and XML), allows for web pages that provide rich, 
				interactive experiences. 
				XHR 允许浏览器和服务器之间交互而不用加载页面，也就是众所周知的 Ajax (Asynchronous Javascript and XML), 允许网页提供
				丰富的，交互式体验。
				
				Ajax requests are triggered by JavaScript code; your code sends a request to a URL, and when it receives a response,
				a callback function can be triggered to handle the response. Because the request is asynchronous, the rest of your 
				code continues to execute while the request is being processed, so it’s imperative that a callback be used to handle the response.
				Ajax 请求会被 JavaScript 代码触发;你的代码把一个【请求】发送给某个 URL, 当你的代码收到这个响应，会触发一个回调函数来处理这个响应。
				因为你的请求是异步的，所以当这个【请求】正在被处理时，你的其它代码可以继续执行而不用等待，故而用来处理这个响应的回调函数是必须的！

				jQuery provides Ajax support that abstracts away painful browser differences. It offers both a full-featured $.ajax() method, 
				and simple convenience methods such as $.get(), $.getScript(), $.getJSON(), $.post(), and $().load().
				jQuery 提供 Ajax 支持，抽象出浏览器之间的差异。它即提供全特性的 $.ajax() 方法，也提供便捷的 $.get(), $.getScript(), $.getJSON(), $.post(), $.load().

				Most jQuery applications don’t in fact use XML, despite the name “Ajax”; instead, they transport data as plain HTML or 
				JSON (JavaScript Object Notation).
				大多数 jQuery 应用程序事实上不用 XML,尽管名字依旧呼作 “Ajax”; 取而代之的是用一种纯 HTML or JSON(JavaScript Object Notation) 来传输数据。

				In general, Ajax does not work across domains. Exceptions are services that provide JSONP (JSON with Padding) support, 
				which allow limited cross-domain functionality. 
				通常情况下，Ajax 不会【跨域】工作。也有例外，提供了 JSONP(JSON with Padding) 支持的服务，会允许受限的跨域功能。
				
				【Key Concepts】
				Proper use of Ajax-related jQuery methods requires understanding some key concepts first. 
				对 Ajax-related jQuery 方法的恰当使得，需要你先理解一些核心概念。
				
				【GET vs. Post】
				The two most common “methods” for sending a request to a server are GET and POST. It’s important to understand the proper application of each.
				发送一个请求到服务器最常用的有两个方法 GET and POST.正确理解它们彼此的恰当运用会十分关键。
				
				The GET method should be used for non-destructive operations — that is, operations where you are only “getting” data from the server, not changing 
				data on the server. For example, a query to a search service might be a GET request. GET requests may be cached by the browser, which can lead to 
				unpredictable behavior if you are not expecting it. GET requests generally send all of their data in a query string.
				GET 方法应该用于那么非破坏性的操作 -- 那也就是说，你仅仅是从服务器上获取数据，而不改变数据。举个例子，搜索服务的一次查询操作会用这个方法。记住一点，
				GET 方法的请求会被浏览器缓存起来，这将会导致一些不可预知的行为。GET 请求通常会在一个查询字符串中发送其所有数据。
				
				The POST method should be used for destructive operations — that is, operations where you are changing data on the server. For example, a user 
				saving a blog post should be a POST request. POST requests are generally not cached by the browser; a query string can be part of the URL, 
				but the data tends to be sent separately as post data. 
				POST 方法应该用于那些破坏性的操作 -- 那也就是说，这些操作会改变服务器上的数据。举个例子哈，一个用户的保存日志操作应该归于 POST 请求。POST 请求通常不会
				被浏览器缓存; 查询字符串会是 URL 的一部分，数据部分会被作为 post data 单独发送。
				
				
				【Data Types】
				jQuery generally requires some instruction as to the type of data you expect to get back from an Ajax request; in some cases the data type is specified 
				by the method name, and in other cases it is provided as part of a configuration object. There are several options: 
				jQuery 通常需要你对一次 Ajax 请求返回的数据类型的进行一个提前说明;一些情况下，这个数据类型可以通过方法名来指定，其它的一些情况会是，由一个配置对象提供。
				有如下类型可供参考啊：
				
				text
				For transporting simple strings
				html
				For transporting blocks of HTML to be placed on the page
				script
				For adding a new script to the page
				json
				For transporting JSON-formatted data, which can include strings, arrays, and objects 
				jsonp
				For transporting JSON data from another domain
				xml
				For transporting data in a custom XML schema
				
				I am a strong proponent of using the JSON format in most cases, as it provides the most flexibility. It is especially useful for sending both HTML and 
				data at the same time.
				作者强烈支持用 JSON 格式，因为这个格式太灵活了。

			*/
			
			$.ajax({
			    // the URL for the request
			    url : '/AjaxApp/ajax/test',
			 
			    // the data to send
			    // (will be converted to a query string)
			    data : { id : 1},
			 
			    // whether this is a POST or GET request
			    type : 'GET',
			 
			    // the type of data we expect back
			    dataType : 'json',
			 
			    // code to run if the request succeeds;
			    // the response is passed to the function
			    success : function(json) {
			        $('<h1/>').text(json.title).appendTo('body');
			        $('<div class="content"/>')
			            .html(json.html).appendTo('body');
			    },
			 
			    // code to run if the request fails;
			    // the raw request and status codes are
			    // passed to the function
			    error : function(xhr, status) {
			        alert('Sorry, there was a problem!');
			    },
			 
			    // code to run regardless of success or failure
			    complete : function(xhr, status) {
			        alert('The request is complete!');
			    }
			});
			
			/*				
				$.fn.load
				The $.fn.load method is unique among jQuery’s Ajax methods in that it is called on a selection. The $.fn.load method fetches 
				HTML from a URL, and uses the returned HTML to populate the selected element(s). In addition to providing a URL to the method, 
				you can optionally provide a selector; jQuery will fetch only the matching content from the returned HTML.
				
				$.fn.load 是 jQuery 众 ajax 方法中惟一一个被选择器调用的方法。$.fn.load 从一个 URL 取得一个 HTML, 然后用这个返回的 html 来计算
				出这个被选择的元素。除了为这个方法提供一个 url 外，你还可以提供一个选择器;jQuery会从被返回的 html 中抓取这个匹配上的内容。
				
				1	$('#newContent').load('/foo.html #myDiv h1:first', function(html) {
				2	  	alert('Content updated!');
				3	});
			*/
		})			
		
	</script>
	<body>
		<div style='display:none'><span>0</span> button #0 clicks.</div>
		<div style='display:none'><span>1</span> button #1 clicks.</div>
		<div class='old' name='div3'><span>3</span> button #3 clicks.</div>
		<div class='old' name='div4'><span>4</span> button #4 clicks.</div>
	</body>
</html>