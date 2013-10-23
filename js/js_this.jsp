<html>
	<head>
		<title>JS This</title>
		<script type="text/javascript" src="jquery-1.10.2.min.js"></script>
		<script type="text/javascript">
		/*	参考 js学习总结.txt  文件中关于 THIS关键字的总结  */	
			var myObject = {
					sayHello : function() {	
						console.log(this);
						console.log('Hi! My name is ' + this.myName );						
					},
					myName : 'yangsong'
				};
			var secondObject = {
					myName : 'tom'
				};
			myObject.sayHello();					//sayHello()是myObject对象的一个方法，this指向myObject对象	--->	Hi! My name is yangsong  ->  Object { myName="yangsong", sayHello=function()}
			myObject.sayHello.call(secondObject);	//Function.call的方式调用，this指向传入的第一个参数secondObect对象  -->   Hi! My name is tom  ->  Object { myName="tom"}
		
		//-------------------------------------------------------------------------------------------
		
			var name = 'The global object.',
				sayHello = function() {					
					console.log(this);
					console.log('Hi, My name is ' + this.name);
				},
				myObj = {
					name : 'YangSong'
				};
			var myObjectHello = sayHello.bind(myObj);
			sayHello();			//sayHello方法单独被调用，this指向一个全局对象即window	--->	Hi, My name is The global object  ->	Window js_this.jsp
			myObjectHello();	//sayHello.bind的方式被调用，this指向传入的参数myObject		--->	Hi, My name is YangSong	->	Object { myName="YangSong"}
				
		//-------------------------------------------------------------------------------------------
		// A function being attached to an object at runtime , 在运行时，某个函数被绑定到某个对象上
			var yourName = 'The global object.',
				saySorry = function() {
					console.log(this);
					console.log("I'm sorry, " + this.yourName);
				},
				yourObj = {
					yourName : 'John'
				},
				someObj = {
					yourName : 'Lucy'
				};
			yourObj.saySorry = saySorry;
			someObj.saySorry = saySorry;
			
			saySorry();						//I'm sorry, The global object.   ->	Window js_this.jsp
			yourObj.saySorry();				//I'm sorry, John	->	Object { yourName="John", saySorry=function()}
			someObj.saySorry();				//I'm sorry, Lucy	->	Object { yourName="Lucy", saySorry=function()}
			
		/*
			Note:
				When invoking a function deep within a long namespace, it is often tempting to reduce the amount of code you need to type by storing a reference to 
				the actual function as a single, shorter variable. It is important not to do this with instance methods as this will cause the value of this within 
				the function to change, leading to incorrect code operation. For instance: 
				当调用一个函数时，用了一个【足够深的长名字空间】，通常应该试着，【通过用一个简短的变量来存储那个事实上要被调用的函数的引用】，以来减少你需要敲入的代码量。
				不用实例方法去那样做是很重要的，因为那样做将会引起函数内部 THIS 值的变化，导致错误的代码执行，下面举个例子：
		*/	
			//myName = 'global name';
			var myNamespace = {
					myObject : {
						sayHello : function() {
							console.log(this);
							console.log('Hi, My name is ' + this.myName);
						},
						myName : 'ys'
					}
				};
			var hello = myNamespace.myObject.sayHello;
			hello();			//通过log可以看出，this指向了全局的  Window js_this.jsp --->  Hi, My name is undefined
		
		//	You can, however, safely reduce everything up to the object on which the method is invoked: 
		//	然而，你可以安全放心地减少任何中间层，向上一直到【这个方法被调用的对象】为止。
		
			var myNamespace = {
					myObject : {
						sayHello : function() {
							console.log(this);
							console.log('Hi, My name is ' + this.myName);
						},
						myName : 'ys'
					}
				};
			var obj = myNamespace.myObject;  	//*******注意这个地方和上面的区别******
			obj.sayHello();
			        	
		</script>
	</head>
</html>