package com.techNarayana.ejobzz.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techNarayana.ejobzz.dao.UserDao;
import com.techNarayana.ejobzz.domain.UserDomain;
import com.techNarayana.ejobzz.dto.UserDTO;
import com.techNarayana.ejobzz.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserDao userDao;
	
	public UserDomain getUser(UserDTO dto){
		return userDao.getUser(dto);
	}
}
