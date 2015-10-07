package com.techNarayana.ejobzz.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techNarayana.ejobzz.controller.controllerHelper.EmployerControllerHelper;
import com.techNarayana.ejobzz.domain.EmployerDomain;
import com.techNarayana.ejobzz.domain.EmployerSubscriptionDomain;
import com.techNarayana.ejobzz.domain.SubscriptionDomain;
import com.techNarayana.ejobzz.dto.EmployerDto;
import com.techNarayana.ejobzz.dto.JobseekerRegisterDTO;
import com.techNarayana.ejobzz.service.CompanyService;
import com.techNarayana.ejobzz.service.JobService;
import com.techNarayana.ejobzz.util.DatabaseCommUtils;

@Controller
public class CompanyController {

	public static Logger logger=Logger.getLogger(CompanyController.class);
	@Autowired
	EmployerControllerHelper companyControllerHelper;

	@Autowired
	JobService jobService;

	@Autowired
	private DatabaseCommUtils databaseCommUtil;

	@Autowired
	CompanyService companyService;

	@RequestMapping(value={"/adminHeader.do"},method={RequestMethod.GET})
	public String adminHeader(Model model,HttpServletRequest request){
		//		logger.debug("logger called");
		//		System.out.println("registerCompany.do called");
		//		model.addAttribute("stateList",databaseCommUtil.getStateList());
		//		model.addAttribute("companyCommand",new CompanyDto());
		//		model.addAttribute("jobseekerRegisterDTO", new JobseekerRegisterDTO());
		return "adminHeader";
	}

	@RequestMapping(value={"/newEmployer.do"},method={RequestMethod.GET})
	public String registerCompany(Model model,HttpServletRequest request){
		logger.debug("---indide newEmployer.do---");

		model.addAttribute("stateList",databaseCommUtil.getStateList());
		model.addAttribute("industryList",databaseCommUtil.getAllIndustryTypesList());
		model.addAttribute("companyCommand",new EmployerDto());
		model.addAttribute("jobseekerRegisterDTO", new JobseekerRegisterDTO());

		logger.debug("---end newEmployer.do---");

		return "registerCompany";
	}
	//companyLogo
	@RequestMapping(value={"/createCompany.do"},method={RequestMethod.GET,RequestMethod.POST})
	public String createCompany(@ModelAttribute EmployerDto companyDto,Model model,HttpServletRequest request){

		logger.debug("insiside create company controller");
		EmployerDomain companyDomain=companyControllerHelper.createCompany(companyDto);
		model.addAttribute("msg","Welcome, Your account created");
		model.addAttribute("company", companyDomain);

		return "homeCompany";
	}

	@RequestMapping(value={"/takeCompanyOrder.do"},method={RequestMethod.GET,RequestMethod.POST})
	public String takeCompanyOrder(@ModelAttribute EmployerDto employerDto,Model model,HttpServletRequest request,HttpSession session){

		logger.debug("inside takeCompanyOrder.do");

		Integer sid=Integer.parseInt((session.getAttribute("sid")).toString());
		SubscriptionDomain subscriptionDomain=jobService.getSubscription(sid);

		employerDto.setStatus('A');

		//creating employer account...
		EmployerDomain companyDomain=companyControllerHelper.createCompany(employerDto);


		//setting subscription details

		EmployerSubscriptionDomain employerSubscriptionDomain=new EmployerSubscriptionDomain();

		employerSubscriptionDomain.setEmployerDomain(companyDomain);

		//counting expiry date 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		c.setTime(new Date()); // Now use today date.
		c.add(Calendar.DATE, subscriptionDomain.getValidityDays()); // Adding days
		String validityDate= sdf.format(c.getTime());
		//expiry date end
		employerSubscriptionDomain.setCreatetsDate(new Timestamp(new java.util.Date().getTime()));		
		employerSubscriptionDomain.setExpiry(validityDate);
		employerSubscriptionDomain.setStatus('A');
		employerSubscriptionDomain.setSid(sid);

		if(subscriptionDomain.getPostingType().equals("Package") && subscriptionDomain.getPremiumQuantity() > 0){


			employerSubscriptionDomain.setSubscriptionType("Premium");
			employerSubscriptionDomain.setQuantity(subscriptionDomain.getPremiumQuantity());

			//for resume access subscription validity...
			EmployerSubscriptionDomain employerSubscriptionDomain1=new EmployerSubscriptionDomain();
			employerSubscriptionDomain1.setCreatetsDate(new Timestamp(new java.util.Date().getTime()));		
			employerSubscriptionDomain1.setExpiry(validityDate);
			employerSubscriptionDomain1.setStatus('A');
			employerSubscriptionDomain1.setSid(sid);
			employerSubscriptionDomain1.setSubscriptionType(subscriptionDomain.getPostingType());
			employerSubscriptionDomain1.setQuantity(0);


			employerSubscriptionDomain1.setEmployerDomain(companyDomain);
			Set<EmployerSubscriptionDomain> es=new HashSet<EmployerSubscriptionDomain>();
			es.add(employerSubscriptionDomain1);

			companyService.createCompanySubscription(employerSubscriptionDomain1);


		}else{
			employerSubscriptionDomain.setSubscriptionType(subscriptionDomain.getPostingType());
			employerSubscriptionDomain.setQuantity(subscriptionDomain.getQuantity());
		}

		employerSubscriptionDomain.setEmployerDomain(companyDomain);
		Set<EmployerSubscriptionDomain> es=new HashSet<EmployerSubscriptionDomain>();
		es.add(employerSubscriptionDomain);

		companyService.createCompanySubscription(employerSubscriptionDomain);
		logger.debug("companySubscription created ");
		//automatically get updated... 
		// connect to payment ...
		// create order table.. and save payment datas...


		//deleting data from session...
		session.setAttribute("sid",null);
		session.setAttribute("amount", null);	
		session.setAttribute("taxAmt", null);	
		session.setAttribute("totalAmt", null);	

		logger.debug("end takeCompanyOrder.do");
		if(companyDomain != null){
			session.setAttribute("employer", companyDomain);
			//setting quick count
			List<EmployerSubscriptionDomain> quickList = companyService.getCompanySubscriptionBasedOnType("Quick",companyDomain.getCompanyKey());
			List<EmployerSubscriptionDomain> premiumList = companyService.getCompanySubscriptionBasedOnType("Premium",companyDomain.getCompanyKey());
			List<EmployerSubscriptionDomain> powerList = companyService.getCompanySubscriptionBasedOnType("Power",companyDomain.getCompanyKey());

			session.setAttribute("quickCount", countSubscription(quickList));
			session.setAttribute("premiumCount", countSubscription(premiumList));
			session.setAttribute("powerCount", countSubscription(powerList));

			model.addAttribute("msg","Welcome, Your account created <br/> <b>Thanks for subscription</b>.");

			return "homeCompany";
		}else{
			model.addAttribute("msg","Error.. creating company");
			return "home";
		}
	}

	// Login company

	@RequestMapping(value={"/loginCompany.do"},method={RequestMethod.GET})
	public String loginCompany(Model model,HttpServletRequest request){
		model.addAttribute("companyCommand",new EmployerDto());
		return "loginCompany";
	}
	//home company
	@RequestMapping(value={"/homeCompany.do"},method={RequestMethod.GET,RequestMethod.POST})
	public String homeCompany(Model model,HttpServletRequest request,HttpSession session){

		logger.debug("inside homeCompany.do");
		if(session.getAttribute("employer") == null)
		{
			model.addAttribute("msg", "Please login first");
			return "pleaseLogin";
		}

		if(session.getAttribute("orderMsg") != null){
			model.addAttribute("msg", session.getAttribute("orderMsg"));
			session.setAttribute("orderMsg",null);
		}	


		return "homeCompany";
	}
	@RequestMapping(value={"/orderLogin.do"},method={RequestMethod.GET})
	public String orderLogin(Model model,HttpServletRequest request){
		model.addAttribute("companyCommand",new EmployerDto());
		return "orderLogin";
	}

	@RequestMapping(value={"/authCompany.do"},method={RequestMethod.GET,RequestMethod.POST})
	public void authCompany(Model model,HttpServletRequest request,HttpServletResponse response){
		logger.debug("inside authCompany.do");

		String email=request.getParameter("email");
		String password=request.getParameter("password");

		EmployerDto companyDto=new EmployerDto();
		companyDto.setEmail(email);
		companyDto.setPassword(password);
		EmployerDomain companyDomain = companyService.getCompanyBassedOnEmailAndPassword(companyDto);

		//copying data

		String txt="";
		if(companyDomain != null){

			//checking subscription availablity 
			List<EmployerSubscriptionDomain> esdList=companyService.getCompanySubscriptionBasedEmployerId(companyDomain.getCompanyKey());
			//get today date
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			c.setTime(new Date()); // Now use today date.
			String todayDate = sdf.format(c.getTime());
			Date date2=null;
			try {
				date2 = sdf.parse(todayDate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			for (EmployerSubscriptionDomain employerSubscriptionDomain : esdList) {
				String expiryDate = employerSubscriptionDomain.getExpiry();
				try {
					Date date1 = sdf.parse(expiryDate);
					//checking expiry date
					if(date1.compareTo(date2)>0){
						System.out.println("Date1 is after Date2");
					}else if(date1.compareTo(date2)<0){

						employerSubscriptionDomain.setStatus('D');



						companyService.updateCompanySubscription(employerSubscriptionDomain);

						System.out.println("subscription disabled");




					}else if(date1.compareTo(date2)==0){
						System.out.println("Date1 is equal to Date2");
					}else{
						System.out.println("How to get here?");
					}








				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			//copying data

			HttpSession session = request.getSession(true);
			session.setAttribute("employer", companyDomain);
			//setting quick count
			List<EmployerSubscriptionDomain> quickList = companyService.getCompanySubscriptionBasedOnType("Quick",companyDomain.getCompanyKey());
			List<EmployerSubscriptionDomain> premiumList = companyService.getCompanySubscriptionBasedOnType("Premium",companyDomain.getCompanyKey());
			List<EmployerSubscriptionDomain> powerList = companyService.getCompanySubscriptionBasedOnType("Power",companyDomain.getCompanyKey());

			session.setAttribute("quickCount", countSubscription(quickList));
			session.setAttribute("premiumCount", countSubscription(premiumList));
			session.setAttribute("powerCount", countSubscription(powerList));

			txt="0";
		}
		else{
			txt="1";
		}
		response.setContentType("text/html");
		try {
			System.out.println("inside print writer");
			response.getWriter().write(txt);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value={"/employerOrderLogin.do"},method={RequestMethod.GET,RequestMethod.POST})
	public void employerOrderLogin(Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session){
		logger.debug("inside employerOrderLogin.do");
		String txt="";
		EmployerDto employerDto =new EmployerDto();
		employerDto.setEmail(request.getParameter("email"));
		employerDto.setPassword(request.getParameter("password"));
		EmployerDomain companyDomain = companyService.getCompanyBassedOnEmailAndPassword(employerDto);

		//copying data

		if(companyDomain != null){

			//updating employer data  based on subscription

			Integer sid=Integer.parseInt((session.getAttribute("sid")).toString());
			SubscriptionDomain subscriptionDomain=jobService.getSubscription(sid);

			//setting subscription details

			EmployerSubscriptionDomain employerSubscriptionDomain=new EmployerSubscriptionDomain();

			employerSubscriptionDomain.setEmployerDomain(companyDomain);

			//counting expiry date 
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			c.setTime(new Date()); // Now use today date.
			c.add(Calendar.DATE, subscriptionDomain.getValidityDays()); // Adding days
			String validityDate= sdf.format(c.getTime());
			//expiry date end

			employerSubscriptionDomain.setCreatetsDate(new Timestamp(new java.util.Date().getTime()));		
			employerSubscriptionDomain.setExpiry(validityDate);
			employerSubscriptionDomain.setStatus('A');
			employerSubscriptionDomain.setSid(sid);

			if(subscriptionDomain.getPostingType().equals("Package")){
				employerSubscriptionDomain.setSubscriptionType("Premium");
				employerSubscriptionDomain.setQuantity(subscriptionDomain.getPremiumQuantity());
			}
			else{
				employerSubscriptionDomain.setSubscriptionType(subscriptionDomain.getPostingType());
				employerSubscriptionDomain.setQuantity(subscriptionDomain.getQuantity());
			}

			employerSubscriptionDomain.setEmployerDomain(companyDomain);
			Set<EmployerSubscriptionDomain> es=new HashSet<EmployerSubscriptionDomain>();
			es.add(employerSubscriptionDomain);

			companyService.createCompanySubscription(employerSubscriptionDomain);
			//automatically get updated... 
			// connect to payment ...
			// create order table.. and save payment datas...

			//deleting data form session

			session.setAttribute("sid",null);
			session.setAttribute("amount", null);	
			session.setAttribute("taxAmt", null);	
			session.setAttribute("totalAmt", null);	
			//Set<EmployerSubscriptionDomain> empSubDomainSet=companyDomain.getSubscriptionRecords();


			session.setAttribute("employer", companyDomain);

			//setting quick count
			List<EmployerSubscriptionDomain> quickList = companyService.getCompanySubscriptionBasedOnType("Quick",companyDomain.getCompanyKey());
			List<EmployerSubscriptionDomain> premiumList = companyService.getCompanySubscriptionBasedOnType("Premium",companyDomain.getCompanyKey());
			List<EmployerSubscriptionDomain> powerList = companyService.getCompanySubscriptionBasedOnType("Power",companyDomain.getCompanyKey());

			session.setAttribute("quickCount", countSubscription(quickList));
			session.setAttribute("premiumCount", countSubscription(premiumList));
			session.setAttribute("powerCount", countSubscription(powerList));
			txt="0";
			model.addAttribute("msg", "Congratulations Your order taken...");
			logger.debug("end employerOrderLogin.do");

		}else{
			txt="1";
			model.addAttribute("wrongEmailOrPassword", "Wrong UserId Or Password");
			logger.debug("end employerOrderLogin.do");
		}
		
		response.setContentType("text/html");
		try {
			System.out.println("inside print writer");
			response.getWriter().write(txt);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}


	@RequestMapping(value = "getDistricts.do",method={RequestMethod.GET,RequestMethod.POST})
	public void getDistricts(Model model,HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		System.out.println("in getDistricts method mapping----");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String stateName=request.getParameter("stateName");
		List<String> districtsList= databaseCommUtil.getDistrictList(stateName);

		JSONArray jsonArr=new JSONArray();
		JSONObject result = new JSONObject();

		for (String  dist: districtsList) {
			jsonArr.put(dist);
		}

		try {
			result.put("list", jsonArr);
		} catch (JSONException e1) {
			e1.printStackTrace();
		}
		try {
			response.getWriter().write(result.toString());
		} catch (IOException e) {
			try {
				response.getWriter().write("Not Found");
			} catch (IOException e1) {
				e.printStackTrace();
			}

			e.printStackTrace();
		}

	}
	public int countSubscription(List<EmployerSubscriptionDomain> list){
		int count=0;
		for (EmployerSubscriptionDomain employerSubscriptionDomain : list) {
			count += employerSubscriptionDomain.getQuantity();
		}
		return count;
	}

	@RequestMapping(value={"CheckUserEmailExist.do"},method={RequestMethod.GET,RequestMethod.POST})
	public void checkUserEmail(HttpServletRequest request,HttpServletResponse response){
		String email=request.getParameter("email");
		EmployerDomain domain=null;
		if(email!=null && !email.isEmpty()){
			domain=companyService.forGotpassword(email);
		}

		response.setContentType("text/html");
		try {
			if(domain!=null){
				logger.debug(domain.getEmail()+"Email exist");
				response.getWriter().print("A");

			}
			else{
				response.getWriter().print("D"); 
			}
		} 
		catch (IOException e) {
			e.printStackTrace();
		}


	}
	
	@RequestMapping(value={"/buySubscription.do"},method={RequestMethod.GET,RequestMethod.POST})
	public String buySubscription(Model model,HttpServletRequest request,HttpSession session){
		
		logger.debug("inside buySubscription.do");
		EmployerDomain companyDomain=(EmployerDomain)session.getAttribute("employer");
		//checking if employer already loged in then directly goes to conform page... 
		if(companyDomain != null ){
		

		Integer sid=Integer.parseInt((session.getAttribute("sid")).toString());
		SubscriptionDomain subscriptionDomain=jobService.getSubscription(sid);

		//setting subscription details

		EmployerSubscriptionDomain employerSubscriptionDomain=new EmployerSubscriptionDomain();

		employerSubscriptionDomain.setEmployerDomain(companyDomain);

		//counting expiry date 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		c.setTime(new Date()); // Now use today date.
		c.add(Calendar.DATE, subscriptionDomain.getValidityDays()); // Adding days
		String validityDate= sdf.format(c.getTime());
		//expiry date end
		employerSubscriptionDomain.setCreatetsDate(new Timestamp(new java.util.Date().getTime()));		
		employerSubscriptionDomain.setExpiry(validityDate);
		employerSubscriptionDomain.setStatus('A');
		employerSubscriptionDomain.setSid(sid);

				if(subscriptionDomain.getPostingType().equals("Package") && subscriptionDomain.getPremiumQuantity() > 0){
		
		
					employerSubscriptionDomain.setSubscriptionType("Premium");
					employerSubscriptionDomain.setQuantity(subscriptionDomain.getPremiumQuantity());
		
					//for resume access subscription validity...
					EmployerSubscriptionDomain employerSubscriptionDomain1=new EmployerSubscriptionDomain();
					employerSubscriptionDomain1.setCreatetsDate(new Timestamp(new java.util.Date().getTime()));		
					employerSubscriptionDomain1.setExpiry(validityDate);
					employerSubscriptionDomain1.setStatus('A');
					employerSubscriptionDomain1.setSid(sid);
					employerSubscriptionDomain1.setSubscriptionType(subscriptionDomain.getPostingType());
					employerSubscriptionDomain1.setQuantity(0);
		
		
					employerSubscriptionDomain1.setEmployerDomain(companyDomain);
					Set<EmployerSubscriptionDomain> es=new HashSet<EmployerSubscriptionDomain>();
					es.add(employerSubscriptionDomain1);
		
					companyService.createCompanySubscription(employerSubscriptionDomain1);
		
		
				}else{
					employerSubscriptionDomain.setSubscriptionType(subscriptionDomain.getPostingType());
					employerSubscriptionDomain.setQuantity(subscriptionDomain.getQuantity());
				}

		employerSubscriptionDomain.setEmployerDomain(companyDomain);
		Set<EmployerSubscriptionDomain> es=new HashSet<EmployerSubscriptionDomain>();
		es.add(employerSubscriptionDomain);

		companyService.createCompanySubscription(employerSubscriptionDomain);
		logger.debug("companySubscription created ");
		//automatically get updated... 
		// connect to payment ...
		// create order table.. and save payment datas...


		//deleting data from session...
		session.setAttribute("sid",null);
		session.setAttribute("amount", null);	
		session.setAttribute("taxAmt", null);	
		session.setAttribute("totalAmt", null);	

		logger.debug("end takeCompanyOrder.do");
			session.setAttribute("employer", companyDomain);
			//setting quick count
			List<EmployerSubscriptionDomain> quickList = companyService.getCompanySubscriptionBasedOnType("Quick",companyDomain.getCompanyKey());
			List<EmployerSubscriptionDomain> premiumList = companyService.getCompanySubscriptionBasedOnType("Premium",companyDomain.getCompanyKey());
			List<EmployerSubscriptionDomain> powerList = companyService.getCompanySubscriptionBasedOnType("Power",companyDomain.getCompanyKey());

			session.setAttribute("quickCount", countSubscription(quickList));
			session.setAttribute("premiumCount", countSubscription(premiumList));
			session.setAttribute("powerCount", countSubscription(powerList));

			model.addAttribute("msg","<b>Thanks for subscription</b>.");

			return "homeCompany";
		}else{
			model.addAttribute("msg","Error.. placing order please login first");
			return "home";
		}
	}

	@RequestMapping(value={"getAllEmployers.do"},method={RequestMethod.GET,RequestMethod.POST})
	public void  getAllEmployers(Model model,HttpServletRequest request,HttpServletResponse response){
		List<EmployerDomain> allemployers= companyService.getEmployer();
		model.addAttribute("allEmployers", allemployers);
		JSONObject result =new JSONObject();
		JSONArray array=new JSONArray();

		for (int i = 0; i < allemployers.size(); i++) {
			JSONArray ja=new JSONArray();
			ja.put(allemployers.get(i).getCompanyKey());
			ja.put(allemployers.get(i).getName());
			ja.put(allemployers.get(i).getEmail());
			array.put(ja);
		}

		try {
			result.put("iTotalRecords", allemployers.size());
			result.put("list", array);
			response.setContentType("application/json");
			response.setHeader("Cache-Control", "no-store");
			response.getWriter().write(result.toString());
		} catch (JSONException e) {
			e.printStackTrace();
		}
		catch (IOException e) {
			e.printStackTrace();
		}

	}

}
