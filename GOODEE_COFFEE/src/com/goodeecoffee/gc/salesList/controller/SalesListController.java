package com.goodeecoffee.gc.salesList.controller;

import java.sql.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.goodeecoffee.gc.salesList.service.ISaleService;

@Controller
public class SalesListController {
	
	@Resource(name="saleService")
	private ISaleService saleService;
	
	@RequestMapping(value="/salesList", method=RequestMethod.GET)
	public String salesList() {
		return "salesList";
	}
	
	@RequestMapping(value="/selectSaleList", method=RequestMethod.GET)
	public String salesListSelect(@RequestParam("open_time") Date open_time, 
								  @RequestParam("close_time") Date close_time, 
								  @RequestParam("payment_status") String payment_status,
								  @RequestParam("payment_method") String payment_method) {
		
		
		System.out.println("open_time : "+open_time);
//		System.out.println("endDate : "+close_time);
//		System.out.println("payment_status : "+payment_status);
//		System.out.println("payment_method : "+payment_method);
//		
		return "redirect:/staff/staff_list";
	}
	
	
}
