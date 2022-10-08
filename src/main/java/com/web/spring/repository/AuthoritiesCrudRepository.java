package com.web.spring.repository;

import org.springframework.data.repository.CrudRepository;

import com.web.spring.model.Authorities;

public interface AuthoritiesCrudRepository extends CrudRepository<Authorities,String>  {

}
