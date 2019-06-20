package com.ssafy;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Service;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.dto.Board;
import com.ssafy.service.BoardService;

@RunWith(SpringRunner.class)
@SpringBootTest
@Transactional
public class SafeFoodBootGj02ApplicationTests {
	
	@Autowired
	BoardService service;

	@Test
	public void contextLoads() {
		for(Board b :service.selectPage(1))
			System.out.println(b);
		assertThat(service.selectPage(1).size(),is(not(0)));
	}

}
