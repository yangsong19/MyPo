<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><!-- HTML 文档的字符编码未声明。如果该文件包含 US-ASCII 范围之外的字符，该文件将在某些浏览浏览器配置中呈现为乱码。页面的字符编码必须在文档或传输协议层声明。-->
	<script type='text/javascript' src='jquery-1.10.2.min.js'></script>
	<script type='text/javascript' >			
			var o1 = {};
			var o2 =new Object();
			
			function f1(){}
			var f2 = function(){}
			var f3 = new Function('str','console.info(str)');
		
			f3('aabb');   // aabb
			console.log('typeof {}:'+typeof {});	// object
			console.log('typeof {}.prototype:'+typeof {}.prototype);	// undefined
			console.log('typeof {}.__proto__:'+typeof {}.__proto__);	// object
			
			console.log('typeof Object:'+typeof Object);     //function
			console.log('typeof Function:'+typeof Function); //function
			console.log('typeof o1:'+typeof o1);   //object
			console.log('typeof o2:'+typeof o2);   //object
			console.log('typeof f1:'+typeof f1);   //function
			console.log('typeof f2:'+typeof f2);   //function
			console.log('typeof f3:'+typeof f3);   //function
			console.log('typeof Function:'+typeof Function);
			console.log('typeof null:'+typeof null);//object
			console.log('typeof undefined:'+typeof undefined);//undefined
			console.log('typeof NaN:'+typeof NaN);//number
			
			 function Animal(){
				
			}
			var  anim = new Animal();
			
			console.info('***********Animal anim proto*****************');
			console.log('typeof Animal.prototype:' +typeof Animal.prototype);  //object 
			console.log('anim.__proto__===Animal.prototype:'+(anim.__proto__===Animal.prototype));  //true
			console.log('Animal.__proto__===Function.prototype:'+(Animal.__proto__===Function.prototype));  //true
			console.log('Animal.prototype.__proto__===Object.prototype:'+(Animal.prototype.__proto__===Object.prototype));  //true
			
			console.info('***********Function proto*****************');
			console.log('typeof Function.prototype:'+typeof Function.prototype);  //function
			console.log('typeof Function.__proto__:'+typeof Function.__proto__);  //function
			console.log('typeof Function.prototype.prototype:'+typeof Function.prototype.prototype); //undefined
			console.log('typeof Function.prototype.__proto__:'+typeof Function.prototype.__proto__);   //object
			console.log('Function.prototype===Function.__proto__:'+(Function.prototype===Function.__proto__)); //true

			console.info('***********Object proto*****************');
			console.log('typeof Object.prototype:'+typeof Object.prototype);  //object
			console.log('typeof Object.__proto__:'+typeof Object.__proto__);  //function
			console.log('Object.prototype.prototype:'+Object.prototype.prototype);  //undefied
			console.log('Object.prototype.__proto__===null:'+(Object.prototype.__proto__===null));  //true

			console.info('***********Function Object  proto关系*****************');
			console.log('Function.prototype===Object.__proto__:'+(Function.prototype===Object.__proto__));   //true
			console.log('Function.__proto__===Object.__proto__:'+(Function.__proto__===Object.__proto__));   //true
			console.log('Function.prototype.__proto__===Object.prototype:'+(Function.prototype.__proto__===Object.prototype));   //true

			/********************* 系统定义的对象Array、Date ****************************/
			console.info('**************test Array、Date****************');      
			var array = new Array();
			var date = new Date();
			console.log('array.__proto__===Array.prototype:'+(array.__proto__===Array.prototype));   //true
			console.log('Array.__proto__===Function.prototype:'+(Array.__proto__===Function.prototype));  //true
			console.log('date.__proto__===Date.prototype:'+(date.__proto__===Date.prototype));    //true
			console.log('Date.__proto__===Function.prototype:'+(Date.__proto__===Function.prototype));     //true
			
			console.info('**************constructor****************'); 

			console.log('anim.constructor===Animal:'+(anim.constructor===Animal))    ;    //true
			console.log('Animal===Animal.prototype.constructor:'+(Animal===Animal.prototype.constructor))    ;    //true
			console.log('Animal.constructor===Function.prototype.constructor:'+(Animal.constructor===Function.prototype.constructor));   //true
			console.log('Function.prototype.constructor===Function:'+(Function.prototype.constructor===Function));    //true
			console.log('Function.constructor===Function.prototype.constructor:'+(Function.constructor===Function.prototype.constructor));    //true

			console.log('Object.prototype.constructor===Object:'+(Object.prototype.constructor===Object));    //true
			console.log('Object.constructor====Function:'+(Object.constructor===Function));    //true  ************ important **********
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