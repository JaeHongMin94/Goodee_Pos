<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- footer -->
<footer>
	<!-- 팝업 될 레이어
	<div class="receipt-modal"> 
	    <div class="receipt-modal-content"> 
	        <span class="close-btn">&times;</span> 
	        <h1 class="title">영수증 조회</h1> 
	        <form id="receipt_frm" action="#" method="POST"> 
	          <dl>
	          	<dt>결제번호</dt>
	          	<dd>
	          		<input id="receipt_code" type="text" placeholder="입력">
	          	</dd>
	          </dl>
	          <div class="btn_wrap">
	          	<input type="submit" id="submit" value="조회">
	          	<input type="button" id="cancel" value="취소">  
	          </div>
	        </form> 
	    </div> 
	</div> --> 
	
	<div class="breakdown-modal"> 
	    <div class="breakdown-modal-content">
	    <span class="close-button">&times;</span>
	    <h1 class="title">판매내역 조회</h1>
	        <form id="breakdown_frm" action="#" method="POST">   
			    <!-- search -->
			    <table class="searchBox">
			        <caption>조회</caption>
			        <colgroup>
			            <col width="123px">
			            <col width="*">
			        </colgroup>
			        <tbody>
			            <tr>
			                <th>조회기간</th>
			                <td>
			                    <ul class="searchDate">
			                        <li>
			                            <span class="chkbox2">
			                                <input type="radio" name="dateType" id="dateType1" onclick="setSearchDate('0d')"/>
			                                <label for="dateType1">당일</label>
			                            </span>
			                        </li>
			                        <li>
			                            <span class="chkbox2">
			                                <input type="radio" name="dateType" id="dateType2" onclick="setSearchDate('3d')"/>
			                                <label for="dateType2">3일</label>
			                            </span>
			                        </li>
			                        <li>
			                            <span class="chkbox2">
			                                <input type="radio" name="dateType" id="dateType3" onclick="setSearchDate('1w')"/>
			                                <label for="dateType3">1주</label>
			                            </span>
			                        </li>
			                        <li>
			                            <span class="chkbox2">
			                                <input type="radio" name="dateType" id="dateType4" onclick="setSearchDate('2w')"/>
			                                <label for="dateType4">2주</label>
			                            </span>
			                        </li>
			                        <li>
			                            <span class="chkbox2">
			                                <input type="radio" name="dateType" id="dateType5" onclick="setSearchDate('1m')"/>
			                                <label for="dateType5">1개월</label>
			                            </span>
			                        </li>
			                        <li>
			                            <span class="chkbox2">
			                                <input type="radio" name="dateType" id="dateType6" onclick="setSearchDate('3m')"/>
			                                <label for="dateType6">3개월</label>
			                            </span>
			                        </li>
			                        <li>
			                            <span class="chkbox2">
			                                <input type="radio" name="dateType" id="dateType7" onclick="setSearchDate('6m')"/>
			                                <label for="dateType7">6개월</label>
			                            </span>
			                        </li>
			                    </ul>	                    
			                    <div class="clearfix">
			                        <!-- 시작일 -->
			                        <span class="dset">
			                            <input type="text" class="datepicker inpType" name="searchStartDate" id="searchStartDate" >
			                            <a href="#none" class="btncalendar dateclick">달력</a>
			                        </span>
			                        <span class="demi">~</span>
			                        <!-- 종료일 -->
			                        <span class="dset">
			                            <input type="text" class="datepicker inpType" name="searchEndDate" id="searchEndDate" >
			                            <a href="#none" class="btncalendar dateclick">달력</a>
			                        </span>
			                    </div>
			                </td>
			                <td>
			                	<input type="submit" id="search" value="조회">    
			                </td>
			            </tr>
			        <tbody>
			    </table>
			</form>
	    </div> 
	</div>
	<!-- 결제 취소  -->
	<div class="pay-delete-modal"> 
	    <div class="pay-delete-modal-content"> 
	        <span class="pay-delete-modal-close-btn">&times;</span> 
	        <h1 class="title">결제 취소</h1> 
	        <form id="pay_delete_frm" action="#" method="POST"> 
	          <section id="search_list">
	            	<table>
		                <colgroup>
		                    <col width="10%"><!--주문아이디-->
		                    <col width="10%"><!--일자-->
		                    <col width="10%"><!--시간-->
		                    <col width="20%"><!-- 상세내용 -->
		                    <col width="20%"><!--주문합계-->
		                    <col width="5%"><!--카드-->
		                    <col width="5%"><!--현금-->
		                    <col width="10%"><!-- 주문상태 -->
		                    <col width="10%"><!-- 삭제버튼 -->
		                </colgroup>
		                <thead>
		                    <tr>
		                        <th>주문아이디</th>
		                        <th>일자</th>
		                        <th>시간</th>
		                        <th>상세내용</th>
		                        <th>주문합계</th>
		                        <th>카드</th>
		                        <th>현금</th>
		                        <th>주문상태</th>
		                        <th></th>
		                    </tr>
		                </thead>
		                <tbody>
		               	 	<c:forEach items="${paymentList}" var="paymentList">
		                    <tr>
		                        <td>${paymentList.order_id}</td>
		                        <td><fmt:formatDate type="date" value="${paymentList.order_date}" pattern="yyyy-MM-dd"/></td>
		                        <td><fmt:formatDate type="time" value="${paymentList.order_date}" pattern="HH:mm:ss"/></td>
		                        <td>-</td>
		                        <td><fmt:formatNumber pattern="###,###,###" value="${paymentList.total_price}"/></td>
		                        <td>${paymentList.card}</td>
		                        <td>${paymentList.cash}</td>
		                        <td>${paymentList.order_state}</td>
		                        <td><input type="button" value="삭제" onclick="delete_btn(${paymentList.order_id});"/></td>
		                    </tr>
		                    </c:forEach>
		                </tbody>
		            </table>
	        		

        		</section>
	        </form> 
	    </div> 
	</div>
<script>
	function delete_btn(order_id) { 
		var result = confirm("정말 결제 취소 하겠습니까?");
		
		if(result == true){
			window.location.href = "${pageContext.request.contextPath}/payment/orderUpdate?order_id="+order_id;
		    alert("결제 취소 완료");
		}else
			event.preventDefault();
	 }
</script>
<!-- // -->
</footer>
<!-- //footer -->
</body>
<script src="${path}/resources/js/open.js"></script>
<script src="${path}/resources/js/breakdown.js"></script>
<script src="${path}/resources/js/pay_delete.js"></script>
</html>