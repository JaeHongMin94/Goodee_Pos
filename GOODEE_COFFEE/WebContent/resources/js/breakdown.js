 var breakdown_modal = document.querySelector(".breakdown-modal"); 
 var breakdown_trigger = document.querySelector(".breakdown_btn"); 
 var breakdown_closeButton = document.querySelector(".close-button"); 

//console.log(modal);

function toggleBModal() { 
	breakdown_modal.classList.toggle("show-breakdown-modal"); 
 }

function windowOnClickB(event) { 
     if (event.target === breakdown_modal) { 
    	 toggleBModal(); 
     } 
 }

 breakdown_trigger.addEventListener("click", toggleBModal); 
 breakdown_closeButton.addEventListener("click", toggleBModal); 
 window.addEventListener("click", windowOnClickB);

 $(document).ready(function() {

     //datepicker 한국어로 사용하기 위한 언어설정
     $.datepicker.setDefaults($.datepicker.regional['ko']);     
 
     // Datepicker            
     $(".datepicker").datepicker({
         showButtonPanel: true,
         dateFormat: "yy-mm-dd",
         onClose : function ( selectedDate ) {
         
             var eleId = $(this).attr("id");
             var optionName = "";

             if(eleId.indexOf("StartDate") > 0) {
                 eleId = eleId.replace("StartDate", "EndDate");
                 optionName = "minDate";
             } else {
                 eleId = eleId.replace("EndDate", "StartDate");
                 optionName = "maxDate";
             }

             $("#"+eleId).datepicker( "option", optionName, selectedDate );        
             $(".searchDate").find(".chkbox2").removeClass("on"); 
         }
     }); 

     //시작일.
     /*$('#searchStartDate').datepicker("option","onClose", function( selectedDate ) {    
         // 시작일 datepicker가 닫힐때
         // 종료일의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
         $("#searchEndDate").datepicker( "option", "minDate", selectedDate );
         $(".searchDate").find(".chkbox2").removeClass("on");
     });
     */

     //종료일.
     /*$('#searchEndDate').datepicker("option","onClose", function( selectedDate ) {    
         // 종료일 datepicker가 닫힐때
         // 시작일의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
         $("#searchStartDate").datepicker( "option", "maxDate", selectedDate );
         $(".searchDate").find(".chkbox2").removeClass("on");
     });
     */

     $(".dateclick").dateclick();    // DateClick
     $(".searchDate").schDate();        // searchDate
     
 });

 // Search Date
 jQuery.fn.schDate = function(){
     var $obj = $(this);
     var $chk = $obj.find("input[type=radio]");
     $chk.click(function(){                
         $('input:not(:checked)').parent(".chkbox2").removeClass("on");
         $('input:checked').parent(".chkbox2").addClass("on");                    
     });
 };

 // DateClick
 jQuery.fn.dateclick = function(){
     var $obj = $(this);
     $obj.click(function(){
         $(this).parent().find("input").focus();
     });
 }    

 
 function setSearchDate(start){

     var num = start.substring(0,1);
     var str = start.substring(1,2);

     var today = new Date();

     //var year = today.getFullYear();
     //var month = today.getMonth() + 1;
     //var day = today.getDate();
     
     var endDate = $.datepicker.formatDate('yy-mm-dd', today);
     $('#searchEndDate').val(endDate);
     
     if(str == 'd'){
         today.setDate(today.getDate() - num);
     }else if (str == 'w'){
         today.setDate(today.getDate() - (num*7));
     }else if (str == 'm'){
         today.setMonth(today.getMonth() - num);
         today.setDate(today.getDate() + 1);
     }

     var startDate = $.datepicker.formatDate('yy-mm-dd', today);
     $('#searchStartDate').val(startDate);
             
     // 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
     $("#searchEndDate").datepicker( "option", "minDate", startDate );
     
     // 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
     $("#searchStartDate").datepicker( "option", "maxDate", endDate );

 }

 jQuery.datepicker._gotoToday = function(id) {
	    var target = $(id);
	    var inst = this._getInst(target[0]);
	    if (this._get(inst, 'gotoCurrent') && inst.currentDay) {
	            inst.selectedDay = inst.currentDay;
	            inst.drawMonth = inst.selectedMonth = inst.currentMonth;
	            inst.drawYear = inst.selectedYear = inst.currentYear;
	    }
	    else {
	            var date = new Date();
	            inst.selectedDay = date.getDate();
	            inst.drawMonth = inst.selectedMonth = date.getMonth();
	            inst.drawYear = inst.selectedYear = date.getFullYear();
	            this._setDateDatepicker(target, date);
	            this._selectDate(id, this._getDateDatepicker(target));
	    }
	    this._notifyChange(inst);
	    this._adjustDate(target);
	    
	    this._setDateDatepicker(target, new Date());
	    this._selectDate(id, this._getDateDatepicker(target));
}