package com.web.spring.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.web.spring.model.UserLogs;;
@Repository
public interface UserLogsRepository extends CrudRepository<UserLogs,Integer>{
	 
}
