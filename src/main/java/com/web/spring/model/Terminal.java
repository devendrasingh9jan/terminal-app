package com.web.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name="terminal")
@DynamicUpdate
public class Terminal {
	//create table terminal(tid int primary key,tname varchar2(20),
	//ename varchar2(20),etype varchar2(20),url varchar(200),USERNAME VARCHAR2(20),PASSWORD VARCHAR2(20));	
 @Id
 @GeneratedValue(strategy=GenerationType.AUTO)
 //@GeneratedValue(strategy=GenerationType.SEQUENCE,generator = "tid_generator")
 //@SequenceGenerator(name="tid_generator", initialValue = 1, allocationSize = 1, sequenceName = "tid_seq")
 @Column(name="tid")
 int tid;
 String tname;
 String ename;
 String etype;
 String url;
 String tusername;
 String tpassword;
 
 public Terminal() {
	 
 }

public int getTid() {
	return tid;
}
public void setTid(int tid) {
	this.tid = tid;
}
public String getTname() {
	return tname;
}
public void setTname(String tname) {
	this.tname = tname;
}
public String getEname() {
	return ename;
}
public void setEname(String ename) {
	this.ename = ename;
}
public String getEtype() {
	return etype;
}
public void setEtype(String etype) {
	this.etype = etype;
}
public String getUrl() {
	return url;
}
public void setUrl(String url) {
	this.url = url;
}
public String getUsername() {
	return tusername;
}
public void setUsername(String tusername) {
	this.tusername = tusername;
}
public String getPassword() {
	return tpassword;
}
public void setPassword(String tpassword) {
	this.tpassword = tpassword;
}
 
 
}
