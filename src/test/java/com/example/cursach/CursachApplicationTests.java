package com.example.cursach;

import com.example.cursach.controllers.UserController;
import com.example.cursach.repositories.UserRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.junit.runner.RunWith;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.authenticated;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
class CursachApplicationTests {
	@Autowired
	private MockMvc mockMvc;
	@Autowired
	private UserController controller;
	@Autowired
	private UserRepository repository;
	@Test
	public void isControllerExist() throws Exception {
		assertThat(controller).isNotNull();
	}
	@Test
	public void isStringContain() throws Exception {
		this.mockMvc.perform(get("/"))
				.andDo(print())
				.andExpect(status().isOk())
				.andExpect(content().string(containsString("Цветочная мастерская | Город Москва")));
	}
	@Test
	public void loginTest() throws Exception {
		this.mockMvc.perform(get("/products-info"))
				.andExpect(status().is3xxRedirection())
				.andExpect(redirectedUrl("http://localhost/login"));
	}
	@WithUserDetails("tsvetkova.e.a@edu.mirea.ru")
	@Test
	public void shouldReturnHelloMessage() throws Exception {
		this.mockMvc.perform(get("/"))
				.andDo(print())
				.andExpect(status().isOk())
				.andExpect(authenticated())
				.andExpect(content().string(containsString("erica")));
	}
	@Test
	void findUser() {
		assertThat(repository.findByEmail("tsvetkova.e.a@edu.mirea.ru"))
				.hasToString("User(id=1, email=tsvetkova.e.a@edu.mirea.ru, phoneNumber=+79777478280, " +
						"name=erica, active=true, password=$2a$08$aLwJRGUXMS3XtUNyfrircO5LB0ffSEZD7xxZ9EOM7zwDLyOEDi.Ta," +
						"											 roles=[ROLE_USER], products=[], dateOfCreated=2023-09-27T11:18:10.269941, shoppingCarts=[])");
	}
}
