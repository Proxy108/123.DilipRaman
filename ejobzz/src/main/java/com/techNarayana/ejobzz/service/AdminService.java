package com.techNarayana.ejobzz.service;

import java.util.List;

import com.techNarayana.ejobzz.domain.EmployerDomain;
import com.techNarayana.ejobzz.domain.EmployerSubscriptionDomain;
import com.techNarayana.ejobzz.domain.JobDomain;
import com.techNarayana.ejobzz.dto.EmployerDto;

public interface AdminService {
	
	public List<EmployerDomain> getEmployer();
	
}
