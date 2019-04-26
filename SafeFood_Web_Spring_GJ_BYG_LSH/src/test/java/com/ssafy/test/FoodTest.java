package com.ssafy.test;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.assertThat;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.config.ApplicationConfig;
import com.ssafy.model.dto.Food;
import com.ssafy.service.FoodService;

@RunWith(SpringRunner.class)
@Transactional
@ContextConfiguration(classes = {ApplicationConfig.class})
public class FoodTest {

	
	@Autowired
	FoodService service;
	
	@Test
	public void test() {
		//fail("Not yet implemented");
		//assertThat(service, is(notNullValue()));
//		List<Food> list =service.selectAll();
//		assertThat(list.size(), is(not(0)));
		List<Food> list =service.selectMyfoodAll("ssafy@ssafy.com");
		assertThat(list.size(), is(not(0)));
	}
	
	@Test
	public void insert() {
		//fail("Not yet implemented");
		//assertThat(service, is(notNullValue()));
		int result=service.insertMyfood("ish@naver.com", "11", 1);
		assertThat(result, is(not(-1)));
	}
	
	@Test
	public void select() {
		//fail("Not yet implemented");

		//Food food =service.selectCode(1);
		//assertThat(food, is(notNullValue()));
		
//		List<Food> list =service.selectName("라면");
//		assertThat(list.size(), is(not(0)));
		
	}
	

}
