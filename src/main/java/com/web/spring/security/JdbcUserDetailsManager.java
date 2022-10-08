package com.web.spring.security;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.userdetails.jdbc.JdbcDaoImpl;
import org.springframework.security.provisioning.GroupManager;
import org.springframework.security.provisioning.UserDetailsManager;

public class JdbcUserDetailsManager extends JdbcDaoImpl implements UserDetailsManager,
GroupManager {

	public static final String DEF_UPDATE_USER_SQL = "update users set password = ?, enabled = ? where username = ?";	
	private String updateUserSql = DEF_UPDATE_USER_SQL;
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void createUser(UserDetails user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateUser(final UserDetails user) {
		//validateUserDetails(user);
		getJdbcTemplate().update(updateUserSql, new PreparedStatementSetter() {
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, user.getPassword());
				ps.setBoolean(2, false);
				ps.setString(3, user.getUsername());
			}

		
		});
	}

	@Override
	public void deleteUser(String username) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void changePassword(String oldPassword, String newPassword) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean userExists(String username) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<String> findAllGroups() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> findUsersInGroup(String groupName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void createGroup(String groupName, List<GrantedAuthority> authorities) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteGroup(String groupName) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void renameGroup(String oldName, String newName) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addUserToGroup(String username, String group) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeUserFromGroup(String username, String groupName) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<GrantedAuthority> findGroupAuthorities(String groupName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addGroupAuthority(String groupName, GrantedAuthority authority) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeGroupAuthority(String groupName, GrantedAuthority authority) {
		// TODO Auto-generated method stub
		
	}

}
