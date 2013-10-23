<html>
	<head>
		<title>Firebug Test</title>
		<script type="text/javascript" src="./jquery-1.10.2.min.js"></script>
		<script type="text/css">
			
		</script>
		<script type="text/javascript">
			/*$(function(){
				
					$('#btn').click(function(){
						alert('cki me');
					});
				
				function fb_monitor() {
					alert('hit it 1');
				}
				$('#btn').click(fb_monitor);
			});
			*/
			function fb_monitor(event) {
				event.defaultPrevented;
				alert('hit it 2');
			}
			
			function bar(){
				console.profile('Measuring time');
				foo();
				console.profileEnd();
            }
			function foo(){
				loop(1000);
				loop(100000);
				loop(10000);
			}
			function loop(count){
				for(var i=0; i<count; i++){}
            }
			
			
		</script>
	</head>
	<body>
		
			<p id="para">this is a paragraph</p>
			<input name="myText1" type="text" class="test_class" value="text1" />
			<input name="myText2" type="text" class="test_class" value="text2" />
			<input name="myText3" type="text" class="test_class" value="text3" />
			<input name="myText4" type="text" class="test_class" value="text4" />
		
			<input type='button' name='btn' value='monitor' id='btn' onclick='fb_monitor(this);'/>
			<input type='button' name='btn2' value='start' id='btn2' onclick='bar(this);'/>
		
	</body>
</html>