<html>
	<head>
		<title>JS Scope</title>
		<script type="text/javascript" src="jquery-1.10.2.min.js"></script>	
		<script type="text/javascript">		
        /*
			"Scope" refers to the variables that are available to a piece of code at a given time. A lack of understanding of scope can lead to frustrating debugging experiences.
			When a variable is declared inside of a function using the var keyword, it is only available to code inside of that function — code outside of that function cannot 
			access the variable. On the other hand, functions defined inside that function will have access to to the declared variable.
			Furthermore, variables that are declared inside a function without the var keyword are not local to the function — JavaScript will traverse the scope chain all the way up to 
			the window scope to find where the variable was previously defined. If the variable wasn't previously defined, it will be defined in the global scope, which can have extremely 
			unexpected consequences; 

			"Scope" 指的是变量在一个给定的时间内，对一段代码的可见性。疏于对 ’scope' 的理解，可能会导致一段令人挫败的经历。当一个变量在一个函数内部以 var 关键字形式声明后，它仅能在这个函数
			内部使用，函数外部是不可见的。此外，定义在函数内部的函数是能访问到声明的变量的。
			此外，在函数内部没有通过 var 关键字声明的变量，将不会限于该函数内部使用 --- javascript将会遍历scope chain向上一直到达window scope,这样去找出这个变量之前定义的地方。如果这个变量
			之前没有被定义，它将会被定义成global scope，这种情况将会引起不可预期的后果！
		*/			
		
		// 01 Functions have access to variables defined in the same scope 
			var	foo = 'hello';
			var sayScope = function() {
					console.log(foo);				
				};
			sayScope();			//hello
			console.log(foo);	//hello
		// 02 Code outside the scope in which a variable was defined does not have access to the variable 
		// 被定义的变量所在的范围，就是能访问这个变量的那个范围，这个例子就是指sayHidden这个函数(准确来说是在函数内部foo2定义之后)，然而你的code不在这个能访问的范围内，却访问了这个foo2
			
			var sayHidden = function() {
					var foo2 = 'hidden';
					console.log(foo2);
				};
			sayHidden();		//hidden
			//console.log(foo2);  //ReferenceError: foo2 is not defined
		
		// 03 Variables with the same name can exist in different scopes with different values 
		//	函数内部定义的foo3由于其可见范围只限于sayFoo3内部，所以不会影响外部foo3的访问
			var foo3 = 'the same';
			var sayFoo3 = function() {
					var foo3 = 'the other';
					console.log(foo3);
				};
			sayFoo3();
			console.log(foo3);
		
	    // 04 Functions can "see" changes in variable values after the function is defined 
		//		这句话我的理解：函数可以”看到“变量值的变化，而且是在该函数被定义之后。以这个例子为例 -->
		//						首先myFn和foo4在同一个作用域，具有相同的可访问范围，从最后打出来的结果看，不是'first',而是'second'，即所谓的看到了foo4变量值的变化
			var myFunction = function() {
					var foo4 = 'first';
					var myFn = function() {
							console.log(foo4);
						};
					var foo4 = 'second';
					return myFn;
				};
		    var fnc = myFunction();
			fnc(); // logs 'second' -- uh oh
		// 05 Scope insanity ,下面这是个自动执行的匿名函数
			(function(){
				var baz = 1;
				var bim = function() {
						alert(baz);
					};
				bar = function() {
						alert(baz);
					};	
			})();
			//console.log(baz); baz在匿名函数外部不可见
			bar(); // bar函数没有用var关键字声明，所以为全局window scope函数，能够访问
			bim(); // bim is not defined!
		
		</script>
	</head>

</html>