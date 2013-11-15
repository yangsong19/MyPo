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
			console.log('----------$ vs $()-----------');
			console.log('----------$.trim-----------');
			console.log($.trim("    trim head or tail extra string           "));

			// $.each
			console.log('----------$.each-----------');
			$.each({foo : 'bar', baz : 'bim'}, function(k, v){
				console.log(k + ":" + v);
			});//iterate an object
			
			$.each(['foo', 'bar', 'biz'], function(idx, val) {
				console.log('element[' + idx + '] = ' + val);
			});//iterate an array
			//There is also a method $.fn.each, which is used for iterating over a selection of elements. 
			
			// $.inArray
			console.log('----------$.inArray-----------');
			var myArr = [1, 2, 3, 5];
			if($.inArray(4, myArr) === -1) {//找出元素4在myArr中的索引，找不到返回 -1
				console.log('4 is not in myArr');
			}
			
			var firstObj = {foo : 'bar', a : 'boo'};
			var secondObj = {foo : 'baz', b : 'poo'};
			/*
				$.extend	--	Changes the properties of the first object using the properties of subsequent objects. 
								用后面的那个对象的属性值去修改第一个对象相对应的属性值
				var newObj = $.extend(firstObj, secondObj);
				console.log(newObj.foo + '\' newObj.a);	// baz
				console.log(firstObj.foo);	// baz
				console.log(secondObj.foo);	// baz
			*/ 
			// If you don't want to change any of the objects you pass to $.extend, pass an empty object as the first argument
			console.log('----------$.extend-----------');
			var newObj2 = $.extend({}, firstObj, secondObj);
			console.log(newObj2.foo + '|' + newObj2.a + '|' + newObj2.b);	// baz\boo\poo
			console.log(firstObj.foo);	// bar
			console.log(secondObj.foo);	// baz
			//	从上面可以看出，$.extend返回的新对象里面包含firstObj,secondObj的所有属性
			
			/*
				$.proxy
				Returns a function that will always run in the provided scope — that is, sets the meaning of this inside the passed function to the second argument.
				返回一个函数，什么样的函数呢，其始终会运行在你指定的那个范围内的函数 -- 这也就是说，将你传递进来的函数内部的 this 指向你传进来的第二个参数。
			*/ 
			console.log('----------$.proxy-----------');
			var myFunction = function() { console.log(this); };
			var myObject = { foo : 'bar' };			 
			myFunction(); // Window jq_basic_example.jsp		 
			var myProxyFunction = $.proxy(myFunction, myObject);
			myProxyFunction(); // Object { foo="bar" }
					
			/*
				If you have an object with methods, you can pass the object and the name of a method to return a function that will always run in the scope of the object
				如果你有一个内部包含函数的对象，你可以传递这个对象及这个对象的方法名
			*/  
				
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
			
			/*
				Checking types 
				Checking the type of an arbitrary value 
			*/
			console.log('----------typeof-----------');
			var myValue = [1, 2, 3];
			 
			// Using JavaScript's typeof operator to test for primative types
			typeof myValue == 'string'; // false
			typeof myValue == 'number'; // false
			typeof myValue == 'undefined'; // false
			typeof myValue == 'boolean'; // false
			 
			// Using strict equality operator to check for null
			myValue === null; // false
			 
			// Using jQuery's methods to check for non-primative types
			jQuery.isFunction(myValue); // false
			jQuery.isPlainObject(myValue); // false
			jQuery.isArray(myValue); // true
			console.log($.isArray(myValue)); // true
			
			/*
				Data Methods 
				As your work with jQuery progresses, you'll find that there's often data about an element that you want to store with the element. 
				In plain JavaScript, you might do this by adding a property to the DOM element, but you'd have to deal with memory leaks in some 
				browsers. jQuery offers a straightforward way to store data related to an element, and it manages the memory issues for you. 
				
				这段话主要讲，你想在存储一个元素时连带其数据一起存储，通常你可能会这样做，将某个属性加到 DOM element上，但是，你不得不解决在某些浏览器
				上的内存泄漏问题。jQuery提供了一个直截明了的方案来存储与元素相关的数据，而且其能够管理内存问题。			
				
			*/
			console.log('-----------$.fn.data---------');
			$('<div/>', {
				id : 'myDiv',
				html : 'This is a div'
			}).appendTo('body'); 	// 创建一个id为myDiv，html为'This is a div'的 DIV
			$('#myDiv').data('keyName', { foo : 'bar' });
			console.log($('#myDiv').data('keyName')); // Object { foo="bar" }
			
			/*
				You can store any kind of data on an element, and it's hard to overstate the importance of this when you get into complex application 
				development. For the purposes of this class, we'll mostly use $.fn.data to store references to other elements.
				For example, we may want to establish a relationship between a list item and a div that's inside of it. We could establish this relationship 
				every single time we interact with the list item, but a better solution would be to establish the relationship once, and then store a pointer 
				to the div on the list item using $.fn.data: 
				
				你可以存储与某个元素相关的任意类型数据，这个好处在你开发一个复杂的应用时会体现出来。出于这节课的目的，我们大多会用 $.fn.data 来存储这些元素的引用。
				举个例子，我们可能想在list item 和某个 div 之间建立关系，我们可以在和每一个list item交互时进行，但是一个好的解决方案一次性建立起来，而且用 $.fn.data 
				存储一个关联 list item 和这个 div 指针 [如下例为 ‘contentDiv’]。	另外可参见：jq_best_practice.jsp 中 jQuery.data			
				
			*/
			$('#myList li').each(function() {
				var $li = $(this), $div = $li.find('div.content');//'div.content' !== 'div .content',中间没有空格！！！
			    $li.data('contentDiv', $div);				
			});
			 
			// later, we don't have to find the div again;
			// we can just read it from the list item's data
			var $firstLi = $('#myList li:first');
			console.log($firstLi.data('contentDiv').html('new content')); // Object[div.content]
			console.log($firstLi.html('changed00')); // Object[li] 和上面一个相比，可以看出返回的对象是不同的，上面那个就是已经通过 $li.data 存储起来的
			
			
			// In addition to passing $.fn.data a single key-value pair to store data, you can also pass an object containing one or more pairs. 						
		})			
	</script>
		<div id='myList'>
			<li>
				<div class="content">div li 1</div>
			</li>
			<li>
				<div class="content">div li 2</div>
			</li>
		</div>
</html>