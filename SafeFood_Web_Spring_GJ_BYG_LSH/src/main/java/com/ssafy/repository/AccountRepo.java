package com.ssafy.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.Account;

@Repository
public class AccountRepo
{
	private static final Logger logger = LoggerFactory.getLogger(AccountRepo.class);
	private static final String ns = "com.ssafy.model.mapper.Account.";

	@Autowired
	SqlSessionTemplate template;

	public List<Account> selectAllUsers()
	{
		String statement = ns + "selectAllUsers";
		return template.selectList(statement);
	}

	public Account select(String email)
	{
		String statement = ns + "select";
		return template.selectOne(statement, email);
	}

	public int insert(Account account)
	{
		String statement = ns + "insert";
		return template.insert(statement, account);
	}

	public int update(Account account)
	{
		String statement = ns + "update";
		return template.update(statement, account);
	}

	public int delete(String email)
	{
		String statement = ns + "delete";
		return template.update(statement, email);
	}
}