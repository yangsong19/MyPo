String.prototype.trim = function() { 
	return this.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
}
function validateForm(form_1) {
	var kwd=form_1.keywords.value;
	if(kwd.trim().length == 0) {
		alert("terms is blank,please enter the terms!");
		return false;
	} else {
		return true;
	}
}
function validateForm1(form_1) {
   var kwd = form_1.keywordsnew.value;
   if(kwd.trim().length == 0) {
		alert("terms is blank,please enter the terms!");
		return false;
   } else {
		return true;
   }
}
function validateForm2(form_1) {
   var qid = form_1.quickid.value;
   if(qid.trim().length == 0) {
     alert("id is blank,please enter the value!");
     return false;
   } else {
      return true;
   }
}
function cleanValue(keywordsid) {
   document.getElementById('text_'+keywordsid).value = '';
}
function query(keywordsid) {
   var playlist = document.getElementById('playlist_'+keywordsid);
 
   var channel = document.getElementById('channel_'+keywordsid);
   if(playlist.checked){
	   openPage('text_'+keywordsid,'/hs/HSShowPlaylist?flag=show');
   }else if(channel.checked){
	  openPage('text_'+keywordsid,'queryChannel.jsp');
   } else {
	  alert("please select playlist or channel!");
   }
}
function openPage(id,url) { 
	var ret = window.showModalDialog(url,"","dialogWidth:700px;dialogHeight:500px");
	if(ret != null){
	  document.getElementById(id).value = ret;
   }
}  
function keywordupdate(keywordsId) {
   var radioId = "radio_"+keywordsId;
   alert(radioId);
   var radioValue=document.getElementById(radioId)[0].checked;
   
   alert(radioValue);
   return false;
}
function getXMLHttpRequest() {
        var xmlhttp;
		if (window.XMLHttpRequest) {
			try {
				xmlhttp = new XMLHttpRequest();
				xmlhttp.overrideMimeType("text/html;charset=UTF-8");
			} catch (e) {}
		} else if (window.ActiveXObject) {
			try {
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
				try {
					xmlhttp = new ActiveXObject("Msxml2.XMLHttp");
				} catch (e) {
					try {
						xmlhttp = new ActiveXObject("Msxml3.XMLHttp");
					} catch (e) {}
				}
			}
		}
        return xmlhttp;
}
function send_request(callback, urladdress, isReturnData){      
        var xmlhttp = getXMLHttpRequest();
        xmlhttp.onreadystatechange = function(){
            	if (xmlhttp.readyState == 4) {//readystate 
 				    try{
				    	if(xmlhttp.status == 200){
							if(isReturnData && isReturnData==true){
								callback(xmlhttp.responseText);
							}
						}else{
							callback("sorry,page is't exist:"+ urladdress +"");
						}
			        } catch(e){
			        	callback("sorry,sending request is failed" + e);
			        }
			   }
        }
        xmlhttp.open("GET", urladdress, true);
        xmlhttp.send(null);
}
function getChannel(){
		var Channeldiv = document.getElementById('result');	
		var channelName = document.getElementById('channelName').value;	
		if(Channeldiv){
			Channeldiv.innerHTML= "data is loading...";
			send_request(function(value){Channeldiv.innerHTML=value},
					 "ShowChannel?channelName="+channelName+"&toolid=${toolid}", true);
		}
	}
function showChannelbyFirstname(channelName){
		var Channeldiv = document.getElementById('result');	
		if(Channeldiv){
			Channeldiv.innerHTML= "data is loading...";
			send_request(function(value){Channeldiv.innerHTML=value}, 
					 "ShowChannel?channelName="+channelName+"&toolid=${toolid}", true);
		}
	}	
function selectChannel(channelId){
	      window.returnValue=channelId;
	      window.close();
}

function selectContent(cid, date){
	      window.returnValue=cid + "." + date;
	      window.close();
}	
	