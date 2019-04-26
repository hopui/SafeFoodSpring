package com.ssafy.test;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.assertThat;

import java.util.List;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.config.ApplicationConfig;
import com.ssafy.model.dto.Account;
import com.ssafy.service.AccountService;

@RunWith(SpringRunner.class)
@Transactional
@ContextConfiguration(classes = {ApplicationConfig.class})
public class AccountTest
{
	@Autowired
	AccountService service;
	
	@Test
	public void testService()
	{
		assertThat(service, is(notNullValue()));
	}
	
	@Test
	public void testSelect()
	{
		Account account = service.select("ssafy@ssafy.com");
		assertThat(account, is(notNullValue()));
	}
	
	@Test
	public void testSelectAllUser()
	{
		List<Account> list = service.selectAll();
		assertThat(list.size(), not(0));
	}
	
	@Test
	public void testInsert()
	{
		Account account = new Account("yunki@naver.com", "1234", "yunki", "광주광역시", "010-5882-9543", new String[] {"대두","우유"});
		int result = service.join(account);
		assertThat(result, is(1));
	}
	@Test
	public void testUpdate()
	{
		Account account = new Account("ish@naver.com", "1234", "수현이의분신", "광주광역시", "010-5882-9543", new String[] {"대두","우유"});
		int result = service.update(account);
		assertThat(result, is(1));
	}
	@Test
	public void testDelete()
	{
		int result = service.delete("ish@naver.com");
		assertThat(result, is(1));
	}
}
