package com.techNarayana.ejobzz.daoImpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.techNarayana.ejobzz.dao.AdminDao;
import com.techNarayana.ejobzz.domain.EmployerDomain;

@Repository
@Transactional
public class AdminDaoImpl implements AdminDao {

	@Autowired
	public SessionFactory sessionfactory;

	@Override
	public List<EmployerDomain> getEmployer() {
		Criteria cr=sessionfactory.getCurrentSession().createCriteria(EmployerDomain.class);
		List<EmployerDomain> allemployr=(List<EmployerDomain>)cr.list();
		return allemployr;
	}
}
