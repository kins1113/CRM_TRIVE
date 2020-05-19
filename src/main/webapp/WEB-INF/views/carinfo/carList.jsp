<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/WEB-INF/views/inc/top.jsp"%>
<style type="text/css">
.divPage {padding-left: 40%;}
input#searchKeyword {width: 200px;float: left;}
input.btn.btn-outline-dark {height: 34px;margin: 0 5px;padding: 3px 18px 1px 18px;border: 1px solid silver;}
input[name=carAdd], input[name=carDel], input[name=carManager], input[name=carinfoTA]{height: 34px;margin: 0 5px;padding: 3px 18px 1px 18px;border: 1px solid silver;float: right}
select#searchCondition {height: 34px;float: left;margin-right: 5px;border: 1px solid silver;}
select#recordCountPerPage {height: 34px;float:right;margin-right: 5px;border: 1px solid silver;width: 97px;padding-left: 6px;}
form[name=userform] {margin-bottom: 5px;}
#layerpop { position:fixed; top:50%; left:50%; transform: translate(-50%,-50%); }
.modal-body th {float: right;margin:5px 15px;}
.modal-body select {height: 32px;width: 71px;}
input.addinput {width: 100%;}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		//모든 td에 값 변경
		$("#example td").each(function(){
			$(this).dblclick(function(){
				var thisval=$(this).text();
				alert("더블클릭 이벤트 thisval="+thisval);
				$(this).html("<input type='text' class='addinput' value='"+thisval+"'/>")
			});
		});
		
		//추가 버튼 
		/* $("#carAdd").click(function(){
			var tdObj=$('<tr><td><input type="checkbox" name="check"></td><c:forEach var="carNameLeal" items="${carNameLealList}"><c:set var="carNameLealVar" value="${carNameLeal['COLUMN_NAME']}"></c:set><td><input type="text" name="${carNameLeal['COLUMN_NAME']}" class="addinput"/></td></c:forEach></tr>');
			 	tdObj.html("<input type='text'/>")
			var trObj=$('<tr><tr>');
			for(var i=0;i<${fn:length(carNameLealList)};i++){
					trObj.append(tdObj);
				} 
			$("#example tbody").append(tdObj);
		});	 */
		//삭제 버튼
		$("input[name=carDel]").click(function(){
			alert("삭제버튼");
		})	
		//관리 버튼
		$("input[name=carManager]").click(function(){
			location.href="<c:url value='/carManager.do'/>"
		})	
		
		//출력 더블클릭
			 $(".showck").dblclick(function(){
				var no= $(this).parent().parent().children('td').eq(1).text();
				var showck=$(this).text();
				//alert("no="+no+", showck="+showck);
				var thisOB=$(this);	
				$.ajax({
					url:"<c:url value='/carinfoShowckChange.do'/>",
					type:"post",
					data:{"no":no,"showck":showck},
					success:function(rel){
						if(rel >0){
							if(showck=="출력"){
								thisOB.html("미출력");
							}else {
								thisOB.html("출력");
							}
						}
					},error:function(xht,status,error){
						alert(status+" : "+error);
					}
				})//ajax
			}) 
		//항목 추가 버튼 carinfoTA
		$("input[name=carinfoTA]").click(function(){
			  $('#layerpop').modal();
		})
		//항목 추가 버튼 carinfoTA
		$("#carAdd").click(function(){
			window.open('<c:url value="/carinfo/showLayer.do"/>',
					'CarAdd',"'status=no, height=500, width=500, left='300', top='30");
		})
	})
	
//페이지 처리 함수
function pageFunc(curPage){
	$("input[name=currentPage]").val(curPage);
	$("form[name=userform]").attr("action","<c:url value='carList.do'/>");
	$("form[name=userform]").submit();
}
</script>
				 <div class="row">
                    <!-- ============================================================== -->
                    <!-- data table rowgroup  -->
                    <!-- ============================================================== -->
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0">차량 정보 </h5>
                                <p>차량정보 화면</p>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                <div>	
                                	<form name="userform" action="<c:url value='/carList.do'/>">
                                		<input type="hidden" name="currentPage"/>
                                		<select name="searchCondition" id="searchCondition">
                                			<option value="ALL">전체</option>
                                		</select>
                                		<input type="text" class="form-control" name="searchKeyword" id="searchKeyword"/>
                                		<input type="submit" class="btn btn-outline-dark" name="searchbt" value="검색"/>
                                		<input type="button" class="btn btn-outline-dark" name="carinfoTA" value="항목추가">
                                		<input type="button" class="btn btn-outline-dark" name="carManager" value="관리"/>
                                		<input type="button" class="btn btn-outline-dark" name="carDel" value="삭제"/>
                                		<input type="button" class="btn btn-outline-dark" id="carAdd" name="carAdd" value="추가">
                                		<select name="recordCountPerPage" id="recordCountPerPage">
                                			<option value="15">15개씩</option>
                                			<option value="30">30개씩</option>
                                			<option value="50">50개씩</option>
                                			<option value="100">100씩</option>
                                		</select>
                                	</form>
                                </div>
                                    <table id="example" class="table table-striped table-bordered" style="width:100%">
                                        <thead>
                                            <tr>
                                            	<th><input type="checkbox" name="checkAll"></th>
                                            	<c:forEach var="carName" items="${carNameList}">
                                            		<th>${carName['COMMENTS']}</th>
                                            	</c:forEach>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:if test="${!empty carList }">
                                        	<c:forEach var="carinfoVO" items="${carList}">
                                        		<tr>
                                        			<td><input type="checkbox" name="check"></td>
                                        			<c:forEach var="carNameLeal" items="${carNameLealList}">
                                        				<c:set var="carNameLealVar" value="${carNameLeal['COLUMN_NAME']}"></c:set>
                                        				<td>${carinfoVO[carNameLealVar] }</td>
                                        			</c:forEach>
                                        		</tr>
                                        	</c:forEach>
                                        </c:if>
                                        <c:if test="${empty carList }">
                                        	<tr>
                                        		<td colspan="13">정보가 없습니다....</td>
                                        	</tr>
                                        </c:if>
                                        </tbody>
                                        <tfoot id="carListTfoot">
                                         
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
							  <div class="divPage" align="center">
							    <nav aria-label="Page navigation example">
								 <ul class="pagination">
								<!-- 이전블럭으로 이동하기 -->
								<c:if test="${pagingInfo.firstPage>1 }">
                                                    <li class="page-item">
                                                        <a class="page-link" href="#" aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span>      </a>
                                                    </li>
									<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"> 
										alt="이전블럭으로 이동">
									</a>
								</c:if>
								<!-- 페이지 번호 추가 -->
								<!-- [1][2][3][4][5][6][7][8][9][10] -->
								<c:forEach var="i" begin="${pagingInfo.firstPage }"
									end="${pagingInfo.lastPage }">
									<c:if test="${i==pagingInfo.currentPage }">
										 <li class="page-item"><span class="page-link" style="color:#3187d0" onclick="pageFunc(${i})">${i}</span></li>
									</c:if>
									<c:if test="${i!=pagingInfo.currentPage }">
										 <li class="page-item"><a class="page-link" href="#" onclick="pageFunc(${i})">${i}</a></li>
									</c:if>
								</c:forEach>
								<!--  페이지 번호 끝 -->
			
								<!-- 다음 블럭으로 이동하기 -->
								<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
									  <li class="page-item">
                                           <a class="page-link" href="#" aria-label="Next" onclick="pageFunc(${pagingInfo.lastPage+1})"><span aria-hidden="true">&raquo;</span>
                                              <span class="sr-only">Next</span></a>
                                       </li>
								</c:if>
								</ul>
                               </nav>
							</div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end data table rowgroup  -->
                    <!-- ============================================================== -->
                </div>
</div>
</div>
 <!-- ============================================================== -->
 <!-- start model carinfo 컬럼 변경  -->
 <!-- ============================================================== -->
		<div class="modal fade" id="layerpop">
			<div class="modal-dialog">
				<form name="carColumnAddForm" method="post"
					action="<c:url value='carColumnAdd.do'/>">
					<div class="modal-content">
						<!-- header -->
						<div class="modal-header">
							<!-- header title -->
							<h4 class="modal-title">항목 추가</h4>
							<!-- 닫기(x) 버튼 -->
							<button type="button" class="close" data-dismiss="modal">×</button>
						</div>
						<!-- body -->
						<div class="modal-body">
		
							<table>
								<tr>
									<th>항목 명(한글)</th>
									<td><input type="text" name="colNameKR" /></td>
								</tr>
								<tr>
									<th>항목 명(영어)</th>
									<td><input type="text" name="colNameEN" /></td>
								</tr>
								<tr>
									<th>타입</th>
									<td>
										<select name="colType">
											<option value="VARCHAR">문자</option>
											<option value="NUMBER">숫자</option>
											<option value="VARCHAR">날짜</option>
										</select>
										<input type="text" name="colSize"/>
									</td>
								</tr>
							</table>
						</div>
						<!-- Footer -->
						<div class="modal-footer">
							<button type="submit" class="btn btn-default">확인</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						</div>
				</form>
			</div>
		</div>

		
</div>




<%@include file="/WEB-INF/views/inc/bottom.jsp"%>
