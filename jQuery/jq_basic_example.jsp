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
		*/
			$.each({foo : 'bar', baz : 'bim'}, function(k, v){
				console.log(k + ":" + v);
			});
		})			
	</script>
	<a href='javascript:void(0);' >baidu</a>
</html>