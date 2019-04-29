package com.ssafy.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.ssafy.controller.FoodController;
import com.ssafy.controller.UserController;
@Configuration
@EnableWebMvc
@ComponentScan(basePackageClasses = {FoodController.class})
public class MVCConfig extends WebMvcConfigurerAdapter
{
	@Bean
	public ViewResolver internalResourceViewResolver()
	{
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/view/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry)
	{
		// 요청 경로와 실제 파일의 경로를 연결
		registry.addResourceHandler("/static/**").addResourceLocations("/WEB-INF/static/");
	}
	
	//개별적으로 mapping을 만들어서 처리할 필요가 없는 요청 처리
		@Override
		public void addViewControllers(ViewControllerRegistry registry) {
			registry.addViewController("/index.jsp").setViewName("/main");
		}
}
