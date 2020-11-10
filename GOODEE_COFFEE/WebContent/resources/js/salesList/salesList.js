window.onload = function(){
	var dateBtns = document.getElementsByClassName("dateBtn");
	for(var dateBtn of dateBtns){
		dateBtn.addEventListener("click", changeDate);
	}
	
	var selectBtn = document.getElementsByName("selectBtn")[0];
	selectBtn.onclick = function(){
		var open_time = document.getElementsByName("open_time")[0];
		var close_time = document.getElementsByName("close_time")[0];
		var selectFrm = document.getElementsByName("selectFrm")[0];
		var payment_status = document.getElementsByName("payment_status")[0];
		var payment_method = document.getElementsByName("payment_method")[0];
		
		console.log("open_time : "+open_time.value);
		console.log("close_time : "+close_time.value);
		console.log("결제 상태 인덱스 : "+payment_status.selectedIndex);
		console.log("결제 수단 인덱스 : "+payment_method.selectedIndex);
		console.log("결제 상태 : "+ payment_status.options[payment_status.selectedIndex].value);
		console.log("걸제 수단 : "+ payment_method.options[payment_method.selectedIndex].value);
		console.log("options : "+payment_method.options);
		
		if(open_time.value=="" || close_time.value==""){
			alert("날짜를 선택해주세요.");
			return;
		}
		if(payment_status.value=="전체" || payment_method.value==	"전체"){
			alert("결제 상태 또는 결제 수단을 확인해주세요.");
			return
		}else{
			selectFrm.submit();
		}
	}
}

function changeDate(){
	var val= this.getAttribute("value");										//누른 기간 일 수.
	var dateObject = new Date();
	var startDate;																//시작 날짜
	var endDate;																//끝나는 날짜
	var year = dateObject.getFullYear();										//연도
	var month = dateObject.getMonth()+1;									
	var date = dateObject.getDate();										
	var dateArr = new Array();
	
	//endDate 설정.
	dateArr = changeDateLength(month,date).split("/");
	month = dateArr[0];
	date = dateArr[1];
	endDate = year+"-"+month+"-"+date;
	//startDate 설정.				
	if(val<30){
		dateObject.setDate(date-val);
		month = dateObject.getMonth()+1;									
		date = dateObject.getDate()+1;										
	}else{
		val = val/30;
		month = dateObject.getMonth()+1-val;
		date = dateObject.getDate();										
	}
	
	dateArr = changeDateLength(month,date).split("/");
	month = dateArr[0];										
	date = dateArr[1];										
	startDate = year+"-"+month+"-"+date;					
	
	document.getElementById("startDate").value = startDate;
	document.getElementById("endDate").value = endDate;
}

//달과 일 수 길이가 1자리일 경우 앞에 0을 붙여주는 메서드
function changeDateLength(month,date){
	if(month.toString().length<=1){
		month = "0"+(month);
	}
	if(date.toString().length<=1){
		date = "0"+(date);
	}
	return month+"/"+date;
}