package com.ssafy.config;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.ssafy.repository.UserRepo;
import com.ssafy.repository.FoodRepo;
import com.ssafy.repository.TakenFoodRepo;
import com.ssafy.service.UserService;
import com.ssafy.service.FoodService;
import com.ssafy.service.TakenFoodService;

@Configuration
@ComponentScan(basePackageClasses = { UserRepo.class })
/* @EnableAspectJAutoProxy */ // AOP를 쓰지 않으므로 주석해뒀음
@EnableTransactionManagement
@PropertySource({ "classpath:/config.properties" })
public class ApplicationConfig
{//
	@Bean
	public UserService accountService(UserRepo repo)
	{
		UserService service = new UserService(repo);
		return service;
	}

	@Bean
	public FoodService foodService(FoodRepo repo)
	{
		FoodService service = new FoodService(repo);
		return service;
	}
	
	@Bean
	public TakenFoodService takenFoodService(TakenFoodRepo repo)
	{
		TakenFoodService service = new TakenFoodService(repo);
		return service;
	}

	@Bean
	public DataSource ds(
			@Value("${db.driverClassName}") String driver, 
			@Value("${db.url}") String url,
			@Value("${db.userName}") String user,
			@Value("${db.password}") String pass)
	{
		DriverManagerDataSource ds = new DriverManagerDataSource();
		ds.setDriverClassName(driver);
		ds.setUrl(url);
		ds.setUsername(user);
		ds.setPassword(pass);
		return ds;
	}

	@Bean
	public SqlSessionFactoryBean sqlSessionFactoryBean(DataSource ds, ApplicationContext ctx)
	{
		SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
		bean.setDataSource(ds);
		String location = "classpath:/mybatis/mybatis_config.xml";
		bean.setConfigLocation(ctx.getResource(location));
		return bean;
	}

	@Bean
	public SqlSessionTemplate template(SqlSessionFactoryBean factory) throws Exception
	{
		SqlSessionTemplate template = new SqlSessionTemplate(factory.getObject());
		return template;
	}

	@Bean
	public PlatformTransactionManager transactionManager(DataSource ds)
	{
		return new DataSourceTransactionManager(ds);
	}
}