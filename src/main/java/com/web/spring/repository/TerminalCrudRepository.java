package com.web.spring.repository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.web.spring.model.Terminal;
@Repository
public interface TerminalCrudRepository extends CrudRepository<Terminal,Integer>{

}
