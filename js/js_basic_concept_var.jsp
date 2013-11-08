<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><!-- HTML 文档的字符编码未声明。如果该文件包含 US-ASCII 范围之外的字符，该文件将在某些浏览浏览器配置中呈现为乱码。页面的字符编码必须在文档或传输协议层声明。-->
	<script type='text/javascript' src='jquery-1.10.2.min.js'></script>
	<script type='text/javascript' >
	
		/*
			The difference is that a declared variable is a non-configurable property of the global object while an undeclared is configurable.
			全局的一个声明的变量是一个不可配置的属性，而未声明的变量则是可配置的。
		*/
		var a = 1;
		b = 2;   //  

		console.info(this);  
		console.log(a,b); // 1 2
		delete this.a;    // Throws a TypeError in strict mode. Fails silently otherwise.
		delete this.b;

		console.info(this);
		console.log(a);    // 1
		//console.log(b);    // Throws a ReferenceError. Since the 'b' property doesn't exist in the global object,
						   // the 'b' variable stops being a variable
		// 总结：Consequently, it is recommended to always declare your variables, regardless of being in the global scope or in a function
		//	【【【【【【所以呢，强烈建议你去声明一个变量，无论是在全局作用域，还是在一个函数体中】】】】】】
		
		/*var cells = document.getElementsByTagName('td');
		
		for(var i=0; i<cells.length; i++){
			  var cell = cells[i];
			  cell.addEventListener('click', function(){
					cell.style.backgroundColor = '#00F'; // which 'cell' ?
			  }, false);
		}
		*/

		//	var hoisting	变量挂起
		$(document).ready(function() {
			
			var cells = $('td');
			console.info(cells);
			/*
			for(cell in cells) {
				  //cell.addEventListener('click', function() {
					//	cell.style.backgroundColor = '#00F';
				  //}, false);
				  console.log(cell); // 这种会更糟糕，会将 cells 里面的所有属性和方法全部列出
			}
			
			
			for(var i=0; i<cells.length; i++) {
				  var cell = cells[i];
				  console.log(cell);
				  cell.addEventListener('click', function() {
						cell.style.backgroundColor = '#00F';
				  }, false);
			} 或者
			var i, cell;
			for(i=0; i<cells.length; i++) {
				  cell = cells[i];
				  console.log(cell);
				  cell.addEventListener('click', function() {
						cell.style.backgroundColor = '#00F';
				  }, false);
			}
				会有闭包问题
				The 'cell' captured in the event listener is the global 'cell' variable which, at the end of the loop contains the last cell 
				traversed in the loop. Consequently, clicking on any cell will only affect the last cell.
				在事件监听器中被捕获的 ‘cell’ 是全局的 ‘cell’ 变量,包含循环遍历最后那个 ‘cell’ 。随之而来的结果是，当点击任何一个 ‘cell ’时仅仅会影响最后那个 ‘cell’。
			*/
			
			/*
			//var i, cell;
			$.each(cells, function(idx, cell) {
				cell.addEventListener('click', function() {
						cell.style.backgroundColor = '#00F';
				  }, false);
			});
				$.each 可以规避闭包问题
			*/
			/*
				Within its current scope, regardless of where a variable is declared, it will be, behind the scenes, hoisted to the top. 
				However, only the declaration will be hoisted. If the variable is also initialized, the current value, at the top of the 
				scope, will initially be set to undefined.

				【1】 var joe; // the declaration	这个操作叫声明
				【2】 joe = 'plumber'; // the initialization 	这个操作叫初始化
			    【3】 instantiation 实例化，这个概念和类及对象相关
				
				一个变量无论在哪儿被【声明】，在其【当前作用域】，将会被挂起到这个作用域的最顶层。然而仅仅【只有声明】会被挂起,如果这个变量
				也被【初始化】了，那么在这个作用域的最顶层，其当前值会被自动初始化为 undefined
			*/
			
			  
			var hoist = 'incredible';
			(function() {
				console.log(hoist);//如果没有下面这行则  incredible, 如果有下面这行则  undefined ,如果没有函数体外面的 var hoist = 'incredible'; 直接就报错--- ReferenceError: hoist is not defined
				var hoist = 'escaping'; // hoist = 'escaping';  特别注意这是个声明加赋值，如果仅仅是个赋值语句，效果大不相同
			})();
			console.log(hoist);
			
			/*
				It should now make perfect sense why myvar is alerting undefined. As we learned, as soon as the local variable, myvar, was declared, 
				it was automatically hoisted to the top of the function scope…above the alert. As a result, the variable had already been declared 
				at the time of the alert; however, because initializations aren’t hoisted as well, the value of the variable is: undefined.
				
				现在对于为什么会打印出 undefined ，我们可以来清楚的表述一下了。局部变量 myvar 一旦被【声明】，它将被挂起到这个函数作用域的最顶层，
				在打印语句上面。结果，这个变量在打印语句被调用时已经被声明过了，然而，由于【初始化】不会被挂起，所以这个变量的值最终是 undefined
				
				Note that what’s exemplified above is considered to be bad practice. Nonetheless, behind the scenes, all of those variable declarations — 
				regardless of where they occur in the function scope — will be hoisted to the top
				特注：正如上面被证实的那样，那样操作无疑是很糟糕的。在这样的一种背景下，所有变量的声明，无论它们出现在函数体作用域的什么位置，一律被
				挂起到函数作用域最顶层。
			*/
			

		});
	</script>
	<body>
		<table>
			<tr id='tr1'>
				<td id='td1'>td1</td>
				<td id='td2'>td2</td>
				<td id='td3'>td3</td>
			</tr>
		</table>	
	</body>
</html>	