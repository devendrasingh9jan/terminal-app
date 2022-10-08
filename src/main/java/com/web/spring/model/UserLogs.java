package com.web.spring.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name="UserLogs")
@DynamicUpdate
public class UserLogs {
	 @Id
	 @Column(name="id")
	 @GeneratedValue(strategy=GenerationType.AUTO)
	 int id;	 
	 String uname;
	 @Column(length=8000)
	 String changed;
	 String date;

	 public UserLogs(int id, String uname, String changed, String date) {
		super();
		this.id = id;
		this.uname = uname;
		this.changed = changed;
		this.date = date;
	}

	public UserLogs() {	
		}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getChanged() {
		return changed;
	}

	public void setChanged(String changed) {
		this.changed = changed;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "UserLogs [id=" + id + ", uname=" + uname + ", changed=" + changed + ", date=" + date + "]";
	}
	 
	
	 
}
