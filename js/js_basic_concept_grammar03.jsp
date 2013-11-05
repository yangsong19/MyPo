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
		
		var str = 'abcdef';
		var consonantsOnlyStr = Array.filter(str, function (c) { return !(/[aeiou]/i).test(c);}).join(''); console.log(consonantsOnlyStr);// 'bcdf'
		var vowelsPresent = Array.some(str, function (c) { return (/[aeiou]/i).test(c); }); console.log(vowelsPresent);// true
		var allVowels = Array.every(str, function (c) { return (/[aeiou]/i).test(c); }); console.log(allVowels);// false
		var interpolatedZeros = Array.map(str, function (c) { return c+'0'; }).join(''); console.log(interpolatedZeros);// 'a0b0c0d0e0f0'
		var numerologicalValue = Array.reduce(str, function (c, c2) { return c+c2.toLowerCase().charCodeAt()-96 ;}, 0); console.log(numerologicalValue);// 21
		
		function minOfArray(arr) {
		  var min = Infinity;
		  var QUANTUM = 32768;

		  for (var i = 0, len = arr.length; i < len; i += QUANTUM) {
				var submin = Math.min.apply(null, arr.slice(i, Math.min(i + QUANTUM, len)));
				min = Math.min(submin, min);
		  }

		  return min;
		}
		var arr = [5, 6, 2, 3, 7];
		var min = minOfArray(arr);
		console.log('min ' + arr.toSource() + ' : ' + min);
		
		console.log('----------get set delete-----------');
		/*
			Sometimes it is desirable to allow access to a property that returns a dynamically computed value, or you may want reflect the status 
			of an internal variable without requiring the use of explicit method calls. In JavaScript, this can be accomplished with the use of a 
			getter. It is not possible to simultaneously have a getter bound to a property and have that property actually hold a value, although 
			it is possible to use a getter and a setter in conjunction to create a type of pseudo-property.
			有时候会有这样的一种需求，就是允许访问一个动态计算出的属性，或者是你想反映某个内部变量的状态而不想用明确的方法调用。在JavaScript中，这
			个可以用一个 get方法来完成。不同时做这两样操作：给某个属性绑定 get 方法的同时让其拥有一个值，尽管可以同时使用get and set 来创建一个伪属性。
		*/
		var o = {
			  get latest () {
					if (this.log.length > 0) {
					  return this.log[this.log.length - 1];
					}
					else {
					  return null;
					}
			  },
			  log: []
		}
		o.log.push('abc');
		o.latest = 'change0';  // Note that attempting to assign a value to latest will not change it.	改变不了其值
		console.log(o.latest); // abc
		delete o.latest; // 删除之后 对象中就没有 latest 这个属性了
		console.log(o.toSource());  // ({log:["abc"]})
		
		/*
			In JavaScript, a setter can be used to execute a function whenever a specified property is attempted to be changed. Setters are 
			most often used in conjunction with getters to create a type of pseudo-property. It is not possible to simultaneously have a setter 
			on a property that holds an actual value.
		*/
		var obb = {
		  set current (str) {
				return this.log[this.log.length] = str;
		  },
		  log: []
		}
		obb.current = 'change1';
		console.log(obb.log);	// change1
		
		/*
			Introduced in JavaScript 1.7, array comprehensions provide a useful shortcut for constructing a new array based on the contents of another. 
			Comprehensions can often be used in place of calls to map() and filter(), or as a way of combining the two.
		*/
		var numbers = [1, 2, 3, 4];
		var doubled = [i * 2 for (i of numbers)]; //  is equivalent to - var doubled = numbers.map(function(i){return i * 2;});
		console.info(doubled); // Alerts 2,4,6,8
		
		var numbers = [1, 2, 3, 21, 22, 30];
		var evens = [i for (i of numbers) if (i % 2 === 0)]; // is equivalent to - var evens = numbers.filter(function(i){return i % 2 === 0;});
		console.debug(evens); // Alerts 2,22,30
		
		/*
			map() and filter() style operations can be combined into a single array comprehension. Here is one that filters just the even numbers, 
			then creates an array containing their doubles:
		*/
		var numbers = [1, 2, 3, 21, 22, 30];
		var doubledEvens = [i * 2 for (i of numbers) if (i % 2 === 0)];
		console.log(doubledEvens); // Alerts 4,44,60
		
		var str = 'abcdef';
		console.info(consonantsOnlyStr = [c for (c of str) if (!(/[aeiouAEIOU]/).test(c))  ].join('')); // 'bcdf'
		console.error(interpolatedZeros = [c+'0' for (c of str) ].join('')); // 'a0b0c0d0e0f0'
		
		console.log('-------const-------');
		const stable = 'wd';
		stable = 'ch';// 不起作用，但也不会报错
		console.info(stable);
		
		console.log('-------let-------');
		
		
	</script>
</html>