package com.ssafy.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.model.dto.User;
import com.ssafy.repository.UserRepo;

@Service
@Transactional
public class UserService
{
	private static final Logger logger = LoggerFactory.getLogger(UserService.class);

	@Autowired
	private UserRepo userRepo;

	public UserService(UserRepo repo)
	{
		userRepo = repo;
	}

	public User login(String email, String pass)
	{
		User user = userRepo.select(email);
		logger.trace("login: {}", user);
		if (user != null && user.getPassword().equals(pass))
		{
			return user;
		} else
		{
			return null;
		}
	}

	public User select(String email)
	{
		logger.trace("select: {}",email);
		return userRepo.select(email);
	}

	public List<User> selectAll()
	{
		logger.trace("selectAll");
		return userRepo.selectAllUsers();
	}

	@Transactional
	public int register(User user)
	{
		int result = userRepo.insert(user);
		logger.trace("register: {}", user);
		return result;
	}

	@Transactional
	public int update(User user)
	{
		System.err.println("유저정보: "+user);
		logger.trace("update: {}", user);
		return userRepo.update(user);
	}

	@Transactional
	public int delete(String email)
	{
		logger.trace("delete: {}", email);
		return userRepo.delete(email);
	}

	public UserRepo getUserRepo()
	{
		return userRepo;
	}
}
