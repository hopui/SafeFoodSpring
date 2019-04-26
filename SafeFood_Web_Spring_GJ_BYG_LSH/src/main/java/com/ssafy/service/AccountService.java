package com.ssafy.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.model.dto.Account;
import com.ssafy.repository.AccountRepo;

@Service
@Transactional
public class AccountService
{
	private static final Logger logger = LoggerFactory.getLogger(AccountService.class);

	@Autowired
	private AccountRepo accountRepo;

	public AccountService(AccountRepo repo)
	{
		accountRepo = repo;
	}

	public Account login(String email, String pass)
	{
		Account account = accountRepo.select(email);
		logger.trace("login: {}", account);
		if (account != null && account.getPassword().equals(pass))
		{
			return account;
		} else
		{
			return null;
		}
	}

	public Account select(String id)
	{
		logger.trace("select: {}",id);
		return accountRepo.select(id);
	}

	public List<Account> selectAll()
	{
		logger.trace("selectAll");
		return accountRepo.selectAllUsers();
	}

	@Transactional
	public int join(Account account)
	{
		int result = accountRepo.insert(account);
		Account selected = accountRepo.select(account.getEmail());
		logger.trace("join: {}", selected);
		return result;
	}

	@Transactional
	public int update(Account account)
	{
		logger.trace("update: {}", account);
		return accountRepo.update(account);
	}

	@Transactional
	public int delete(String email)
	{
		logger.trace("delete: {}", email);
		return accountRepo.delete(email);
	}

	public AccountRepo getAccountRepo()
	{
		return accountRepo;
	}
}
