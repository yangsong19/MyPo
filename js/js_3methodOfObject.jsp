<html>
	<script type='text/javascript' src='jquery-1.10.2.min.js'></script>
	<script type='text/javascript'>
	/*	
		=============================================================
								Object.toString()
		=============================================================						
		
		Every object has a toString() method that is automatically called when the object is to be represented 
		as a text value or when an object is referred to in a manner in which a string is expected. By default,
		the toString() method is inherited by every object descended from Object. If this method is not overridden 
		in a custom object, toString() returns "[object type]", where type is the object type. The following code illustrates this:
		
		每个对象都有一个toString()方法，当这个对象代表一个文本值或者是被期望引用为字符串时，这个方法将会自动调用！【这个很像java
		里面的String对象哦】默认情况下，toString()方法将会继承给那些从Object派生出来的对象。如果这个toString()方法在
		一个自定义的对象身上没有被重写，toString()这个方法将会返回[object type]，其中的type就是这个对象的类型。下面举
		个例子来描述一哈子：
	*/
	/*	var obj = new Object();
		console.log(obj.toString());  // returns [object Object]
		
		console.log(toString(null)); 	// [object Undefined]	--->	console.log(obj.toString(null));	returns [object Object] ???!!!
		console.log(toString(undefined));	//  [object Undefined]
		console.log(toString(NaN));		// [object Undefined]	--->	
		console.log(toString(new Date()); // 以及toString(NaN);这种没有对象的调用方法是不是非法的，无效的，不允许的？？但莫名其妙地却给我全打出[object Undefined]这个结果。因为toString()这个方法首先是属于某个实例对象的一个方法，然后这个方法是没有参数的
		
		console.log(null instanceof Object); // false	
		// 因此，null,undefined,NaN 都不是对象。因此 【null.toString()】 这种调用是错误的
		console.log(new Date() instanceof Object); // true
		
		var toString = Object.prototype.toString;	
		console.log(toString(null)); 	// [object Undefined]
		console.log(toString(undefined));	//  [object Undefined]
		console.log(toString(NaN));		// [object Undefined]
	*/	
		
	/*	【Overriding the default toString method】
		function Dog(name, breed, color, sex) {
		   this.name = name ;
		   this.breed = breed ;
		   this.color = color ;
		   this.sex = sex ;
		}

		theDog = new Dog("Gabby", "Lab", "chocolate", "female") ; 
		console.log(theDog.toString()); // [object Object]
		
		Dog.prototype.toString = function dogToString() {
			var ret = "Dog " + this.name + " is a " + this.sex + " " + this.color + " " + this.breed;
			return ret;			
		}//dogToString可以不要，为匿名函数
		
		// The following code creates and assigns dogToString() to override the default toString() method. 
		// With the preceding code in place, any time theDog is used in a string context, JavaScript automatically calls the dogToString() function
		doggy = new Dog('Long7', 'Vu', 'Brown', 'female');
		console.log(doggy); // Dog { name="Long7", breed="Vu", color="Brown", 更多...}
		console.log(doggy + ''); // Dog Long7 is a female Brown Vu
		alert(doggy); // Dog Long7 is a female Brown Vu
	*/

    /*
		==================================================================
							【Object.toSource()】
		==================================================================					
	
		Non-standard
		This feature is non-standard and is not on a standards track. Do not use it on production sites facing the Web: it will not work for every user. 
		There may also be large incompatibilities between implementations and the behavior may change in the future.
	*/			
		
		var date = new Date();
		console.log(date.toSource()); //new Date(1382598531572)
		console.log(Date.toSource()); //function Date() { [native code] } ---> For the built-in Object object, toSource returns the following string indicating that the source code is not available:
		
		function Person(name)  {
			this.name = name;
		};
		console.log(new Person('ys').toSource()); //  ({name:"ys"}) ---> For instances of Object, toSource returns a string representing the source code.
		
		// It is safe for objects to override the toSource method. For example:
		Person.prototype.toSource = function person_toSource() {
			return "new Person(" + uneval(this.name) + ")";		
		}
		console.log(new Person('yangsong').toSource()); // new Person("yangsong")
		
	

	/*
		=================================================================
							Object.valueOf
		=================================================================					
	
		JavaScript calls the valueOf method to convert an object to a primitive value. You rarely need to invoke the valueOf method yourself; 
		JavaScript automatically invokes it when encountering an object where a primitive value is expected.
		By default, the valueOf method is inherited by every object descended from Object. Every built-in core object overrides this method to
		return an appropriate value. If an object has no primitive value, valueOf returns the object itself, which is displayed as:
		[object Object]
		You can use valueOf within your own code to convert a built-in object into a primitive value. When you create a custom object, you can
		override Object.prototype.valueOf to call a custom method instead of the default Object method.
	
		console.log(Boolean.valueOf()); // Boolean()
		console.log(new Boolean().valueOf()); // false
		console.log(true.valueOf()); // true
		
		console.log(Date.valueOf()); // Date()
		console.log(new Date().valueOf()); // 1382600668810
		
		function Age(age) {
			this.age = age;
		}
		var child = new Age(10);
		console.log(child.valueOf()); // Age { age=10}
		Age.prototype.valueOf = function ageToValueof() {
		    return	this.age;
		}
		var girl = new Age(5);
		console.log(girl.valueOf()); // 5
	*/	
		
		
		
		
		
		
		
		
		
		
	</script>
</html>