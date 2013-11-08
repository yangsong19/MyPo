<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><!-- HTML 文档的字符编码未声明。如果该文件包含 US-ASCII 范围之外的字符，该文件将在某些浏览浏览器配置中呈现为乱码。页面的字符编码必须在文档或传输协议层声明。-->
	<script type='text/javascript' src='jquery-1.10.2.min.js'></script>
	<script type="application/javascript;version=1.7">
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
			
			【array comprehensions 是 firefox explorer 所支持的，其它浏览器不支持的】
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
		console.log(interpolatedZeros = [c+'0' for (c of str) ].join('')); // 'a0b0c0d0e0f0'
		
		console.log('-------const-------');
		const stable = 'wd';
		stable = 'ch';// 不起作用，但也不会报错
		console.info(stable);
		
		console.log('-------let do not support now-------');
		
		var myObj = {name : 'ys', age : '20'};
		var iterator = Iterator(myObj);
		for(var it in iterator)
			console.info(it); // ["name", "ys"] ["age", "20"]
		iterator = Iterator(myObj, true);
		for(it in iterator)
			console.log(it);// name age
		//One advantage of using Iterator() to access the contents of an object is that custom properties that have been added to Object.prototype will not be included in the sequence.	
	
		var langs = ['JavaScript', 'C++', 'Python'];
		var collection = Iterator(langs);//Iterator(langs, true); 只会打印下标 0 1 2
		for(var pair in collection)
			console.info(pair);// [0, "JavaScript"] [1, "C++"] [2, "Python"]
			
		console.log('baidu'.link(" www.baidu.com "));
	
		/*
			Defining custom iterators
		*/
		console.log('----custom iterators-----');
		function Range(low, high){
		  this.low = low;
		  this.high = high;
		}
		
		function RangeIterator(range){
		  this.range = range;
		  this.current = this.range.low;
		}
		RangeIterator.prototype.next = function(){
		  if (this.current > this.range.high)
			throw StopIteration;
		  else
			return this.current++;
		};
		
		Range.prototype.__iterator__ = function(){
		  return new RangeIterator(this);
		}; // 如果没有实现这个接口，打印的结果会是 Range 对象内部的两个属性 low hight
		
		var range = new Range(3, 5);
		for (var i in range)
		  console.info(i); // prints 3, then 4, then 5 in sequence
		  
		  
		console.log('---Generators: a better way to build Iterators---');

		function simpleGenerator(){
		  yield "first";
		  yield "second";
		  yield "third";
		  for (var i = 0; i < 3; i++)
			yield i;
		}	
		var g = simpleGenerator();
		console.log(g.next());
	</script>
</html>	