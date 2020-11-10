$(document).on("keyup", "#w_phone", function() {
	$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
});

function alterInto(){
	 var msgConfirm;
	 var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
	 if($("#w_name").val()==""){
	 	 alert("이름을 입력해주세요.");
		 $("#w_name").focus();
		 return;
	 }else if($("#w_name").val().length>10){
		 alert("이름은 최대 10자 입니다.");
		 $("#w_name").focus();
		 return;
	 }
	 
	 if($("#w_phone").val()==""){
		 alert("휴대전화를 입력해주세요.");
		 $("#w_phone").focus();
	 	 return;
	 } else if(!regExp.test($("input[id='w_phone']").val())){
		 alert("휴대전화는 최대('-'포함) 13자 입니다.");
		 $("#w_phone").focus();
		 return;
	 }else{
		 msgConfirm = confirm("삭제하시겠습니까?");
		 if(msgConfirm)
	 	 	$("#alterFrm").submit();				 
		 else
		 	return;
	 }
}