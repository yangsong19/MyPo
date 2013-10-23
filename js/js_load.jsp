<html>
	<head>
		<title>JS Loading</title>
		<script type="text/javascript" src="./jquery-1.10.2.min.js"></script>
		<script type="text/javascript">
			/*
				window.onload = function(){
					alert('loading1');
				};
				
				$().ready(function(){
					alert('loading2');
				});
			*/
			/*			
				上面那两种方法不建议使用	--->
				
				Unfortunately, the code doesn't run until all images are finished downloading, 
				including banner ads. To run code as soon as the document is ready to be manipulated, 
				jQuery has a statement known as the 【ready event】: 
											
				$(document).ready(function(){
					alert('loading3');
				});
				
				$(function(){	这是匿名写法
					alert('loading4');
				});
			*/
				$(document).ready(function(){
					$('a').on('click', function(event){
						if(event.cancelable)
							event.preventDefault();
						alert(event.cancelable + '-->' + event.target);
					}); 
				});
			/*
			
				jQuery.noConflict();
				
				运行这个函数将变量$的控制权让渡给第一个实现它的那个库。
				这有助于确保jQuery不会与其他库的$对象发生冲突。 
				在运行这个函数后，就只能使用jQuery变量访问jQuery对象。例如，在要用到$("div p")的地方，就必须换成jQuery("div p")。 
				注意:这个函数必须在你导入jQuery文件之后，并且在导入另一个导致冲突的库之前使用。当然也应当在其他冲突的库被使用之前，除非jQuery是最后一个导入的。

			*/
		</script>
	</head>
	<body>
		<div id="container">
			<ul id="list">
				<li><a href="http://www.baidu.com" target="_blank">Item #1</a></li>
				<li><a href="#">Item #2</a></li>
			</ul>
		</div>
		<div id="add">
			<input type="button" name="add" value="add" id="add" />
		</div>
	</body>
</html>