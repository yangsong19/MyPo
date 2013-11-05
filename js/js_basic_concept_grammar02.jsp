<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
	<script type='text/javascript' src='jquery-1.10.2.min.js'></script>
	<script type='text/javascript'>
	// 【Conditional Variable Assignment with The Ternary Operator】
		var bar = 'bar';
		var foo = bar ? 1 : 0;
		console.log(foo); // 1
	/*	Switch statements have somewhat fallen out of favor in JavaScript, because often the same behavior can be accomplished 
		by creating an object that has more potential for reuse, testing, etc. For example: 

		有趣了，这个：之前，我肿么没有注意这个现象呢。对象 --- switch
	*/	
		var stuffToDo = {
			'bar' : function() {
				alert('the value was bar -- yay!');
			},
		 
			'baz' : function() {
				alert('boo baz :(');
			},
		 
			'default' : function() {
				alert('everything else is just ok');
			}
		};
		 
		if (stuffToDo[foo]) {
			stuffToDo[foo]();
		} else {
			stuffToDo['default']();
		}
		
		
	/*	
		for loop statement
		关于for循环，其实最重要的一点就是【闭包】现象的存在，以及会引发的问题。
	
	*/	
		
		
		
	</script>
</html>