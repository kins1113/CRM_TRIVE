<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>차량 추가</title>
<style type="text/css">
label.carLabel {
    float: right;
    margin: 1px  10px;
    font-weight: normal;
    font-size: 15px;
}
input.carInput {
    min-height: 22px;
    min-width: 150px;}
table {
   width: 80%;
    margin: 0 auto;
    background:white;
}
body {background: #9e9e9e14;}
input[type="button"], input[name=carAdd] {
    float: right;
    padding: 3px 15px;
}
input[name=cancle] {
    margin: 4px 48px 0 0;
}
input[name=carAdd] {
    margin: 4px 15px 0 0;
}
select.carSelect {
    height: 30px;
    font-size: 0.9em;
    min-width: 174px;
}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<script type="text/javascript">
$(function(){
    $("#REGDATE").datepicker({   
    	dateFormat: 'yy-mm-dd'
    });
});
</script>
</head>
<body>
<form name="carAddForm" method="post" action="<c:url value='/carinfo/insertCarinfo.do'/>">
	<table>
	<tr><th colspan="2">차량 등록</th></tr>
		<c:forEach var="carName" items="${carNameList}">
			<tr>
				<c:if test="${carName['COLUMN_NAME'] ne 'NO'}">
			
					<c:if test="${carName['COLUMN_NAME'] eq 'SHOWCK'}">
						<th><label class="carLabel" for="${carName['COLUMN_NAME']}">${carName['COMMENTS']}</label></th>
						<td>
							<label class="radioLabel"><input class="radioInput" type="radio" name="${carName['COLUMN_NAME']}" value="0"/>출력</label>
							<label class="radioLabel"><input class="radioInput" type="radio" name="${carName['COLUMN_NAME']}" value="1"/>미출력</label>
						</td>
					</c:if>
					<c:if test="${carName['COLUMN_NAME'] eq 'REGDATE'}">
						<th><label class="carLabel" for="${carName['COLUMN_NAME']}">${carName['COMMENTS']}</label></th>
						<td><input class="carInput" type="text" id="${carName['COLUMN_NAME']}" name="${carName['COLUMN_NAME']}" readonly /></td>
					</c:if>
					<c:if test="${carName['COLUMN_NAME'] eq 'FUELTYPE'}">
						<th><label class="carLabel" for="${carName['COLUMN_NAME']}">${carName['COMMENTS']}</label></th>
						<td>
							<select class="carSelect" name="${carName['COLUMN_NAME']}">
								<option value="2">휘발유</option>
								<option value="1">경유</option>
								<option value="0">LPG</option>
								<option value="3">하이브리드</option>
								<option value="4">전기차</option>
							</select>
						</td>
					</c:if>
					<c:if test="${carName['COLUMN_NAME'] ne 'SHOWCK' and carName['COLUMN_NAME'] ne 'FUELTYPE' and carName['COLUMN_NAME'] ne 'REGDATE'}">
						<th><label class="carLabel" for="${carName['COLUMN_NAME']}">${carName['COMMENTS']}</label></th>
						<td><input class="carInput" type="text" id="${carName['COLUMN_NAME']}" name="${carName['COLUMN_NAME']}" /></td>
					</c:if>
				</c:if>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="2"> 
				<input type="button" name="cancle" value="취소"/>
				<input type="submit" name="carAdd" value="등록"/>
			</td>
		</tr>
	</table>
</form>

</body>
</html>