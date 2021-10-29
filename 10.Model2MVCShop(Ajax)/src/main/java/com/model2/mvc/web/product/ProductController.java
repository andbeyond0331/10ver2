package com.model2.mvc.web.product;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.user.UserService;


//==> 상품관리 Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
		
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	//@Value("#{commonProperties['pageUnit']}")
	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	//@Value("#{commonProperties['pageSize']}")
	@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping(value="addProduct", method=RequestMethod.GET)
	public String addProduct() throws Exception {

		System.out.println("/product/addProduct : GET");
		
		return "redirect:/product/addProductView.jsp";
	}
	
	@RequestMapping(value="addProduct", method=RequestMethod.POST)
	public String addProduct( @ModelAttribute("product") Product product ) throws Exception {

		System.out.println("/product/addProduct : POST");
		//Business Logic
		product.setProTranCode("001");
		productService.addProduct(product);
		
		System.out.println("product : "+product);
		
		
		//System.out.println("product trancode : "+ product.getProTranCode());
		
		return "forward:/product/addProduct.jsp";
	}
	
	@RequestMapping(value="getProduct", method=RequestMethod.GET)
	public String getProduct( @RequestParam("prodNo") int prodNo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("/product/getProduct : GET");
		
		String prodNoo = Integer.toString(prodNo);
		String menu = request.getParameter("menu");
		String history = "";
		
		Cookie[] cookies = request.getCookies();
		if(cookies!=null && cookies.length>0) {
			for(int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				if(cookie.getName().equals("history")) {
					history = cookie.getValue();
					history+=",";
				}
			}
			history +=prodNoo;
		}
		Cookie cookie = new Cookie("history", history);
		cookie.setPath("/");
		response.addCookie(cookie);
		
		System.out.println("cookie : "+cookie.getValue());
		
		String proTranCode = request.getParameter("tranCode");
		System.out.println("request의 proTranCode : ////"+ proTranCode+"/////");
		
		
		//Business Logic
		Product product = productService.findProduct(prodNo);
		product.setProTranCode(proTranCode);
		// Model 과 View 연결
		model.addAttribute("prodNo", prodNo);
		model.addAttribute("product",product);
		
		
		
		if("manage".equals(menu)) {
			
			return "forward:/product/updateProductView.jsp";
		}
		
		
		
		return "forward:/product/getProduct.jsp";
	}
	
	@RequestMapping(value="updateProduct", method=RequestMethod.GET)
	public String updateProduct( @RequestParam("prodNo") int prodNo, Model model ) throws Exception{

		System.out.println("/product/updateProduct : GET");
		//Business Logic
		Product product = productService.findProduct(prodNo);
		// Model 과 View 연결
		model.addAttribute("product", product);
		
		return "forward:/product/updateProductView.jsp";
	}
	
	@RequestMapping(value="updateProduct", method=RequestMethod.POST)
	public String updateProduct( @ModelAttribute("product") Product product, Model model , HttpSession session) throws Exception{

		System.out.println("/product/updateProduct : POST");
		//Business Logic
		productService.updateProduct(product);
		
		session.setAttribute("product", product);
		
		return "redirect:/product/getProduct?prodNo="+product.getProdNo();
	}
	
	@RequestMapping(value="listProduct")
	public String listProduct( @ModelAttribute("search") Search search , Model model , HttpServletRequest request, @RequestParam(value="menu", required=false) String menu) throws Exception{
		
		System.out.println("/product/listProduct : GET / POST");
		System.out.println("search : "+search);
	
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		System.out.println("menu : "+menu);
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
		System.out.println("map : "+map);
		System.out.println("////search.getCurrentPage() : "+search.getCurrentPage());
		System.out.println("////((Integer)map.get(\"totalCount\")).intValue() : "+((Integer)map.get("totalCount")).intValue());
		System.out.println("////pageUnit : "+pageUnit);
		System.out.println("////spageSize : "+pageSize);
		System.out.println("--------------");
		System.out.println("search.getSortCondition() : "+search.getSortCondition());
		System.out.println("search.getShipManagement() : "+search.getShipManagement());
		
	
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("menu", menu);
		
		
		return "forward:/product/listProduct.jsp";
	}
}