package com.web.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.web.spring.model.UserRegistration;
import com.web.spring.model.Authorities;
import com.web.spring.repository.AuthoritiesCrudRepository;
import com.web.spring.repository.UserCrudRepository;

@Service
public class UserService {
	@Autowired
	private UserCrudRepository ucrud;
	@Autowired
	private AuthoritiesCrudRepository acrud;

	public List<UserRegistration> getAllUsers() {
		List<UserRegistration> user = new ArrayList<UserRegistration>();
		for (UserRegistration users : (List<UserRegistration>) ucrud.findAll()) {
			// System.out.println("user
			// id:"+users.getUsername()+"enabled"+users.getEnabled());
			user.add(users);

		}
		return user;
	}

	public List<Authorities> getAllUserRegistration() {
		List<Authorities> auth = new ArrayList<Authorities>();

		for (Authorities authr : (List<Authorities>) acrud.findAll()) {

			auth.add(authr);

		}
		return auth;
	}

	public UserRegistration getUsersById(String id) {
		return ucrud.findById(id).get();
	}

	public Authorities getRoleById(String id) {
		return acrud.findById(id).get();
	}

	public boolean getProfileById(String id) {
		return ucrud.findById(id).get().isProfile();
	}

	public void setProfileById(String id) {
		UserRegistration obj = ucrud.findById(id).get();
		if (obj.isProfile() == false) {
			obj.setProfile(true);
		} else
			obj.setProfile(false);
		ucrud.save(obj);
	}

	public void deleteUserbyId(String id) {
		acrud.deleteById(id);
		ucrud.deleteById(id);
	}

	public void enableUser(UserRegistration usr, String id) throws Exception {
		UserRegistration obj = ucrud.findById(id).get();
		if (obj.getEnabled() == false) {
			System.out.println("enabled" + obj.getEnabled());
			obj.setEnabled(true);
			ucrud.save(obj);
		}

		else {
			throw new Exception("User already Approved.");

		}
	}

	public void markAdmin(Authorities auth, String id) throws Exception {
		Authorities obj = acrud.findById(id).get();
		obj.setAuthority("ROLE_ADMIN");
		acrud.save(obj);
	}

	public void removeAdmin(Authorities auth, String id) throws Exception {
		Authorities obj = acrud.findById(id).get();

		obj.setAuthority("ROLE_USER");
		acrud.save(obj);
	}

	public void changePassword(UserRegistration usr, String id, String pass) throws Exception {
		UserRegistration obj = ucrud.findById(id).get();
		obj.setPassword(pass);
		ucrud.save(obj);
	}

	public void setphoneNo(String id, String phone) {
		UserRegistration obj = ucrud.findById(id).get();
		obj.setPhone(phone);
		ucrud.save(obj);
	}

	public void disableUser(UserRegistration usr,String id) throws Exception{		
		UserRegistration obj = ucrud.findById(id).get();
		if(obj.getEnabled()== true) {
		obj.setEnabled(false);
		ucrud.save(obj);}	
		
		else {
			throw new Exception("User already Disabled.");
	
		}
		
	}

	public void saveImage(String id, String string) throws Exception{		
		UserRegistration obj = ucrud.findById(id).get();
		obj.setProfileImage(string.getBytes());	 
		ucrud.save(obj);
    }	
	
	public byte[] getProfileImagebyId(String id) {

		return ucrud.findById(id).get().getProfileImage();
	}
}
