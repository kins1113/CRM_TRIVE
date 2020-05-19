<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/WEB-INF/views/inc/top.jsp"%>
<style type="text/css">
.divPage {padding-left: 40%;}
input#searchKeyword {width: 200px;float: left;}
input.btn.btn-outline-dark {height: 34px;margin: 0 5px;padding: 3px 18px 1px 18px;border: 1px solid silver;}
input[name=userAdd], input[name=userDel]{height: 34px;margin: 0 5px;padding: 3px 18px 1px 18px;border: 1px solid silver;float: right}
select#searchCondition {height: 34px;float: left;margin-right: 5px;border: 1px solid silver;}
select#recordCountPerPage {height: 34px;float:right;margin-right: 5px;border: 1px solid silver;width: 97px;padding-left: 6px;}
form[name=userform] {margin-bottom: 5px;}
</style>

				 <div class="row">
                    <!-- ============================================================== -->
                    <!-- data table rowgroup  -->
                    <!-- ============================================================== -->
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0">유저 정보 </h5>
                                <p>유저정보 화면</p>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                <div>	
                                	<form name="userform">
                                		<input type="hidden" name="currentPage"/>
                                		<select name="searchCondition" id="searchCondition">
                                			<option value="ALL">전체</option>
                                			<option value="NAME">이름</option>
                                			<option value="ADDRESS">주소</option>
                                			<option value="ATTENTIONCAR">관심차종</option>
                                			<option value="MEMO">메모</option>
                                		</select>
                                		<input type="text" class="form-control" name="searchKeyword" id="searchKeyword"/>
                                		<input type="button" class="btn btn-outline-dark" name="searchbt" value="검색"/>
                                		<input type="button" class="btn btn-outline-dark" name="userDel" value="삭제"/>
                                		<input type="button" class="btn btn-outline-dark" name="userAdd" value="뭐를 해야하나..?"/>
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
                                                <th>번호</th>
                                                <th>이름</th>
                                                <th>전화번호</th>
                                                <th>생일/나이</th>
                                                <th>성별</th>
                                                <th>주소</th>
                                                <th>관심차종</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:if test="${!empty userList }">
                                        	<c:forEach var="userinfoVO" items="${userList}">
                                        		<tr>
                                        			<td><input type="checkbox" name="check"></td>
                                        			<td>${userinfoVO.no }</td>
                                        			<td>${userinfoVO.name }</td>
                                        			<td>${userinfoVO.tel }</td>
                                        			<td>${userinfoVO.birthday }</td>
                                        			<td>${userinfoVO.gender }</td>
                                        			<td>${userinfoVO.address } ${userinfoVO.addressdt }</td>
                                        			<td>${userinfoVO.attentioncar }</td>
                                        		</tr>
                                        	</c:forEach>
                                        </c:if>
                                        <c:if test="${empty userList }">
                                        	<tr>
                                        		<td colspan="8">정보가 없습니다....</td>
                                        	</tr>
                                        </c:if>
                                        </tbody>
                                        <tfoot>
                                         
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

<%@include file="/WEB-INF/views/inc/bottom.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		//추가 버튼 
		$("input[name=userAdd]").click(function(){
			location.href="<c:url value='/userAdd.do'/>"
		});	
		//삭제 버튼
		$("input[name=userDel]").click(function(){
			alert("삭제버튼");
		})	
		
	})

//페이지 처리 함수
function pageFunc(curPage){
	$("input[name=currentPage]").val(curPage);
	$("form[name=userform]").attr("action","<c:url value='userList.do'/>");
	$("form[name=userform]").submit();
}

</script>