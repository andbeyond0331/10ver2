package com.model2.mvc.web.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;


//==> 회원관리 RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method 구현 않음
		
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/addUser", method=RequestMethod.POST )
	public User addUser(	@RequestBody User user) throws Exception{
	
		System.out.println("/user/json/addUser : POST");
		//Business Logic
		System.out.println("::"+user);
		userService.addUser(user);
		
		
		
		return user;
	}
	
	@RequestMapping( value="json/getUser/{userId}", method=RequestMethod.GET )
	public User getUser( @PathVariable String userId ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		
		//Business Logic
		return userService.getUser(userId);
	}
	
	@RequestMapping( value="json/updateUser", method=RequestMethod.POST )
	public User updateUser(	@RequestBody User user) throws Exception{
	
		System.out.println("/user/json/updateUser : POST");
		//Business Logic
		System.out.println("::"+user);
		userService.updateUser(user);
		
		
		
		return user;
	}

	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public User login(	@RequestBody User user,
									HttpSession session ) throws Exception{
	
		System.out.println("/user/json/login : POST");
		//Business Logic
		System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		
		return dbUser;
	}
	
//	@RequestMapping( value="json/checkDuplication", method=RequestMethod.POST )
//	public User checkDuplication(	@RequestBody String userId,
//									HttpSession session ) throws Exception{
//	
//		System.out.println("/user/json/login : POST");
//		//Business Logic
//		System.out.println("::"+userId);
//		userService.checkDuplication(userId);
//		
//		
//		return userService.getUser(userId);
//	}
	
	@RequestMapping( value="json/listUser")
	public Map<String, Object> listUser(@RequestBody Search search) throws Exception {
		
		System.out.println("/user/json/listUser : POST/GET");
		
		//Business Logic
		
		return userService.getUserList(search);
	}
	
}