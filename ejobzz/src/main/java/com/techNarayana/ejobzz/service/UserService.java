package com.techNarayana.ejobzz.service;

import com.techNarayana.ejobzz.domain.UserDomain;
import com.techNarayana.ejobzz.dto.UserDTO;

public interface UserService{
	public UserDomain getUser(UserDTO dto);
}
