<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type='text/javascript' src='jquery-1.10.2.min.js'></script>
	<script type='text/javascript'>
	/* 
		============================
				Objects
		============================
		
		Objects contain one or more key-value pairs. The key portion can be any string. The value portion can be any type of value: 
		a number, a string, an array, a function, or even another object.
		[Definition: When one of these values is a function, it’s called a method of the object.] Otherwise, they are called properties.
		As it turns out, nearly everything in JavaScript is an object — arrays, functions, numbers, even strings — and they all have properties and methods. 
		
		对象里有一个或多个 key-value 对，key 部分可以是任何字符串，value 部分可以是下面任意类型：a number, a string, an array, a function, or even another object.
		
		Note
		When creating object literals, you should note that the key portion of each key-value pair can be written as any valid JavaScript identifier, 
		a string (wrapped in quotes) or a number: 
		注意了：当创建一个对象字面量时，应该注意到每个 key-value 对的 key 部分可以被写成任何有效的JavaScript标识符，a string (wrapped in quotes) or a number
	*/	
	/*	var myObject = {
			validIdentifier: 123,
			'some string': 456,
			99999: 789
		};
		console.log(myObject['some string'] + ' - ' + myObject.validIdentifier + ' - ' + myObject[99999]);
		console.log(myObject.'some string' + ' - ' + myObject.validIdentifier + ' - ' + myObject.99999.); // 当 key 是字符串或数字时，用点操作符时，会报 SyntaxError: missing name after . operator
	
		Object literals can be extremely useful for code organization; for more information, read http://rmurphey.com/blog/2009/10/15/using-objects-to-organize-your-code/ by Rebecca Murphey.
		对象字面量在组织你的代码时极为有用，想要获取更多信息，请阅读这篇由 Rebecca Murphey 写的大作。
	*/
	
	
	/*
		============================
				Functions 
		============================	

		Functions contain blocks of code that need to be executed repeatedly. Functions can take zero or more arguments, and can optionally return a value.
		Functions can be created in a variety of ways: 	
		函数包含了你需要重复执行的代码块。函数可以带有一到多个参数，而且可以返回一个值，这个操作是可选的。函数可以通过下列几个方法创建：
		
	*/
		// Function Declaration
		function fDecl() {
			//do something
		}
		// Named Function Expression 
		var fNamed = function() {
			//do something
		}
		/* I prefer the named function expression method of setting a function's name, for some rather http://yura.thinkweb2.com/named-function-expressions/. You are likely to see 
		   both methods used in others' JavaScript code. 
		*/   
		// A function that returns another function 
		var greet = function(person, greeting) {
			var text = greeting + ', ' + person;
			return function() {
						console.log(text);
				   };
		}
		var greeting = greet('yangsong', 'Hi');
		greeting();
	
		/* Self-Executing Anonymous Functions 
		(function(){
			var bar = 'Oh,yr';
		})();
		console.log(bar);// undefined
		*/
		/* In JavaScript, functions are "first-class citizens" &mdash they can be assigned to variables or passed to other functions as arguments. 
		   Passing functions as arguments is an extremely common idiom in jQuery. 
		   在 JavaScript,函数是"第一等公民"，它们既可以赋值给变量，也可以作为参数传递给其它函数
		*/	
	
		var myFunction = function() {
			console.log('hello');
		};
		 
		var myObject = {
			foo : 'bar'
		};
		 
		var myArray = [ 'a', 'b', 'c' ];
		 
		var myString = 'hello';
		 
		var myNumber = 3;
		 
		console.log(typeof myFunction);   // returns 'function'
		console.log(typeof myObject);     // returns 'object'
		console.log(typeof myArray);      // returns 'object' -- careful!
		console.log(typeof myString);     // returns 'string';
		console.log(typeof myNumber);     // returns 'number'
		 
		console.log(typeof null);         // returns 'object' -- careful!
		console.log(null instanceof Object); 	// false -- careful!
		 
		if (myArray.push && myArray.slice && myArray.join) {
			// probably an array
			// (this is called "duck typing")
			console.log('myArray is probably an array!');
		}
		 
		if (Object.prototype.toString.call(myArray) === '[object Array]') {
			// Definitely an array!
			// This is widely considered as the most robust way
			// to determine if a specific value is an Array.
			console.log('myArray is definitely an array!');
		}
		// jQuery offers utility methods to help you determine the type of an arbitrary value. These will be covered later. 
		// jQuery 提供了灰常实用的方法，帮助你决断一个任意值的类型。这些将在后面涉及到哟。
		
		console.log('=============Objects Supplementary==================');
		//对象拾遗  --- 参见 js_object_supplement.jsp 文件
		var myFeature = {
			config : {
				wrapper : '#myFeature',
				container : 'div',
				urlBase : 'foo.php?item='
			},

			init : function(config) {
				$.extend(myFeature.config, config);
				$(myFeature.config.wrapper).find('li').
					each(function() {
						myFeature.getContent($(this));
					}).
					click(function() {
						myFeature.showContent($(this));
					});
			},

			buildUrl : function($li) {
				return myFeature.config.urlBase + $li.attr('id');
			},

			getContent : function($li) {
				$li.append(myFeature.config.container);
				var url = myFeature.buildUrl($li);
				$li.find(myFeature.config.container).load(url);
			},

			showContent : function($li) {
				$li.find('div').show();
				myFeature.hideContent($li.siblings());
			},

			hideContent : function($elements) {
				$elements.find('div').hide();
			}
		};

		$(document).ready(function() { myFeature.init(); });

	</script>
</html>