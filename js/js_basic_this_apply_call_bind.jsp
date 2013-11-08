<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><!-- HTML 文档的字符编码未声明。如果该文件包含 US-ASCII 范围之外的字符，该文件将在某些浏览浏览器配置中呈现为乱码。页面的字符编码必须在文档或传输协议层声明。-->
	<script type='text/javascript' src='jquery-1.10.2.min.js'></script>
	<script type='text/javascript'>
		/*
			All objects in JavaScript are descended from Object Object; all objects inherit methods and properties from Object.prototype Object.prototype, 
			although they may be overridden (except an Object with a null prototype, i.e. Object.create(null)). 
			For example, other constructors' prototypes override the constructor property and provide their own toString methods. Changes to 
			the Object prototype object are propagated to all objects unless the properties and methods subject to those changes are overridden 
			further along the prototype chain.
			
			在 JavaScript 中的所有对象都派生自 Object 对象; 所有的对象也都继续了 Object.prototype 的方法和属性, 尽管它们会被重写(有一个例外，null prototype,那就是 Object.create(null))
			举个例子,其它构造器的原型重写了 constructor property 而且提供了它们自己的 toString 方法。对 Object prototype 的改动会传递给所有对象，直到受这些改动影响的属性和方法将来在
			这个原型链上再次被改动为止。
			
			Since Javascript doesn't exactly have sub-class objects, prototype is a useful workaround to make a "base class" object of certain functions that act as objects. For example:
			由于 JavaScript 没有明确的子类对象的概念， prototype 是一种变通的解决方案，来让一个具有某种功能的 ‘base class’ 对象担当对象的角色。下面来个例子：
			
			------通过这个例子，我来总结一下自己的感受：其实，prototype,这个关键字，就像是 java 里面的 extends 关键字吧，JavaScript 里面虽然没有规范中这种类对象的继承机制，而 prototype 无疑
				  是在朝这个方面靠拢，追求那个类对象世界里的真正 extends 机制，以达到那个效果。所以，JavaScript 里面要用一种面向对象的思维来学习。可以来建立一系列明晰的概念和经验，让这两种
				  语言相通，以达到减负，不是各自独立，今天记住明天又忘，重新再来的成本问题。知识就是一个通则活的过程。当然二者也有明显的区别，不能死搬硬套。独立思考。
				  以前自己学习到的都零散的知识碎片，而现在有能力再进一步，朝向系统性，整体性探究，花费大量的时间精力来完成这样一件事情，也是迫在眉睫。
				  比如说 Java 里好的思想，已经成熟的解决方案，在 JavaScript 中都是可以尝试进行，改造以前的冗长无规则，重写简洁，有层次，结构性强，语义明晰，组织明了的代码，无论是重用及测试
				  不至于开销太大。不同的阶段，都需要解决不同层次问题，总之，要向更清晰，更规范，更整体，更逻辑，更系统的方向努力。
		*/
		console.log('------------Object.prototype---------');
		var Person = function() {
			this.canTalk = true;
			this.greet = function() {
				if (this.canTalk) {
					console.log("Hi, I'm " + this.name);
				}
			};
		};

		var Employee = function(name, title) {
			this.name = name;
			this.title = title;
			this.greet = function() {
				if (this.canTalk) {
					console.log("Hi, I'm " + this.name + ", the " + this.title);
				}
			};
		};
		Employee.prototype = new Person();

		var Customer = function(name) {
			this.name = name;
		};
		Customer.prototype = new Person();

		var Mime = function(name) {
			this.name = name;
			this.canTalk = false;
		};
		Mime.prototype = new Person();

		var bob = new Employee('Bob','Builder');
		var joe = new Customer('Joe');
		var rg = new Employee('Red Green','Handyman');
		var mike = new Customer('Mike');
		var mime = new Mime('Mime');
		bob.greet();
		joe.greet();
		rg.greet();
		mike.greet();
		mime.greet();
		console.log(mime.hasOwnProperty('title'));// false
		console.log(bob.hasOwnProperty('title'));// true
		for (var name in rg) {
			if (rg.hasOwnProperty(name)) {
				console.log("this is rg (" + name + ") for sure. Value: " + rg[name]);
			} else {
				console.log(name); // toString or something else
			}
		}
		/*
			this is rg (name) for sure. Value: Red Green
			this is rg (title) for sure. Value: Handyman
			this is rg (greet) for sure. Value: function () {
													if (this.canTalk) {
														console.log("Hi, I'm " + this.name + ", the " + this.title);
													}
												} 		// ***** 【可见，函数也是一个对象的属性哟，和 java 不一样】 ！！！
			canTalk  -- 这个属性是 Person ,即 ‘base-class’ 基类上的，故用 hasOwnProperty 方法检测不出的，这个地方走的是 else 语句
		*/
		console.log(Person.prototype.isPrototypeOf(bob)); // true
		console.log(bob instanceof Person); // true
		/*
			fun.apply(thisArg[, argsArray])			
			thisArg
				The value of this provided for the call to fun. Note that this may not be the actual value seen by the method: if the method is a function in 
				non-strict mode code, null and undefined will be replaced with the global object, and primitive values will be boxed.
			argsArray
				An array-like object, specifying the arguments with which fun should be called, or null or undefined if no arguments should be provided to the function. 
		*/
		console.log('------------Function.prototype.apply---------');
		Function.prototype.construct = function (aArgs) {
			var fConstructor = this, fNewConstr = function () { fConstructor.apply(this, aArgs); };
			fNewConstr.prototype = fConstructor.prototype;
			return new fNewConstr();
		};
		
		function MyConstructor () {
			for (var nProp = 0; nProp < arguments.length; nProp++) {
				this["property" + nProp] = arguments[nProp];
			}
		}

		var myArray = [4, "Hello world!", false];
		var myInstance = MyConstructor.construct(myArray);

		console.log(myInstance.property1); //  "Hello world!"
		console.log(myInstance instanceof MyConstructor); //  "true"
		console.log(myInstance.constructor); //  "MyConstructor"
		
		
	</script>
</html>