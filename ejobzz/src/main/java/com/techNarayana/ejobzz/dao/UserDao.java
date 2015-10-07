package com.techNarayana.ejobzz.dao;

import com.techNarayana.ejobzz.domain.UserDomain;
import com.techNarayana.ejobzz.dto.UserDTO;

public interface UserDao  {
	
	public UserDomain getUser(UserDTO dto);

}
