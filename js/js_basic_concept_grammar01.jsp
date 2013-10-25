<html>
	<script type='text/javascript' src='jquery-1.10.2.min.js'></script>
	<script type='text/javascript'>
	//	【Addition vs. concatenation】
		var foo = 1;
		var con = '1';
		var bar = '2';
		var gan = true;
		
		var baz = 0;
		var doo = false;
		
	/*	console.log(foo + bar);// 12	uh oh..
	//	Forcing a string to act as a number 
		console.log(foo + Number(bar));// 3
	//	Forcing a string to act as a number (using the unary-plus operator)	使用加号操作符
		console.log(foo + +bar);// 3	coerce the string to a number
	
	//	【Logical AND and OR operators】
		
		console.log(foo || bar);// 1  true
		console.log(bar || foo);// 2  true
		console.log(baz || foo);// 1  true
		console.log(bar || baz);// 2  true
		console.log(doo || baz || null);// null
		console.log(doo || baz || null || undefined);// undefined
		console.log(doo || baz || null || undefined || '');// (空字符串)
	// '||'，找到左起第一个truthy operand为止，找不到就返回最后一个操作数【全假才为假，所以要找那个真】
		
		console.log(foo && bar);// 2	true
		console.log(bar && foo);// 1	false
		console.log(foo && baz);// 0	false
		console.log(foo && bar && baz);// 0	false
		console.log(foo && baz && bar);// 0	false
		console.log(foo && bar && gan);// true
	// '&&'，找到左起第一个false operand为止，找不到就返回最后一个操作数【全真才为真，所以要找那个假】
	*/
	
	/*	You'll sometimes see developers use these logical operators for flow control instead of using if statements. For example: 这种写法对初学者来说，不易读。但就是简洁，表达性强
	//  do something with foo if foo is truthy,如果foo为真，则拿foo做一些事doSomething(foo);如果foo为假,就直接返回foo
		foo && doSomething(foo);
	//  set bar to baz if baz is truthy;otherwise, set it to the return;value of createBar()如果baz为真，则把bar设成baz,如果baz为假，则createBar()并返回
		var bar = baz || createBar();	
	*/
	
	/*	【Comparison Operators】
		console.log(foo == con);//	true
		console.warn(foo == baz);//	false
		console.log(con != bar);//	true
		
		console.warn(foo === con);//  false
		console.log(foo === parseInt(con));//	true
		console.log(bar >= foo);//	true 没有>==这样的比较操作符
	*/	
	/*	【Conditional Code】条件符号
		if(doo) {
			console.log('yes');
			//some other statements;
		}
	*/	
	
	/*	【Truthy and Falsy Things】在这个知识点儿，我深入的有点儿过了，发现你越深入牵涉的东西越多，有种出不来，看不到尽头的感觉，真是这样，要适可而止了
	//	Values that evaluate to true 
		console.log(new Boolean('0').valueOf());
		console.log(new Boolean('any string').valueOf());
		console.log(new Boolean([]).valueOf());//an empty array
		console.log(new Boolean({}).valueOf());//an empty object
		console.log(new Boolean(1).valueOf());//any non-zero number
	//	Values that evaluate to false 
		console.log(Boolean(0));
		console.log(Boolean(''));
		console.log(Boolean(NaN));
		console.log(Boolean(null));
		console.log(Boolean(undefined));//be careful ,undefined can be redefined!
		console.log(Boolean(undefined).toString());//Boolean的toString(),valuedOf()表现结果一样,这个从js_3methodOfObject.jsp文件中可以看到，原来这些内置类或对象重写了这两个方法哟。。。
		console.log(Boolean(undefined).toSource());//(new Boolean(false))
				
		var obj = {
				name : 'ys',
				age	: 20,
				walk : function() {
					console.log(this.name);
				}
			};
		var arr = [11,22];
		console.log(obj.toString());//[object Object]
		console.log(obj.toSource());//({name:"ys", age:20, walk:(function () {console.log(this.name);})})
		console.log(arr.toString());//11,22
		console.log(arr.toSource());//[11, 22]
		
		console.log(Boolean(123).toString());//Returns a string of either "true" or "false" depending upon the value of the object. -- true
		console.log(Boolean(123).toSource());//Returns a string containing the source of the Boolean object; you can use this string to create an equivalent object. Overrides the Object.prototype.toSource method. --> (new Boolean(true))
		console.log(Boolean(123).valueOf());//Returns the primitive value of the Boolean object. -- true
		console.log(Boolean().valueOf(123));// -- false 貌似我这种写法是错的，但firebug没有报错。可是和上面结果相反为false,看来这个地儿传入的123，是无效的，API文档里是没有参数的。所以相当于默认为false了！！
	//  Object.toStirng() -- Object.toSource() -- Object.valueOf()	这三个方法是所有继承Object对象之后的对象都具备的，如果重写这些方法之后，表现效果会有变化。比如，上面Array,Boolean这两个对象	
		参见文档 -- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/toString?redirectlocale=en-US&redirectslug=JavaScript%2FReference%2FGlobal_Objects%2FObject%2FtoString
		参见文件【js_3methodOfObject.jsp】
	*/

	/*	Using toString() to detect object class
		toString() can be used with every object and allows you to get its class. To use the Object.prototype.toString() with every object, you need to call Function.
		prototype.call() or Function.prototype.apply() on it, passing the object you want to inspect as the first parameter called thisArg.
		var toString = Object.prototype.toString;
		console.log(toString.call(new Boolean));//[object Boolean]	这个地方就表现出call用法的独特之处在于，toString这个方法的对象变成传进来的Boolean对象了，故相当于调用了new Boolean().toString()方法啊，而Boolean类是重写了toString方法了的
		console.log(toString.call(new Boolean()));//[object Boolean]		
		console.log(toString.call(Boolean));//[object Function]
		console.log(toString.call(undefined));//[object Undefined] 	Since JavaScript 1.8.5
		console.log(toString.call(bar));//[object String]
		console.log(toString.call(gan));//[object Boolean]
		console.log(toString.call(foo));//[object Number]
	*/	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</script>
</html>