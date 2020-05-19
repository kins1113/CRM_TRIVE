<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/WEB-INF/views/inc/top.jsp"%>
<style type="text/css">
label.custom-control.custom-checkbox {float: left;margin-right: 30px;}
#carManagerTB th:nth-of-type(1) {width: 10px}
#carManagerTB th:nth-of-type(2) {width: 130px}
#carManagerTB th:nth-of-type(3) {width: 100px}
#carManagerTB th:nth-of-type(4) {width: 50px}
#carManagerTB th:nth-of-type(5) {width: 50px}
button.carColDelBT {padding: 1px;font-size: 11px;margin: 0;color: #ffffff9e;background: #0000005c;border: 0;}
input.form-control {margin: 3px;}
select.form-control {margin: 3px;}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		//목록으로
		$("#carListGoBT").click(function(){
			location.href="<c:url value='/carList.do'/>"
		})
		//컬럼 삭제
		$(".carColDelBT").each(function(i){
			var thisOj=$(this);
			$(this).click(function(){
				var colName=$(this).parent().parent().find("td").eq("2").text();
				if(confirm("삭제하면 복구할 수 없습니다. 그래도 삭제하시겠습니까...?")){
					if(confirm("정말 "+colName+"을 삭제하시겠습니까..?")){
						$.ajax({
							url:"<c:url value='/carColumnDel.do'/>",
							type:"post",
							data:{"colName":colName},
							success:function(re){
								alert("삭제 했습니다.");
								thisOj.parent().parent().hide();
							},error:function(xht,status,error){
								alert(status+" : "+error);
							}
						})//ajax
					}
				}
			})
		})
	});
</script>
<div class="row">
	<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
		<div class="card">
			<div class="card-body">
				<h3>차량 항목 관리</h3>
				<table class="table table-hover" id="carManagerTB">
					<thead>
						<tr>
							<th></th>
							<th>항목 명(한글)</th>
							<th>항목 명(영어)</th>
							<th>항목 타입</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="count" value="0"></c:set>
						<c:forEach var="carCol" items="${carColList }">
							<tr>
								<td><input type="checkbox" name="check" /></td>
								<td>${carCol['COMMENTS']}</td>
								<td>${carCol['COLUMN_NAME']}</td>
								<td>${carCol['DATA_TYPE']}</td>
								<td>
									<button class="btn btn-space btn-secondary carColDelBT" type="button" >삭제</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>


	<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
		<div class="card">
			<h5 class="card-header">옵션 추가</h5>
			<form id="form" action="<c:url value='/carColumnAdd.do'/>" method="post">
			<input type="hidden" name="pageInfo" value="carManager.jsp"/>
			<div class="card-body">
					<table>
						<tr>
							<th>항목 명(한글)</th>
							<td><input type="text" name="colNameKR"
								placeholder="항목 명(한글)" class="form-control" /></td>
						</tr>
						<tr>
							<th>항목 명(영어)</th>
							<td><input type="text" name="colNameEN"
								placeholder="항목 명(영어)" class="form-control" /></td>
						</tr>
						<tr>
							<th>타입</th>
							<td>
								<select name="colType" class="form-control">
										<option value="VARCHAR">문자</option>
										<option value="NUMBER">숫자</option>
										<option value="VARCHAR">날짜</option>
								</select> 
								<input type="text" name="colSize" class="form-control" />
							</td>
						</tr>
					</table>
					<button type="submit" class="btn btn-space btn-primary">추가</button>
					<button class="btn btn-space btn-secondary">취소</button>
					<button class="btn btn-space btn-secondary" type="button" id="carListGoBT">목록으로</button>
			</div>
			</form>
		</div>
	</div>
</div>
</div>
<%@include file="/WEB-INF/views/inc/bottom.jsp"%>