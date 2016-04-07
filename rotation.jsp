<html>
<head>
    <title>3D Transforms</title>
<style>
.view {
    position:absolute; left:300; top:300;
    -webkit-perspective:800px;
    -webkit-transform-style: preserve-3d;
    -webkit-transition: -webkit-transform 1s;
}
.axis {
    font: 18pt helvetica bold;
    background: -webkit-linear-gradient(top left, #f0f0f0, rgba(0,0,0,0.5));
    position: absolute; left: -280px; top: 0px; width:500;
}
.face {
    background: -webkit-radial-gradient(white,beige 20%, beige 60%, black);
    border: 1px solid black;
    height:100px; width:100px;
    position:absolute; left:-80px; top:30px;
}
#top {
    -webkit-transform-origin: 50% 100%;
    -webkit-transition: -webkit-transform 1s;
}
.ball {
    position:absolute; left:-55px; top: 25px;
    height:50; width:50; border-radius:25;
    background: -webkit-radial-gradient(30 30, white, red 20%, black);
    -webkit-transform: translateZ(50px) rotateX(90deg) translateY(10px);
}
p { padding:28;}
</style>
<script type="text/javascript">
function setXY() {
    var xRot = document.getElementById("xSlide").value;
    var yRot = document.getElementById("ySlide").value;
    var tString="rotateX("+xRot+"deg) rotateY("+yRot+"deg)";
	//var tString = "matrix(1,0,0.5,-1.5,0,0)";

    document.getElementById("view").style.webkitTransform=tString;
	document.getElementById("Front").style.webkitTransform="rotate(90deg)";
}
function openBox() {
    document.getElementById('top').style.webkitTransform = 'translateY(-100px) rotateX(90deg)';
}
function closeBox() {
    document.getElementById('top').style.webkitTransform = 'translateY(-100px) rotateX(-90deg)';
}
</script>
</head>
 
<body onload="setXY();">
<h2>This page contains no images.</h2>
<div class="view" id="view">
    <div class="axis"> X Axis </div>
    <div class="axis" style="-webkit-transform: rotate(90deg);"> Y Axis </div>
    <div class="axis" style="-webkit-transform: rotateY(-90deg);"> Z Axis </div>
 
    <div class="face"><p>Back</p></div>
    <div class="face" style="-webkit-transform: translateZ(100px);" id="Front">
         <p>Front</p></div>
    <div class="face"
         style="-webkit-transform: translateZ(50px) translateX(50px) rotateY(90deg);">
         <p>Right</p></div>
    <div class="face"
         style="-webkit-transform: translateZ(50px) translateX(-50px) rotateY(-90deg);">
         <p>Left</p></div>
    <div class="ball"></div>
    <div class="face"
         style="-webkit-transform: translateY(50px) translateZ(50px) rotateX(90deg);">
         <p>Bottom</p></div>
    <div class="face" id="top" style="-webkit-transform: translateY(-100px) ;">
         <p>Top</p></div>
</div>
<br>RotateX: <input id="xSlide" type="range"
                    min="-180" max="180" step="5" value="-40" onchange="setXY()">
<br>RotateY: <input id="ySlide" type="range"
                    min="-180" max="180" step="5" value="40" onchange="setXY()">
<p><input type="button" value="Open" onclick="openBox();">
   <input type="button" value="Close" onclick="closeBox();">
</p>
</body>
</html>