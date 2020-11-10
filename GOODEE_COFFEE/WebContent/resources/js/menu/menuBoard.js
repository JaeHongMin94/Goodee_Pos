//메뉴 추가 내용 비었을 시 submit 방지
$(document).ready(function(){
	$("#content div").hide();
    $("#tabs li:first").attr("id", "current");
    $("#content div:first").fadeIn();

    $('#tabs a').click(function(e) {
       e.preventDefault();
       $("#content div").hide();
       $("#tabs li").attr("id", "");
       $(this).parent().attr("id", "current");
       $('#' + $(this).attr('title')).fadeIn();
    });
    
    $(".menu_sub").click(function() {
       $(this).parent().siblings(".menu_contents").find(".menuList")
       .append('<input type="checkbox" class="menuSubChk">');
    });
    
    //메뉴 삭제 체크 시 메뉴 색깔 바뀌는 제이쿼리문
    $(".menu_label").click(function(){
       if($(this).next().is(":checked")==false){
          $(this).next().prop("checked",true);
       }else if($(this).next().is(":checked")==true){
          $(this).next().prop("checked",false);
       }      
       //메뉴 체크 시 배경색 바꿔줌
       if($(this).next().is(":checked")==true){
          $(this).css({"backgroundColor":"red", "color":"white"});
       }else{
    	   $(this).css({"backgroundColor":"#F1C40F", "color":"black"});
       }
       //메뉴 추가 레이어 팝업 제이쿼리
       $(".menu_add").click(function() {
           var i = $(this).siblings().eq(0).text();
           $("option:contains("+i+")").prop("selected",true);
           $("#pop").show();
       });
    });
    
    //선택된 메뉴가 없을 경우
    $(".menu_sub").click(function(){
       if($("input:checkbox[name=menuID]:checked").length == 0){
           alert("선택된 메뉴가 없습니다.");
           return false;
       }else{
    	   return deleteMenuAlert();
       }
    });
    //메뉴 추가 팝업 닫기
    $(".closePop").click(function(){
        $("#pop").css("display","none");
    });
});
function menuCheck(){
	var menuName = $("#menuName").val();
	var menuNameLength = $("#menuName").val().length;
	var menuPrice = $("#menuPrice").val().length;
	var menuInsertFrm = $("#menuInsertFrm");
	if(menuNameLength>25 || menuNameLength==0 || menuPrice > 5 || menuPrice==0){      //1<=메뉴길이<=24, 0<메뉴가격<=5
	   window.alert("메뉴 이름 또는 가격 양식이 틀립니다.");
	}else{
	   $.ajax({
	         type: "POST",
	         async: "false",
	         url: "/gc/menu/menuCheck",
	         data: {menuName:menuName},
	         success:function(isMenuExist,textStatus){
	            if(isMenuExist=="isDuplicated"){
	               alert("이미 존재하는 메뉴 이름입니다.");
	            }else{
	               menuInsertFrm.submit();
	            }
	         }
	     });   
	}
}
function categoryCheck(){
    var categoryName = $("#categoryInsertText").val();
    var isDuplicated;
    
    $.ajax({
          type: "POST",
          async: false,
          url: "/gc/menu/categoryCheck",
          data: {categoryName:categoryName},
          success:function(data,textStatus){
             isDuplicated = data;
          }
      });
    return isDuplicated;
}
function categoryInsert(){
   var categoryName = $("#categoryInsertText").val();
   var isDuplicated = categoryCheck();
   
   if(categoryName==null || categoryName=="" || categoryName.length>25){
      window.alert("카테고리 제목은 1~25자 이내로 작성해주세요.");
      return false;
   }
   if(isDuplicated=="false"){
      document.categoryInsertFrm.submit();   
      window.alert("카테고리가 추가되었습니다.");
   }else if(isDuplicated=="isDuplicated"){
      window.alert("이미 존재하는 카테고리 명입니다.");
      return false;
   }
}
function deleteMenuAlert(){
	if(confirm("정말 삭제하시겠습니까?")){
		return true;
	}else{
		return false;
	}
}

    
