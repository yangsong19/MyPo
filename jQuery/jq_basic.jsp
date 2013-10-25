<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type='text/javascript' src='jquery-1.10.2.min.js'></script>
	<script type='text/javascript'>
		// Selecting elements by ID 
		$('#myId'); // note IDs must be unique per page
		// Selecting elements by class name 
		$('div.myClass'); // performance improves if you specify element type
		// Selecting elements by attribute 
		$('input[name=first_name]'); // beware, this can be very slow
		// Selecting elements by compound CSS selector 
		$('#contents ul.people li');
		// Pseudo-selectors 伪选择器
		$('a.external:first');
		$('tr:odd');
		$('#myForm :input');   // select all input-like elements in a form
		$('div:visible');
		$('div:gt()');         // all except the first three divs
		$('div:animated');     // all currently animated divs
		
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
	</script>
</html>