package com.web.spring.service;
	
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.web.spring.model.UserLogs;
import com.web.spring.repository.UserLogsRepository;
@Service
public class UserLogsService {
	@Autowired
	private UserLogsRepository ulcrud;
	
	public List<UserLogs> getAllLogs(){
		List<UserLogs> userlg = new ArrayList<UserLogs>();
		for (UserLogs userlogs : (List<UserLogs>) ulcrud.findAll()) {
			userlg.add(userlogs);	
		}		
		return userlg;
	}
	
	public void storeUserData(String name, String change,String date){		
		UserLogs ulg = new UserLogs();
		ulg.setUname(name);
		ulg.setChanged(change);
		ulg.setDate(date);	
		ulcrud.save(ulg);	
	}
	
	
}
