<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<html>
<head>
<title>${fns:getConfig('productName')}</title>
<%@include file="/WEB-INF/views/common/include.jsp"%>
<style type="text/css">
	.nav li{margin-top:8px;}.nav li.title{margin-top:0;}.nav li.menu,.nav li.dropdown{margin:8px 3px 0 3px}
	.nav li.menu a{padding:5px 6px;*padding:4px 5px 3px 5px;}.nav li.dropdown a{padding:5px 6px;*padding:1px 5px 3px 5px;}
	.nav li a{font-size:14px;padding:6px 8px;*padding:3px 8px;}
</style>
<script type="text/javascript"> 
	$(document).ready(function() {
		$("#menu a.menu").click(function(){
			$("#menu li.menu").removeClass("active");
			$(this).parent().addClass("active");
		});
	});
</script>
</head>
<body>
	<div id="main" class="container-fluid">
	    <div id="header" class="row-fluid">
			<div id="title">
				<span class="pull-right">您好, 
			    	<a target="mainFrame">Crazy/Y</a> | <a href="${ctx}/logout">退出</a> | <a >访问网站</a>
					&nbsp;&nbsp;&nbsp;
				</span>
		    	<ul class="nav nav-pills" style="margin:0;" id="menu">
		    	  <li class="title"><h1>${fns:getConfig('productName')}<small></small></h1></li>
				  <li style="width:18px;">&nbsp;</li>
				  <c:set var="firstMenu" value="true"/><c:forEach items="${fns:getMenuList()}" var="menu" varStatus="idxStatus"><c:if test="${not empty menu.parent and empty menu.parent.parent}">
					<li class="menu ${firstMenu?' active':''}"><a class="menu" href="${ctx}/sys/menu/tree?parentId=${menu.id}" target="menuFrame" >${menu.name}</a></li>
				  <c:if test="${firstMenu}"><c:set var="firstMenuId" value="${menu.id}"/></c:if><c:set var="firstMenu" value="false"/></c:if></c:forEach>
				</ul>
			</div>
		</div>
		<div id="content" class="row-fluid">
			<div id="left">
				<iframe id="menuFrame" name="menuFrame" src="${ctx}/sys/menu/tree?parentId=${firstMenuId}" style="overflow:visible;"
					scrolling="yes" frameborder="no" width="100%" height="650"></iframe>
			</div>
			<div id="openClose" class="close">&nbsp;</div>
			<div id="right">
				<iframe id="mainFrame" name="mainFrame" style="overflow:visible;"
					scrolling="yes" frameborder="no" width="100%" height="650"></iframe>
			</div>
		</div>
	    <div id="footer" class="row-fluid">
            Copyright &copy; 2012-${fns:getConfig('copyrightYear')} <a href="http://thinkgem.iteye.com" target="_blank">ThinkGem</a> - Powered By <a href="https://github.com/thinkgem/jeesite" target="_blank">JeeSite</a> ${fns:getConfig('version')}
		</div>
	</div>
	<script type="text/javascript"> 
		var lw = "14.89%", rw = "82.97%"; // 左侧窗口展开大小
		var lwClose = "0%", rwClose = "97.58%"; // 左侧窗口折叠大小
		function wSize(){
			var strs=getWindowSize().toString().split(",");
			if(strs[0]<550){
				$("#main").css("height",550);
				$("#openClose").height(strs[0]);
			}else{
				$("#menuFrame, #mainFrame, #openClose").height(strs[0]-$("#header").height() - $("#footer").height() - 80);
				$("#openClose").height($("#openClose").height()-6);
			}
			if(strs[1]<980){
				$("#main").css("width",970);
				$("html").css("overflow-x","auto");
			}else{
				$("#main").css("width","auto");
				$("html").css("overflow-x","hidden");
			}
		}
	</script>
	<script src="${ctxStatic}/wsize.js" type="text/javascript"></script>
</body>
</html>
