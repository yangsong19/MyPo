<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type='text/javascript' src='../js/jquery-1.10.2.min.js'></script>
	<script type='text/javascript'>
		$(document).ready(function() {
			// Selecting elements by ID 
			$('#myId'); // note IDs must be unique per page
			// Selecting elements by class name 
			$('div .myClass'); // performance improves if you specify element type
			// Selecting elements by attribute 
			$('input[name=first_name]'); // beware, this can be very slow
			// Selecting elements by compound CSS selector 
			$('#contents ul.people li');
			// Pseudo-selectors 伪选择器
			$('a.external :first');
			$('tr :odd');
			$('#myForm :input');   // select all input-like elements in a form
			$('div :visible');
			$('div :gt()');         // all except the first three divs
			$('div :animated');     // all currently animated divs
			
			/*
				When you use the :visible and :hidden pseudo-selectors, jQuery tests the actual visibility of the element, 
				not its CSS visibility or display — that is, it looks to see if the element's physical height and width on 
				the page are both greater than zero. However, this test doesn't work with <tr> elements; in this case, jQuery 
				does check the CSS display property, and considers an element hidden if its display property is set to none. 
				Elements that have not been added to the DOM will always be considered hidden, even if the CSS that would 
				affect them would render them visible. (See the Manipulation section later in this chapter to learn how to 
				create and add elements to the DOM.) 
				
				【注意】在jQuery中运用 :hidden and :visible 这些伪选择器时，jQuery会检测这个元素的实际可视性，而不是其 CSS的
				visibility or display.那就是说，jQuery在审视这个元素在页面中的实际物理高宽是否大于零。但是，这个检测不对 <tr>
				元素生效;jQuery不会检查其 CSS 的 display 属性，如果其 display 属性被设置成 none,将被认为 hidden.至于那些没有被
				加载到 DOM 树上的元素，将被视为 hidden,即使 CSS 会将其渲染成 visible。（关于如何创建及添加元素到 DOM树，在本章
				后面 Manipulation 部分会有讲到。）
			
			
			if ( jQuery.expr && jQuery.expr.filters ) {
				jQuery.expr.filters.hidden = function( elem ) {
					// Support: Opera <= 12.12
					// Opera reports offsetWidths and offsetHeights less than zero on some elements
					return elem.offsetWidth <= 0 && elem.offsetHeight <= 0 ||
						(!jQuery.support.reliableHiddenOffsets && ((elem.style && elem.style.display) || jQuery.css( elem, "display" )) === "none");
				};

				jQuery.expr.filters.visible = function( elem ) {
					return !jQuery.expr.filters.hidden( elem );
				};
			} // 上面这段引用自 jquery-1.10.2.js 文件
			*/
			jQuery.expr.filters.hidden = function( elem ) {
				var width = elem.offsetWidth, height = elem.offsetHeight,
					skip = elem.nodeName.toLowerCase() === "tr";
		 
				// does the element have 0 height, 0 width,
				// and it's not a <tr>?
				return width === 0 && height === 0 && !skip ?
			 
					// then it must be hidden
					true :
			 
					// but if it has width and height
					// and it's not a <tr>
					width > 0 && height > 0 && !skip ?
			 
						// then it must be visible
						false :
			 
						// if we get here, the element has width
						// and height, but it's also a <tr>,
						// so check its display property to
						// decide whether it's hidden
						jQuery.curCSS(elem, "display") === "none";
			};
			 
			jQuery.expr.filters.visible = function( elem ) {
				return !jQuery.expr.filters.hidden( elem );
			};
			
			// find all <a>s whose rel attribute
			// ends with "thinger"
			$("a[rel$='thinger']");
			
			/*
				If you change your selection in the midst of a chain, jQuery provides the $.fn.end method to get you back to your original selection.
				Example : Restoring your original selection using $.fn.end
				=============================================================
			*/
			$('#content')
				    .find('h3')
				    .eq(2)
						.html('new text for the third h3!')
				    .end() // restores the selection to all h3's in #content
				    .eq(0)
						.html('new text for the first h3!');
						
			/*				
				Getters & Setters
				jQuery “overloads” its methods, so the method used to set a value generally has the same name as the method used to get a value. 
				When a method is used to set a value, it is called a setter. When a method is used to get (or read) a value, it is called a getter. 
				Setters affect all elements in a selection; getters get the requested value only for the first element in the selection. 
				
				Setters return a jQuery object, allowing you to continue to call jQuery methods on your selection; getters return whatever they were 
				asked to get, meaning you cannot continue to call jQuery methods on the value returned by the getter. 
				setters 会返回一个jQuery对象，允许你在选择的对象上继续调用jQuery方法;getters 会返回任何你请求得到的，意味着你不能继续调用 jQuery 方法
			*/		
			//Example 3.16: The $.fn.html method used as a setter
				$('h1').html('hello world');
			//Example 3.17: The html method used as a getter
				$('h1').html();
			/*
				CSS properties that normally include a hyphen need to be camel cased in JavaScript. For example, the CSS property font-size is expressed 
				as fontSize when used as a property name in JavaScript. This does not apply, however, when passing the name of a CSS property to the $.fn.css 
				method as a string — in that case, either the camel cased or hyphenated form will work.
				=============================================================
				在JavaScript中, CSS属性在需要用驼峰表示时通常会包含连字符。
			*/
			// Getting CSS properties
			$('h1').css('fontSize'); // returns a string such as "19px"
			$('h1').css('font-size'); // also works
			//Setting CSS properties
			$('h1').css('fontSize', '100px'); // setting an individual property
			$('h1').css({ 'fontSize' : '100px', 'color' : 'red' }); // setting multiple properties
			
			// Using CSS Classes for Styling 
			var $h1 = $('h1');			 
			$h1.addClass('big');
			$h1.removeClass('big');
			$h1.toggleClass('big');			 
			if ($h1.hasClass('big')) { ... }
			
			//The code in “Basic dimensions methods”, is just a very brief overview of the dimensions functionality in jQuery; for complete details about 
			//jQuery dimension methods, visit http://api.jquery.com/category/dimensions/. 
			$('h1').width('50px');   // sets the width of all H1 elements
			$('h1').width();         // gets the width of the first H1
			 
			$('h1').height('50px');  // sets the height of all H1 elements
			$('h1').height();        // gets the height of the first H1
			 
			$('h1').position();      // returns an object containing position
									 // information for the first H1 relative to
									 // its "offset (positioned) parent"
									 
			// Attributes 
			$('a').attr('href', 'allMyHrefsAreTheSameNow.html');
			$('a').attr({
			    'title' : 'all titles are the same too!',
			    'href' : 'somethingNew.html'
			});	
			$('a').attr('href');  // returns the href for the first a element in the document
			
			// Traversing | For complete documentation of jQuery traversal methods, visit http://api.jquery.com/category/traversing/. 
			$('h1').next('p');
			$('div:visible').parent();
			$('input[name=first_name]').closest('form');
			$('#myList').children();
			$('li.selected').siblings();
			
			$('#myList li').each(function(index, element) {
			    console.log(
			        'Element ' + index +
			        'has the following html: ' +
			        $(element).html()
			    );
			});
			
			/*
				Manipulating Elements 
				Once you've made a selection, the fun begins. You can change, move, remove, and clone elements. You can also create new elements via a simple syntax.
				For complete documentation of jQuery manipulation methods, visit http://api.jquery.com/category/manipulation/. 			
			*/
			// $.fn.html $.fn.text $.fn.attr $.fn.width $.fn.height $.fn.position $.fn.val
			$('#myDiv p:first')
	    		.html('New <strong>first</strong> paragraph!');
			/*				
				Moving, Copying, and Removing Elements
				There are a variety of ways to move elements around the DOM; generally, there are two approaches:
					【1】 Place the selected element(s) relative to another element
					【2】 Place an element relative to the selected element(s)
				通常有两种方法来移动 DOM 节点上的元素: 把这个被选中的元素放到以另外一个元素为参照的位置上;或者是以这个被选中的元素为参照。
				
				For example, jQuery provides $.fn.insertAfter and $.fn.after. The $.fn.insertAfter method places the selected element(s) after the element that you 
				provide as an argument; the $.fn.after method places the element provided as an argument after the selected element. Several other methods follow 
				this pattern: $.fn.insertBefore and $.fn.before; $.fn.appendTo and $.fn.append; and $.fn.prependTo and $.fn.prepend.
				
				The method that makes the most sense for you will depend on what elements you already have selected, and whether you will need to store a reference 
				to the elements you're adding to the page. If you need to store a reference, you will always want to take the first approach — placing the selected 
				elements relative to another element — as it returns the element(s) you're placing. In this case, $.fn.insertAfter, $.fn.insertBefore, $.fn.appendTo, 
				and $.fn.prependTo will be your tools of choice. 
				
				举个例子，jQuery 提供的 $.fn.insertAfter and $.fn.after 方法。$.fn.insertAfter 方法将你选中的元素放在你传进来的那个参数所代表的元素之后; $.fn.after
				方法反之。其它几个类似的方法如：$.fn.insertBefore and $.fn.before; $.fn.appendTo and $.fn.append; $.fn.prependTo and $.fn.prepend.
				
				用哪个方法取决于你所选中的那个元素，以及你是否想存储你将添加到页面的这个元素的引用。如果你需要存储这个引用，那你通常需要采用第一种方法 【1】- 把这个被选
			    中的元素放到以另外一个元素为参照的位置上 - 由于这个方法会返回你要取代的元素。在这种情况下， $.fn.insertAfter, $.fn.insertBefore, $.fn.appendTo, 
				and $.fn.prependTo 将会成为你的选择。
				
			*/
			// make the first list item the last list item
			var $li = $('#myList li:first').appendTo('#myList');
			 
			// another approach to the same problem
			$('#myList').append($('#myList li:first'));	// note that there's no way to access the list item that we moved, as this returns the list itself
			
			/*				
				Cloning Elements
				When you use methods such as $.fn.appendTo, you are moving the element; sometimes you want to make a copy of the element instead. In this case, you'll 
				need to use $.fn.clone first.

				Example : Making a copy of an element
				// copy the first list item to the end of the list
				$('#myList li:first').clone().appendTo('#myList');
				
				Note
				If you need to copy related data and events, be sure to pass true as an argument to $.fn.clone.

			*/
			
			/*				
				Removing Elements
				There are two ways to remove elements from the page: $.fn.remove and $.fn.detach. You'll use $.fn.remove when you want to permanently remove the selection 
				from the page; while the method does return the removed element(s), those elements will not have their associated data and events attached to them if you 
				return them to the page.

				If you need the data and events to persist, you'll want to use $.fn.detach instead. Like $.fn.remove, it returns the selection, but it also maintains the 
				data and events associated with the selection, so you can restore the selection to the page at a later time.
				
				Note
				The $.fn.detach method is extremely valuable if you are doing heavy manipulation to an element. In that case, it's beneficial to $.fn.detach the element
				from the page, work on it in your code, and then restore it to the page when you're done. This saves you from expensive "DOM touches" while maintaining 
				the element's data and events.

				If you want to leave the element on the page but simply want to remove its contents, you can use $.fn.empty to dispose of the element's inner HTML. 
				
				这段主要讲移除元素：
				$.fn.remove and $.fn.detach	这两种途径
				区别：前者在从页面中永久性移除你选中的元素时，将会把它返回，但是不包含其关联的数据和绑定的事件。后者将会在返回的对象中保留相关数据和事件，你可以保存下来，
				以备后用。因为 'DOM touches' 的维护代价相当昂贵。
				
				$.fn.empty 仅仅会移除其内容，但会保留元素标签。
				
			*/

			/*
				Creating New Elements 
				$('<p>This is a new paragraph</p>');
				$('<li class="new">new list item</li>');
				
				$('<a/>', {
				    html : 'This is a <strong>new</strong> link',
				    'class' : 'new',
				    href : 'foo.html'
				});
				
				Note that in the attributes object we included as the second argument, the property name class is quoted, while the property names text and href are not. 
				Property names generally do not need to be quoted unless they are reserved words (as class is in this case).
				注意，在第二个参数中的那些属性对象中，‘class’用引号引起来了，html,href没有，属性名通不需要被引起来，除非他们是保留的关键字。
				
				When you create a new element, it is not immediately added to the page. There are several ways to add an element to the page once it's been created. 
				当你创建了一个新的元素，它还没有立即被加入到页面。通常有几种方法可以在它们被创建的时候立即被加入到页面中来。
				
				var $myNewElement = $('<p>New element</p>');
				$myNewElement.appendTo('#content');
				 
				$myNewElement.insertAfter('ul:last'); // this will remove the p from #content!
				$('ul').last().after($myNewElement.clone());  // clone the p so now we have 2
				
				Creating and adding an element to the page at the same time
				$('ul').append('<li>list item</li>');
				
				Note
				The syntax for adding new elements to the page is so easy, it's tempting to forget that there's a huge performance cost for adding to the DOM repeatedly. 
				If you are adding many elements to the same container, you'll want to concatenate all the html into a single string, and then append that string to the 
				container instead of appending the elements one at a time. You can use an array to gather all the pieces together, then join them into a single string for appending.
					这段话是说考虑DOM操作带来的性能问题，以及一种解决思路
					var myItems = [], $myList = $('#myList');
					 
					for (var i=0; i<100; i++) {
					    myItems.push('<li>item ' + i + '</li>');
					}
					 
					$myList.append(myItems.join(''));
			*/
			
			/*
				Manipulating Attributes
				$('#myDiv a:first').attr('href', 'newDestination.html');
				
				$('#myDiv a:first').attr({
				    href : 'newDestination.html',
				    rel : 'super-special'
				});
				
				Using a function to determine an attribute's new value
				$('#myDiv a:first').attr({
				    rel : 'super-special',
				    href : function(idx, href) {
				        return '/new/' + href;
				    }
				});
				 
				$('#myDiv a:first').attr('href', function(idx, href) {
				    return '/new/' + href;
				});
			*/
		})			
	</script>
	<a href='javascript:void(0);' >baidu</a>
</html>