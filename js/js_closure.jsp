<html>
	<head>
		<title>JS Closure</title>
		<script type="text/javascript" src="jquery-1.10.2.min.js"></script>	
		<script type="text/javascript">		
        /*
			Closures are an extension of the concept of scope — functions have access to variables that were available in the scope where the function was created. 
			If that’s confusing, don’t worry: closures are generally best understood by example.
			In “Functions can "see" changes in variable values after the function is defined”, we saw how functions have access to changing variable values. The same 
			sort of behavior exists with functions defined within loops — the function "sees" the change in the variable's value even after the function is defined, 
			resulting in all clicks alerting 5. 

			"Closures" 是对scope概念的一种延伸 -- 函数能够访问这些变量，哪些呢，就是在函数被创建时其所在的那个范围。
			如果这个听起来很纠结，不要担心：”Closures“ 通过下面的例子就能很好的理解了 :)!
			In “Functions can "see" changes in variable values after the function is defined”【这是js_scope.jsp倒数第二个例子】,我们可以看到函数是如何访问到改变后的变量值。
			同样的行为也存在在这样的一个情形中，一个函数定义在loop循环中，这个函数可以看到循环中变量值的改变，即使是在每次这个函数都被重新定义了一次之后，导致你点击5次，每次弹出的结果都是5
			
		*/		
		/* How to lock in the value of i? 
			$(function(){
				for(var i = 0; i < 5; i ++) {
					$('<p>click me</p>').appendTo('body').click(function() {
						alert(i);
					});
				};
			});				
		*/			// ----------->
		/* fix: “close” the value of i inside createFunction, so it won't change 	
			$(function() {
				var createFunction = function(i) {
					return function() {
						alert(i);
					};
				};
				for(var i = 0; i < 5; i ++) {
					$('<p>click me</p>').appendTo('body').click(createFunction(i));
				};
			});	
		*/		
		// Closures can also be used to resolve issues with the this keyword, which is unique to each scope:
		//		Using a closure to access inner and outer object instances simultaneously 
			var outerObj = {
					myName : 'outer',
					outerFunction : function() {
						var self = this;
						var innerObj = {
								myName : 'inner',
								innerFunction : function() {
									console.log(self.myName, this.myName);//outer inner
								}
							};
						innerObj.innerFunction();
						console.log(this.myName);//outer	
						console.log(myName);//myName 只是outerObj对象的一个属性，而不是以var关键字形式定义的一个变量，所以，这种访问的结果是：ReferenceError: myName is not defined
					}
			    };
			outerObj.outerFunction();	
		</script>
	</head>

</html>