<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/WEB-INF/views/inc/top.jsp" %>
<style type="text/css">
.col-xl-4.col-lg-4.col-md-12.col-sm-12.col-12 {float: left;}
</style>
                       <!-- ============================================================== -->
                        <!-- basic form -->
                        <!-- ============================================================== -->
                  <form action="#" id="carAddForm" data-parsley-validate="">
                        <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
                            <div class="card">
                                <h5 class="card-header">자동차 등록 </h5>
                                <div class="card-body">
                                        <div class="form-group">
                                            <label for="inputUserName">이름</label>
                                            <input id="inputUserName" type="text" name="name" data-parsley-trigger="change" required="" placeholder="차량 이름" autocomplete="off" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail">제조사</label>
                                            <input id="inputEmail" type="email" name="maker" data-parsley-trigger="change" required="" placeholder="" autocomplete="off" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword">모델</label>
                                            <input id="inputPassword" type="password" placeholder="Password" required="" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="inputRepeatPassword">세대</label>
                                            <input id="inputRepeatPassword" data-parsley-equalto="#inputPassword" type="password" required="" placeholder="Password" class="form-control">
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6 pb-2 pb-sm-4 pb-lg-0 pr-0">
                                                <label class="be-checkbox custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input"><span class="custom-control-label">차 번호</span>
                                                </label>
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
                            <div class="card">
                                <h5 class="card-header">자동차 등록 </h5>
                                <div class="card-body">
                                        <div class="form-group">
                                            <label for="inputUserName">이름</label>
                                            <input id="inputUserName" type="text" name="name" data-parsley-trigger="change" required="" placeholder="차량 이름" autocomplete="off" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail">제조사</label>
                                            <input id="inputEmail" type="email" name="maker" data-parsley-trigger="change" required="" placeholder="" autocomplete="off" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword">모델</label>
                                            <input id="inputPassword" type="password" placeholder="Password" required="" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="inputRepeatPassword">세대</label>
                                            <input id="inputRepeatPassword" data-parsley-equalto="#inputPassword" type="password" required="" placeholder="Password" class="form-control">
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6 pb-2 pb-sm-4 pb-lg-0 pr-0">
                                                <label class="be-checkbox custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input"><span class="custom-control-label">차 번호</span>
                                                </label>
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
                            <div class="card">
                                <h5 class="card-header">자동차 등록</h5>
                                <div class="card-body">
                                        <div class="form-group">
                                            <label for="inputUserName">가격</label>
                                            <input id="inputUserName" type="text" name="name" data-parsley-trigger="change" required="" placeholder="Enter user name" autocomplete="off" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail">구매일</label>
                                            <input id="inputEmail" type="email" name="email" data-parsley-trigger="change" required="" placeholder="Enter email" autocomplete="off" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword">출력여부</label>
                                            <input id="inputPassword" type="password" placeholder="Password" required="" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="inputRepeatPassword">연료타입</label>
                                            <input id="inputRepeatPassword" data-parsley-equalto="#inputPassword" type="password" required="" placeholder="Password" class="form-control">
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6 pb-2 pb-sm-4 pb-lg-0 pr-0">
                                                <label class="be-checkbox custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input"><span class="custom-control-label">배기량</span>
                                                </label>
                                            </div>
                                             <div class="form-group">
                                            <label for="inputEmail">사진</label>
                                       	     <input id="inputEmail" type="email" name="email" data-parsley-trigger="change" required="" placeholder="Enter email" autocomplete="off" class="form-control">
                                       		 </div>
                                            <div class="col-sm-6 pl-0">
                                                <p class="text-right">
                                                    <button type="submit" class="btn btn-space btn-primary">Submit</button>
                                                    <button class="btn btn-space btn-secondary">Cancel</button>
                                                </p>
                                            </div>
                                        </div>
                                     </div>
                                </div>
                            </div>
	              		</form>
<%@include file="/WEB-INF/views/inc/bottom.jsp" %>