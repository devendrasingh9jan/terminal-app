package com.web.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.spring.model.Terminal;
import com.web.spring.repository.TerminalCrudRepository;
@Service
public class TerminalService {
	@Autowired
	private TerminalCrudRepository tcrud;
	
	public List<Terminal> getAllTerminals(){
		List<Terminal> term = new ArrayList<Terminal>();
		for (Terminal terminal : (List<Terminal>) tcrud.findAll()) {
			term.add(terminal);	
		}		
		return term;
	}
	
	public Terminal getTerminalsById(Integer id) {
		return tcrud.findById(id).get();
	}
	
	public void deleteTerminalbyId(Integer id) {
		tcrud.deleteById(id);
	}
	
	public void addTerminal(Terminal trm){		
		tcrud.save(trm);	
	}
	
	public void UpdateTerminal(Terminal trm,int id){		
		Terminal obj = tcrud.findById(id).get();
		obj.setEname(trm.getEname());
		obj.setEtype(trm.getEtype());
		obj.setPassword(trm.getPassword());
		obj.setTname(trm.getTname());
		obj.setUrl(trm.getUrl());
		obj.setUsername(trm.getUsername());
		tcrud.save(obj);	
	}
	
	
	public Terminal getTerminalByID(int id) {		
		return tcrud.findById(id).get();
	}	
	
	
}
