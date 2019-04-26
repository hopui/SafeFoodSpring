package com.ssafy.test;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.*;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.ssafy.config.ApplicationConfig;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = {ApplicationConfig.class})
public class DataTest
{
	@Value("${db.driverClassName}") 
	String driver;

	@Autowired
	DataSource ds;
	
	@Test
	public void testDriver()
	{
		assertThat(driver, is("com.mysql.cj.jdbc.Driver"));
	}

	@Test
	public void testDataSource()
	{
		assertThat(ds, is(notNullValue()));
	}
}