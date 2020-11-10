<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="./payment_header.jsp" %>

    <!-- main -->
      
    <div id="display_wrap">
    	
        <div id="left">
            <div id="tab_kind">
               <div class="tab_wrap">
                   <div class="tab-link current" data-tab="coffee_menu"><input type="button" value="${category[0].category_name}"></div>
                   <div class="tab-link" data-tab="beverage_menu"><input type="button" value="${category[1].category_name}"></div>
                   <div class="tab-link" data-tab="tea_menu"><input type="button" value="${category[2].category_name}"></div>
                   <div class="tab-link" data-tab="ade_menu"><input type="button" value="${category[3].category_name}"></div>
                   <div class="tab-link" data-tab="shake_menu"><input type="button" value="${category[4].category_name}"></div>
                   <div class="tab-link" data-tab="bakery_menu"><input type="button" value="${category[5].category_name}"></div>
                   <div class="tab-link" data-tab="test1_menu"><input type="button" value="${category[6].category_name}"></div>
                   <div class="tab-link" data-tab="test2_menu"><input type="button" value="${category[7].category_name}"></div>
               </div>
            </div>
            <section id="coffee_menu" class="tab-content current">
                <nav>
                    <ul id="listofproduct">
                    	<c:forEach items="${coffeeMenu}" var="coffeeMenu">
                        <li>
                            <button>
                                <span class="menu_name">${coffeeMenu.menu_name}</span>
                                <p class="menu_price">${coffeeMenu.price}원</p>
                            </button>
                        </li>
                        </c:forEach>
                    </ul>
                </nav>
            </section>
            <section id="beverage_menu" class="tab-content">
                <nav>
                    <ul id="listofproduct">
                    	<c:forEach items="${beverageMenu}" var="beverageMenu">
                        <li>
                            <button>
                                <span class="menu_name">${beverageMenu.menu_name}</span>
                                <p class="menu_price">${beverageMenu.price}원</p>
                            </button>
                        </li>
                  		</c:forEach>
                    </ul>
                </nav>
            </section>
            <section id="tea_menu" class="tab-content">
                <nav>
                    <ul id="listofproduct">
                    	<c:forEach items="${teaMenu}" var="teaMenu">
                        <li>
                            <button>
                                <span class="menu_name">${teaMenu.menu_name}</span>
                                <p class="menu_price">${teaMenu.price}원</p>
                            </button>
                        </li>
                        </c:forEach>
                    </ul>
                </nav>
            </section>
            <section id="ade_menu" class="tab-content">
                <nav>
                    <ul id="listofproduct">
                    	<c:forEach items="${adeMenu}" var="adeMenu">
                        <li>
                            <button>
                                <span class="menu_name">${adeMenu.menu_name}</span>
                                <p class="menu_price">${adeMenu.price}원</p>
                            </button>
                        </li>
                        </c:forEach>
                    </ul>
                </nav>
            </section>
            <section id="shake_menu" class="tab-content">
                <nav>
                    <ul id="listofproduct">
                    	<c:forEach items="${shakeMenu}" var="shakeMenu">
                        <li>
                            <button>
                                <span class="menu_name">${shakeMenu.menu_name}</span>
                                <p class="menu_price">${shakeMenu.price}원</p>
                            </button>
                        </li>
  						</c:forEach>
                    </ul>
                </nav>
            </section>
            <section id="bakery_menu" class="tab-content">
                <nav>
                    <ul id="listofproduct">
                    	<c:forEach items="${bakeryMenu}" var="bakeryMenu">
                        <li>
                            <button>
                                <span class="menu_name">${bakeryMenu.menu_name}</span>
                                <p class="menu_price">${bakeryMenu.price}원</p>
                            </button>
                        </li>
       					</c:forEach>
                    </ul>
                </nav>
            </section>
            <br>
	        
            <div id="manage_btn">
                <div class="main_btn">
                    <div class="top">
                        <nav>
                            <ul>
                                <li class="reset"><input type="button" id="deleteAllItemsBtn"value="초기화"></li>
                                <li><input type="button" value="판매내역" class="breakdown_btn"></li>
                                <li><input type="button" value="카드결제" class="payment_btn" id="cardBtn"></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="bottom">
                        <nav>
                            <ul>
                                <li><input type="button" value="결제취소" class="pay_delete_btn"></li>
                                <li><input type="button" value=""></li>
                                <li><input type="button" value="현금결제" class="payment_btn" id="cashBtn"></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- 버튼사용안함 -->
                <div class="aside_btn">
                    <input type="button" value="보류">
                </div>
            </div>
        </div>
       	<form name="paymentFrm" method="GET">
	        <div id="right">
	            <div class="selected_menu">
	                <table id="order_table">
	                	<thead>
		                    <tr>
		                        <th>상품이름</th>
		                        <th>수량</th>
		                        <th>정가</th>
		                        <th>합계</th>
		                        <th>삭제</th>
		                    </tr>
	                    </thead>
	                 
	                    <tbody class="added_area">
		                    <!-- 데이터 추가될 곳 -->
	                    </tbody>
		     
	                </table>
	            </div>
	            <div id="right_bottom">
		            <div class="payment">
		                <div class="total_money">
		                    <p>총 합계 :<span class="sum">0</span>원</p>
		                    <p>포인트사용 :<span class="point">0</span> 원</p>
		                </div>
		                <hr>
		                <div class="calc_money">
		                    <p>결제가격 :<input type="text" name="total_price" style="height:30px; width:80px; text-align:right;" value="0">원</p>
		                </div>
		            </div>
		            <div class="member_search">
		                <div class="search_box">
		                    <span>회원조회</span><input type="text"/><input type="button" value="조회"/>
		                </div>
		                <hr>
		                <div class="point_area">
		                	<p>전체포인트 :<span>0</span>원</p>
		                    <p>사용할포인트 :</p><input type="text"/><input type="button" value="사용"/>
		                </div>
		            </div>
	            </div>
	            
	        </div>
        </form>
        
    </div>
    <!-- //main -->
    <script>
	$(document).ready(function(){
 		
 		//상품 클릭
 		$("#listofproduct li").on("click", function(){
 				
 			  var m_name = $(this).find('.menu_name').text();
 		      var m_price = $(this).find('.menu_price').text();
 		      var flag = 0;
 		      $("#order_table .added_area tr").each(function() {
	 		        if ($(this).find("td").eq(0).text() == m_name) {//같은 이름이 있으면
	 		          var qty = $(this).find("td").eq(1).text();
	 		          var temp = parseInt(qty) + 1;
	 		          var unit_price = $(this).find("td").eq(2).text();
	 		          $(this).find("td").eq(1).text(temp);
	 		          $(this).find("td").eq(3).text(parseInt(temp)*parseInt(unit_price));
	 		          flag = 1;
	 		          console.log(flag);
	 		        }
 		      });

 		      if (flag == 0) {//같은이름이 없으면
 		        $('#order_table > tbody:last').append('<tr><td>' + m_name + '</td><td>1</td><td>' + m_price + '</td><td>' + m_price + '</td><td class="intd"><input type="button" onclick="deleteLine(this); sum();" class="delete" value="삭제"></td></tr>');
 		      }
 		      
 		      sum();
 		      

 		});
 		//합계가격
 		function sum() {
 			var sum = 0;
	    	$('#order_table tbody tr').each(function(i) {
 		        var tr = $(this);
 		        var td = tr.children();
 		        var text = td.eq(3).text();

 		        sum += parseInt(text);
 		      });

 		      $(".total_money .sum").text(sum);
 		      total(sum);
	       }
 		  //결제합계 구하는 코드
	      function total(sum){
	    	  var point = $(".point").text();
			  $(".calc_money > p > input").val(sum - point);
	      }

	      

		//주문 테이블에 있는 모든 행을 삭제하는 코드
	    $('#deleteAllItemsBtn').click(function() {
	 	      $('#order_table> .added_area').empty();
	 	     $(".total_money .sum").text(0);
	 	      $(".calc_money > p > input").val(0);
	    });
	   

	 });
    </script>
    <script>
	    function deleteLine(obj) {
	    	 var tr = $(obj).parent().parent();
	 	     
		        //라인 삭제
		        tr.remove();
		       
	    }
	    function sum() {
 			var sum = 0;
	    	$('#order_table tbody tr').each(function(i) {
 		        var tr = $(this);
 		        var td = tr.children();
 		        var text = td.eq(3).text();

 		        sum += parseInt(text);
 		      });

 		      $(".total_money .sum").text(sum);
 		      total(sum);
	       }
 		  //결제합계 구하는 코드
	      function total(sum){
	    	  var point = $(".point").text();
	    	  $(".calc_money > p > input").val(sum - point);
	      }
    </script>
    <script>
	    $('#cardBtn').click(function() {
	    	var total_price = $(".calc_money > p > input").val();
	    	
	    	if(total_price == 0){
	    		alert("구매목록이 없습니다.");
	    	}else{
	    		window.location.href = "${pageContext.request.contextPath}/payment/orderInsert?payment=card&total_price="+total_price;
	    		alert("결제완료");
	    	}
	    	
	    	//document.paymentFrm.action ="${pageContext.request.contextPath}/payment/orderInsert&method=card";
			//document.paymentFrm.submit();
			});
		$('#cashBtn').click(function() {
			
			var total_price = $(".calc_money > p > input").val();
	    	
	    	if(total_price == 0){
	    		alert("구매목록이 없습니다.");
	    	}else{
	    		window.location.href = "${pageContext.request.contextPath}/payment/orderInsert?payment=cash&total_price="+total_price;
	    		alert("결제완료");
	    	}
		});

    </script>
 
<%@ include file="./payment_footer.jsp" %>