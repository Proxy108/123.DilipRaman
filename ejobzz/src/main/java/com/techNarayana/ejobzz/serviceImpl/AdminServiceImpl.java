package com.techNarayana.ejobzz.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techNarayana.ejobzz.dao.AdminDao;
import com.techNarayana.ejobzz.domain.EmployerDomain;
import com.techNarayana.ejobzz.service.AdminService;

@Service
@Transactional
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminDao adminDao;
	
	@Override
	public List<EmployerDomain> getEmployer() {
		return adminDao.getEmployer();
	}
}
