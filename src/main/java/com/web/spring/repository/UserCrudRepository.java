package com.web.spring.repository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.web.spring.model.Authorities;
import com.web.spring.model.Terminal;
import com.web.spring.model.UserRegistration;
@Repository
public interface UserCrudRepository extends CrudRepository<UserRegistration,String>{
			
}
