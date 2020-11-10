 var pay_delete_modal = document.querySelector(".pay-delete-modal"); 
 var pay_delete_trigger = document.querySelector(".pay_delete_btn"); 
 var pay_delete_closeButton = document.querySelector(".pay-delete-modal-close-btn"); 

function toggleDModal() { 
	pay_delete_modal.classList.toggle("show-pay-delete-modal"); 
 }

function windowOnClickD(event) { 
     if (event.target === pay_delete_modal) { 
    	 toggleBModal(); 
     } 
 }

 pay_delete_trigger.addEventListener("click", toggleDModal); 
 pay_delete_closeButton.addEventListener("click", toggleDModal); 
 window.addEventListener("click", windowOnClickD);


 