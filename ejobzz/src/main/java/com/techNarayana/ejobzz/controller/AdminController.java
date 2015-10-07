package com.techNarayana.ejobzz.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techNarayana.ejobzz.domain.UserDomain;
import com.techNarayana.ejobzz.dto.UserDTO;
import com.techNarayana.ejobzz.service.AdminService;
import com.techNarayana.ejobzz.service.UserService;

@Controller
public class AdminController {
	public static Logger logger=Logger.getLogger(AdminController.class);
	
	@Autowired
	UserService userService;
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value={"/adminLogin.do"},method={RequestMethod.GET,RequestMethod.POST})
	public String adminLogin(Model model,HttpServletRequest request){
				logger.debug("inside adminLogin.do");
				
				logger.debug("end adminLogin.do");
		return "adminLogin";
	}
	@RequestMapping(value={"/adminHome.do"},method={RequestMethod.GET,RequestMethod.POST})
	public String adminHome(Model model,HttpServletRequest request){
		logger.debug("inside adminHome.do");
		
		
		logger.debug("end adminHome.do");
		return "adminHome";
	}
		@RequestMapping(value={"/authAdmin.do"},method={RequestMethod.GET,RequestMethod.POST})
		public void authAdmin(Model model,HttpServletRequest request,HttpServletResponse response){
			logger.debug("inside authAdmin.do");

			String username=request.getParameter("username");
			String password=request.getParameter("password");
			
			UserDTO userDto=new UserDTO();
			userDto.setUsername(username);
			userDto.setPassword(password);
			
			
			UserDomain userDomain = userService.getUser(userDto);

			String txt="1";
			if(userDomain != null){
				userDto.setId(userDomain.getId());
				HttpSession session=request.getSession(true);
				session.setAttribute("admin", userDto);
				txt="0";
			}
			
			//giving response back
			logger.debug("end authAdmin");
			response.setContentType("text/html");
			try {
				System.out.println("inside print writer txt: "+ txt);
				response.getWriter().write(txt);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	
	
		@RequestMapping(value={"/viewEmployers.do"},method={RequestMethod.GET,RequestMethod.POST})
		public String viewEmployers(Model model,HttpServletRequest request){
					logger.debug("inside viewEmployers");
					
					model.addAttribute("employersList",adminService.getEmployer());
					
					logger.debug("end viewEmployers");
			return "forward:searchedEmployers.do";
		}
		
		@RequestMapping(value={"/searchedEmployers.do"},method={RequestMethod.GET,RequestMethod.POST})
		public String searchedEmployers(Model model,HttpServletRequest request){
					logger.debug("inside viewEmployers");
					
					
					logger.debug("end viewEmployers");
			return "searchedEmployers";
		}
		
		

}
