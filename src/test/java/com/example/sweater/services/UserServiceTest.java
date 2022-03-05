package com.example.sweater.services;

import com.example.sweater.domain.Role;
import com.example.sweater.domain.User;
import com.example.sweater.repos.UserRepo;
import junit.framework.TestCase;
import org.hamcrest.CoreMatchers;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentMatchers;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Collections;

import static org.mockito.Mockito.doReturn;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UserServiceTest extends TestCase {
  @Autowired
  private UserService userService;

  @MockBean
  private UserRepo userRepo;
  @MockBean
  private MailSender mailSender;
  @MockBean
  private PasswordEncoder passwordEncoder;

  @Test
  public void testAddUser() {
    User user = new User();

    user.setEmail("some@app.com");

    boolean isUserCreated = userService.addUser(user);

    Assert.assertTrue(isUserCreated);
    Assert.assertNotNull(user.getActivationCode());
    Assert.assertTrue(CoreMatchers.is(user.getRoles()).matches(Collections.singleton(Role.USER)));

    Mockito.verify(userRepo, Mockito.times(1)).save(user);
    Mockito.verify(mailSender, Mockito.times(1)).send(
      ArgumentMatchers.eq(user.getEmail()),
      ArgumentMatchers.eq("Activation code"),
      ArgumentMatchers.contains("Welcome to Sweater!")
    );
  }

  @Test
  public void testUserFailed() {
    User user = new User();

    user.setUsername("John");

    doReturn(new User())
      .when(userRepo)
      .findByUsername("John");

    boolean isUserCreated = userService.addUser(user);
    Assert.assertFalse(isUserCreated);

    Mockito.verify(userRepo, Mockito.times(0)).save(ArgumentMatchers.any(User.class));
    Mockito.verify(mailSender, Mockito.times(0)).send(
      ArgumentMatchers.anyString(),
      ArgumentMatchers.anyString(),
      ArgumentMatchers.anyString()
    );
  }

  @Test
  public void testActivateUser() {
    User user = new User();
    user.setActivationCode("bingo");

    Mockito.doReturn(user)
      .when(userRepo)
      .findByActivationCode("activate");

    boolean isUserActivated = userService.activateUser("activate");

    Assert.assertTrue(isUserActivated);
    Assert.assertNull(user.getActivationCode());

    Mockito.verify(userRepo, Mockito.times(1)).save(user);
  }

  @Test
  public void testActivateUserFail() {
    boolean isUserActivated = userService.activateUser("activate");
    Assert.assertFalse(isUserActivated);

    Mockito.verify(userRepo, Mockito.times(0)).save(ArgumentMatchers.any(User.class));
  }
}