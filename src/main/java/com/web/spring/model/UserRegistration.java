package com.web.spring.model;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="users")
public class UserRegistration {
	@Id
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="username")
	private String username;
	private String password;
	@Column(name="enabled", nullable = false, columnDefinition = "BOOLEAN DEFAULT false")
	private boolean enabled;
	@Column(name="account_non_expired", nullable = false, columnDefinition = "BOOLEAN DEFAULT true")
	private boolean accountNonExpired;
	@Column(name="credentials_non_expired", nullable = false, columnDefinition = "BOOLEAN DEFAULT true")
	private boolean credentialsNonExpired;
	@Column(name="account_non_locked", nullable = false, columnDefinition = "BOOLEAN DEFAULT true")
	private boolean accountNonLocked;
	@Column(name="profile", nullable = false, columnDefinition = "BOOLEAN DEFAULT false")
	boolean profile;
	private String phone;
	@Column(name = "profileImage", length = 5024)
	
	private byte[] profileImage;
	
	public byte[] getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(byte[] profileImage) {
		this.profileImage = profileImage;
	}

	@OneToMany(cascade=CascadeType.ALL)
    @JoinColumn(name="username")
   // private Authorities authorities;
	private Set<Authorities> authorities;
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public UserRegistration() {
		 
	 }
	
	public String getUsername() {
		return username;
	}
	public boolean isAccountNonExpired() {
		return accountNonExpired;
	}
	public void setAccountNonExpired(boolean accountNonExpired) {
		this.accountNonExpired = accountNonExpired;
	}
	public boolean isCredentialsNonExpired() {
		return credentialsNonExpired;
	}
	public void setCredentialsNonExpired(boolean credentialsNonExpired) {
		this.credentialsNonExpired = credentialsNonExpired;
	}
	public boolean isAccountNonLocked() {
		return accountNonLocked;
	}
	public void setAccountNonLocked(boolean accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean getEnabled() {
		return enabled;
	}
	public void setEnabled(boolean b) {
		this.enabled = b;
	}

	public boolean isProfile() {
		return profile;
	}

	public void setProfile(boolean profile) {
		this.profile = profile;
	}
	

	@Override
	public String toString() {
		return username;
	}


	public Set<Authorities> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(Set<Authorities> authorities) {
		this.authorities = authorities;
	}
	
	
}
