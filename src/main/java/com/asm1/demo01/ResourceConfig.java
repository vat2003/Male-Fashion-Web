package com.asm1.demo01;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;

import com.asm1.demo01.Service.CartItemService;
import com.asm1.demo01.Service.CartItemServiceImpl;
import com.asm1.demo01.Service.CartService;
import com.asm1.demo01.Service.CartServiceImpl;

@Configuration
@EntityScan("com.asm1.demo01.model")

public class ResourceConfig {
	@Bean("messageResource")
	public MessageSource getMessageSource() {
		ReloadableResourceBundleMessageSource ms = new ReloadableResourceBundleMessageSource();
		ms.setBasenames("classpath:messages/mess");
		ms.setDefaultEncoding("utf-8");
		return ms;
	}

	@Bean
	public LocalValidatorFactoryBean getValidator() {
		LocalValidatorFactoryBean bean = new LocalValidatorFactoryBean();
		bean.setValidationMessageSource(getMessageSource());
		return bean;
	}

	@Bean
	public CartItemService cartItemService() {
		return new CartItemServiceImpl();
	}

	@Bean
	public CartService cartService() {
		return new CartServiceImpl();
	}

}
