package com.web.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="authorities")
public class Authorities {
	
	@Id
	/* @GeneratedValue(strategy=GenerationType.AUTO) */
	@Column(name="username")
	@NotNull
	String username;
	@NotNull
	String authority;

	public Authorities() {
		 
    }
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}

	

}
