package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.purchase.PurchaseService;


//==> 备概包府 RestController
@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {
	
	///Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	//setter Method 备泅 臼澜
		
	public PurchaseRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/addPurchase", method=RequestMethod.POST )
	public Purchase addPurchase(	@RequestBody Purchase purchase) throws Exception{
	
		System.out.println("/purchase/json/addPurchase : POST");
		//Business Logic
		System.out.println("::"+purchase);
		purchaseService.addPurchase(purchase);
		
		
		
		return purchase;
	}
	
	@RequestMapping( value="json/getPurchase/{tranNo}", method=RequestMethod.GET )
	public Purchase getPurchase( @PathVariable int tranNo ) throws Exception{
		
		System.out.println("/purchase/json/getPurchase : GET");
		
		System.out.println(":: purchase : "+purchaseService.getPurchase(tranNo));
		
		//Business Logic
		return purchaseService.getPurchase(tranNo);
	}
	
	@RequestMapping( value="json/updatePurchase", method=RequestMethod.POST )
	public Purchase updatePurchase(	@RequestBody Purchase purchase) throws Exception{
	
		System.out.println("/purchase/json/updatePurchase : POST");
		//Business Logic
		System.out.println("::"+purchase);
		purchaseService.updatePurchase(purchase);
		
		
		
		return purchase;
	}

	@RequestMapping( value="json/listPurchase")
	public Map<String, Object> listPurchase(@RequestBody Search search, HttpSession session, HttpServletRequest request) throws Exception {
		
		System.out.println("/purchase/json/listPurchase : POST/GET");
		
		//Business Logic
		User user = (User) session.getAttribute("user");
		String buyerId = user.getUserId();
		
		return purchaseService.getPurchaseList(search, buyerId);
	}
	
}