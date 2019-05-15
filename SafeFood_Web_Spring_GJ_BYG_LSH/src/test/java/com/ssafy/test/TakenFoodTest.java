package com.ssafy.test;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.config.ApplicationConfig;
import com.ssafy.model.dto.TakenFood;
import com.ssafy.service.TakenFoodService;
@Transactional
@RunWith(SpringRunner.class)
@ContextConfiguration(classes = {ApplicationConfig.class})
public class TakenFoodTest
{
	@Autowired
	TakenFoodService service;
	@Test
	public void testService()
	{
		assertThat(service, is(notNullValue()));
	}
	@Test
	public void testTop3() {
		List<Map<String, Object> > list = service.selectTop3Foods("ssafy@ssafy.com");
		for(Map<String, Object> item : list) {
			item.entrySet().forEach(entry -> System.out.println(entry.getKey()+":"+entry.getValue()));
		}
		assertThat(list.size(), not(0));
	}
}
