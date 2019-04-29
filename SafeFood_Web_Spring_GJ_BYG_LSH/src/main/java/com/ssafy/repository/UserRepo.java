package com.ssafy.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.model.dto.User;

@Transactional
@Repository
public class UserRepo
{
	private static final Logger logger = LoggerFactory.getLogger(UserRepo.class);
	private static final String ns = "com.ssafy.model.mapper.User.";

	@Autowired
	SqlSessionTemplate template;

	public List<User> selectAllUsers()
	{
		String statement = ns + "selectAllUsers";
		return template.selectList(statement);
	}

	public User select(String email)
	{
		String statement = ns + "select";
		return template.selectOne(statement, email);
	}
	
	@Transactional
	public int insert(User account)
	{
		String statement = ns + "insert";
		return template.insert(statement, account);
	}
	
	@Transactional
	public int update(User account)
	{
		String statement = ns + "update";
		return template.update(statement, account);
	}
	
	@Transactional
	public int delete(String email)
	{
		String statement = ns + "delete";
		return template.update(statement, email);
	}
}