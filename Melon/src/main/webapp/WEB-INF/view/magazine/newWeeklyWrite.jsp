<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${path}/css/magazine/magazine-style.css"/>
	<script type="text/javascript" src="${path }/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${path }/js/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
	
	<script type="text/javascript">
		(function($) {
			$(function() {
				var oEditors = [];
				var classCnt = 1;
				
				// 에디터
				nhn.husky.EZCreator.createInIFrame({
					oAppRef: oEditors,
					elPlaceHolder: "content",
					//SmartEditor2Skin.html 파일이 존재하는 경로
					sSkinURI: "${path}/js/se2/SmartEditor2Skin.html",	
					htParams : {
						// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseToolbar : true,
						// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseVerticalResizer : true,		
						// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
						bUseModeChanger : true,			
						fOnBeforeUnload : function(){
							
						}
					}, 
					fCreator: "createSEditor2"
				});
				
				// submit 체크
				$("#boardSubmit").click(function(e) {
					oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
					$("#boardForm").submit();
				});
				
			});
		})(jQuery);
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/header.jsp" />
	
	<div class="wrap">	
		<div class="wrap2">	

			<form id="boardForm" action="${path}/magazine/doWrite" enctype="multipart/form-data">
				
				<div style="border: 1px solid silver;padding: 10px;height: ">
					<div style="border-bottom: 1px thin silver;margin-bottom: 10px;display: block;">
						<div style="float: left;"><span>제목:&nbsp;&nbsp;</span></div>
						<div><input type="text" id="subject"></div>
					</div>
					<div style="border-bottom: 1px thin silver;margin-bottom: 20px;display: block;">
						<div style="float: left;"><span>음악 파일 등록:&nbsp;&nbsp;</span></div>
						<div style="float: left;"><input type="file" name="file"></div>
					</div>
					<textarea id="content" name="content" style="width: 980px; min-height: 500px;"></textarea>
				</div>
				<input type="button" id="boardSubmit" value="등록">
			</form>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/view/footer.jsp" />
	
</body>
</html>