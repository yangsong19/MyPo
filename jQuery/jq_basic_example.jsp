<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type='text/javascript' src='../js/jquery-1.10.2.min.js'></script>
	<script type='text/javascript'>
		$(document).ready(function() {
		/*			
			jQuery Core
			$ vs $() 			
			Until now, we’ve been dealing entirely with methods that are called on a jQuery object. For example:
			$('h1').remove();
			Most jQuery methods are called on jQuery objects as shown above; these methods are said to be part of the $.fn namespace, 
			or the “jQuery prototype,” and are best thought of as jQuery object methods.

			However, there are several methods that do not act on a selection; these methods are said to be part of the jQuery namespace, 
			and are best thought of as core jQuery methods.

			This distinction can be incredibly confusing to new jQuery users. Here’s what you need to remember:
			【1】Methods called on jQuery selections are in the $.fn namespace, and automatically receive and return the selection as this.
			【2】Methods in the $ namespace are generally utility-type methods, and do not work with selections; they are not automatically passed 
				any arguments, and their return value will vary.
				
			There are a few cases where object methods and core methods have the same names, such as $.each and $.fn.each. In these cases, 
			be extremely careful when reading the documentation that you are exploring the correct method. 
			
			上面这段话，尤其重要:
			直到目前为止，我们一直在和 jQuery object 对象身上的 jQuery methods 打交道。举个例子：$('h1').remove();正如这个例子一样，大多数 jQuery methods
			是被称作 jQuery objects 调用的！这些方法据说是 $.fn namespace 的一部分, 或者是 “jQuery prototype”的一部分，我们最好把它们视为 jQuery object的方法。
			
			然而，一些方法对这样的选择器 $('h1') 不起作用;这些方法据说是 jQuery namespace 的一部分，而且最好把它们视为 core jQuery methods.
			
			这种区分将会给jQuery的初学者带来难以置信的困惑！那么对于初学者来说，仅需要记住以下两点就好了：
			【1】被 jQuery selections [$('h1')] 调用的方法位于 $.fn namespace,而且会将这个 selection 作为 this ,自动接收并返回
			【2】在 $ namespace 中的方法通常是 utility-type 方法，而且不会对 selections 起作用;它们不会被自动传递任何参数，而且它们的返回值将是变化的。
			
			有几个别的例子是这样子的，object methods and core methods 和相同名字的方法，比如， $.each and $.fn.each.基于这些个个例，当你在文档中探索正确的方法时
			一定要特别注意。
			
			 = =================
			 = Utility Methods =
			 ===================
			jQuery offers several utility methods in the $ namespace. These methods are helpful for accomplishing routine programming tasks. 
			Below are examples of a few of the utility methods; for a complete reference on jQuery utility methods, 
			visit http://api.jquery.com/category/utilities/. 
		*/
			// $.trim
			console.log($.trim("    before " + " after         "));

			// $.each
			$.each({foo : 'bar', baz : 'bim'}, function(k, v){
				console.log(k + ":" + v);
			});//iterate an object
			
			$.each(['foo', 'bar', 'biz'], function(idx, val) {
				console.log('element[' + idx + '] = ' + val);
			});//iterate an array
			//There is also a method $.fn.each, which is used for iterating over a selection of elements. 
			
			// $.inArray
			var myArr = [1, 2, 3, 5];
			if($.inArray(4, myArr) === -1) {//找出元素4在myArr中的索引，找不到返回 -1
				console.log('4 is not in myArr');
			}
			
			var firstObj = {foo : 'bar', a : 'boo'};
			var secondObj = {foo : 'baz', b : 'poo'};
			/*
				$.extend	--	Changes the properties of the first object using the properties of subsequent objects. 
				
				var newObj = $.extend(firstObj, secondObj);
				console.log(newObj.foo + '\' newObj.a);	// baz
				console.log(firstObj.foo);	// baz
				console.log(secondObj.foo);	// baz
			*/ 
			// If you don't want to change any of the objects you pass to $.extend, pass an empty object as the first argument
			var newObj2 = $.extend({}, firstObj, secondObj);
			console.log(newObj2.foo + '|' + newObj2.a + '|' + newObj2.b);	// baz\boo\poo
			console.log(firstObj.foo);	// bar
			console.log(secondObj.foo);	// baz
			//	从上面可以看出，$.extend返回的新对象里面包含firstObj,secondObj的所有属性
			
			// $.proxy
			var myFunction = function() { console.log(this); };
			var myObject = { foo : 'bar' };			 
			myFunction(); // Window jq_basic_example.jsp		 
			var myProxyFunction = $.proxy(myFunction, myObject);
			myProxyFunction(); // Object { foo="bar" }
					
			//  If you have an object with methods, you can pass the object and the name of a method to return a function that 
			//	will always run in the scope of the object
			var myObject = {
				myFn : function() {
					console.log(this);
				}
			};
			$('<a/>', {
				html : 'This is a new link',
				id : 'foo',
				href : 'javascript:void(0);'
			}).appendTo('body'); 
			$('#foo').click(myObject.myFn); //  <a id="foo" href="javascript:void(0);"/>
			$('#foo').click($.proxy(myObject, 'myFn')); //  Object { myFn=function() }
		})			
	</script>
		
</html>