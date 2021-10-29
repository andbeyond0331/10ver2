package com.model2.mvc.web.product;

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
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.user.UserService;


//==> 상품관리 RestController
@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
		
	public ProductRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/getProduct/{prodNo}", method=RequestMethod.GET )
	public Product findProduct( @PathVariable int prodNo ) throws Exception{
		
		System.out.println("/product/json/getProduct : GET");
		
		//Business Logic
		return productService.findProduct(prodNo);
	}
	
	@RequestMapping( value="json/addProduct")
	public Product addProduct(@RequestBody Product product ) throws Exception {
		
		System.out.println("/product/json/addProduct : POST");
		
		//Business Logic
		System.out.println(":: " + product);
		productService.addProduct(product);
		System.out.println("만들어진 제품  : " +product);
		
		return product;
	}
	
	@RequestMapping( value="json/updateProduct")
	public Product updateProduct(@RequestBody Product product ) throws Exception {
		
		System.out.println("/product/json/updateProduct : POST");
		
		//Business Logic
		System.out.println(":: 수정 전 제품 : " + product);
		
		productService.updateProduct(product);
		
		System.out.println("수정된 제품  : " +product);
		
		return product;
	}
	
	@RequestMapping( value="json/listProduct/{menu}")
	public Map<String, Object> listProduct(@RequestBody Search search, @PathVariable(value="menu", required=false) String menu) throws Exception {
		
		System.out.println("/product/json/listProduct : POST/GET");
		
		//Business Logic
		
		return productService.getProductList(search);
	}

//	@RequestMapping( value="json/login", method=RequestMethod.POST )
//	public User login(	@RequestBody User user,
//									HttpSession session ) throws Exception{
//	
//		System.out.println("/user/json/login : POST");
//		//Business Logic
//		System.out.println("::"+user);
//		User dbUser=userService.getUser(user.getUserId());
//		
//		if( user.getPassword().equals(dbUser.getPassword())){
//			session.setAttribute("user", dbUser);
//		}
//		
//		return dbUser;
//	}
}