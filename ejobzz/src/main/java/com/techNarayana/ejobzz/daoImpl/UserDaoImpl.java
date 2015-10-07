package com.techNarayana.ejobzz.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.techNarayana.ejobzz.dao.UserDao;
import com.techNarayana.ejobzz.domain.UserDomain;
import com.techNarayana.ejobzz.dto.UserDTO;
@Repository
@Transactional
public class UserDaoImpl implements UserDao{
	
	@Autowired
	public SessionFactory sessionfactory;
	
	@Override
	public UserDomain getUser(UserDTO dto) {
		@SuppressWarnings("unchecked")
		List<UserDomain> userList =  sessionfactory.getCurrentSession().createQuery("FROM UserDomain user WHERE user.username ='"+dto.getUsername()+"' AND user.password='"+dto.getPassword()+"'").list();
		UserDomain userDo=null;
		for (UserDomain userDomain : userList) {
			userDo=new UserDomain();
			userDo.setId(userDomain.getId());
			userDo.setUsername(userDomain.getUsername());
			userDo.setPassword(userDomain.getPassword());
		}
		return userDo;
	}
}
