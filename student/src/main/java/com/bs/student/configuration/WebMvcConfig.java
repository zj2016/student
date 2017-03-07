package com.bs.student.configuration;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.velocity.VelocityConfigurer;
import org.springframework.web.servlet.view.velocity.VelocityViewResolver;

import com.bs.student.interceptors.AuthorInterceptor;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"com.bs.student.controller","com.bs.student.interceptors"})
public class WebMvcConfig extends WebMvcConfigurerAdapter{
	
	private final static String CONTENT_TYPE = "text/html;charset=utf-8";

	@Autowired
	private AuthorInterceptor authorInterceptor;
	
	@Override
	public void configureDefaultServletHandling(
			DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//registry.addInterceptor(authorInterceptor).addPathPatterns("/ad/**").excludePathPatterns("/ad/admin/login","/ad/admin/logout");
	}
	
	@Bean
	public VelocityConfigurer getVelocityConfig(){
		Properties properties = new Properties();
		properties.put("input.encoding", "UTF-8");
		properties.put("output.encoding", "UTF-8");
		properties.put("contentType", CONTENT_TYPE);
		
		VelocityConfigurer velocityConfigurer = new VelocityConfigurer();
		velocityConfigurer.setResourceLoaderPath("WEB-INF/views/");
		velocityConfigurer.setVelocityProperties(properties);
		return velocityConfigurer;
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/static/**").addResourceLocations("/static/");
	}
	
	@Bean
	public ViewResolver getViewResolver(){
		
		VelocityViewResolver velocityView = new VelocityViewResolver();
		velocityView.setSuffix(".html");
		velocityView.setAllowRequestOverride(true);
		velocityView.setAllowSessionOverride(true);
		velocityView.setExposeRequestAttributes(true);
		velocityView.setExposeSessionAttributes(true);
		velocityView.setRequestContextAttribute("rc");
		velocityView.setDateToolAttribute("dateTool");
		velocityView.setNumberToolAttribute("numberTool");
		velocityView.setContentType(CONTENT_TYPE);
		return velocityView;
	}
	
	
}
