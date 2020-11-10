package com.goodeecoffee.gc;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.goodeecoffee.gc.admin.dto.AdminDTO;
import com.goodeecoffee.gc.admin.service.AdminService;
import com.goodeecoffee.gc.staff.dto.StaffDTO;
import com.goodeecoffee.gc.staff.service.StaffService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class IndexController {
	
	
	@RequestMapping(value = "/")
	public String login(Locale locale, Model model) {
		
		return "index";
	}
	
	//관리자 로그인
	@Inject
	AdminService adminService;
    
    //view에서 /admin 을 맵핑하면 이 메소드가 호출된다. 
    @RequestMapping("/admin")
    public ModelAndView admin_login_check(
        //이 메소드는 dto, session, mav를 매개값으로 받고, session안에 setAttribute 메소드를 사용해서 값들을 저장
        AdminDTO adminDTO, HttpSession session, ModelAndView mav) {
        
    	//ModelAndView는 데이터를 출력할 페이지와 전송을 동시에 함
        String name=adminService.adminLoginCheck(adminDTO);
        if(name != null) { //로그인 성공 (adminLoginCheck()메소드 안에 이름이 저장)
            
            //dto에서 Userid()를 받아와 admin_userid라는 이름으로 session에 setAttribute()메소드를 사용해서 저장하고
            //admin_name도 마찬가지로 session에 저장
            session.setAttribute("admin_userid", adminDTO.getA_id());
            session.setAttribute("admin_name", name);
            
            mav.setViewName("/index._admin");      //index._admin 페이지를 보여줌
            mav.addObject("message", "success"); //mav안에 있는 addObject()메소드를 사용해 message라는 키에 sucess라는 value를 담아 보낸다
        }else {
            	
            mav.setViewName("index");    //관리자 로그인이 실패했을때 보여주는 페이지
            mav.addObject("message", "error");   //error메시지를 출력
        }
        return mav; 
    }
        
    //관리자 로그아웃 처리 
    //View에 있는 logout.do를 맵핑
    @RequestMapping("/admin/logout.do")
    public String logout(HttpSession session) {
        session.invalidate();
        //로그아웃을 시키려면 session에 있는 데이터를 삭제시켜야 하기 때문에 invalidate()메소드를 사용해서
        //안에 있는 데이터를 초기화.
        
        return "redirect:/";
        //데이터를 삭제시킨후에는 login페이지로 돌아가도록 한다.
    }
	//staff-context.xml에 지정된 경로 똑같이 평가되서 이름만 바꾸면 될듯 지금은 시험삼아 staffs 사용.	
    //staff 로그인
	@Inject
	StaffService staffService;
	
	//view에서 /staffs 를 맵핑하면 이 메소드가 호출된다. 
    @RequestMapping("/staffs")
    public ModelAndView staff_login_check(
        //이 메소드는 dto, session, mav를 매개값으로 받고, session안에 setAttribute 메소드를 사용해서 값들을 저장한다.
    	StaffDTO staffDTO, HttpSession session, ModelAndView mav) {
        
    	//ModelAndView는 데이터를 출력할 페이지와 전송을 동시에 함
        String name = staffService.staffLoginCheck(staffDTO);
        if(name != null) { //로그인 성공 (staffLoginCheck()메소드 안에 이름이 저장)
            
            //dto에서 Userid()를 받아와 staff_userid라는 이름으로 session에 setAttribute()메소드를 사용해서 저장하고
            //name도 마찬가지로 session에 저장한다.
            session.setAttribute("staff_userid", staffDTO.getW_id());
            session.setAttribute("staff_name", name);
            
            mav.setViewName("/index._staff");    //index._staff 페이지를 보여줌
            mav.addObject("message", "success"); //mav안에 있는 addObject()메소드를 사용해 message라는 키에 sucess라는 value를 담아 보낸다
        }else {
            	
            mav.setViewName("index");    		//staff 로그인이 실패했을때 보여주는 페이지
            mav.addObject("message", "error");  //error메시지를 출력한다.
        }
        return mav; 
    }
        
    //staff 로그아웃 처리
    //View에 있는 logout.do를 맵핑
    @RequestMapping("/staff/logout.do")
    public String staff_logout(HttpSession session) {
        session.invalidate();
        //로그아웃을 시키려면 session에 있는 데이터를 삭제시켜야 하기 때문에 invalidate()메소드를 사용해서
        //안에 있는 데이터를 초기화 시킨다.
        
        return "redirect:/";
        //데이터를 삭제시킨후에는 login페이지로 돌아가도록 한다.
    }
}