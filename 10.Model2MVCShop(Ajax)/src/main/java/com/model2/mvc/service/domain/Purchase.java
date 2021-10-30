package com.model2.mvc.service.domain;

import java.sql.Date;

import com.model2.mvc.service.domain.*;


public class Purchase {
	
	private User buyer;  // BUYER_ID
	private String divyAddr;  // DLVY_ADDR
	private String divyDate;  // DLVY_DATE
	private String divyRequest; // DLVY_REQUEST
	private Date orderDate;   // ORDER_DATE
	private String paymentOption;  // PAYMENT_OPTION
	private Product purchaseProd; // PROD_NO
	private String receiverName;  // RECEIVER_NAME
	private String receiverPhone; // RECEIVER_PHONE
	private String tranCode; // TRAN_STATUS_CODE
	private int tranNo; // TRAN_NO
	/////////////
	//JSON Domain Object Binding 위해 추가된 부분
	private String divyDateString;
	
	public Purchase(){
	}
	
	public User getBuyer() {
		return buyer;
	}
	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}
	public String getDivyAddr() {
		return divyAddr;
	}
	public void setDivyAddr(String divyAddr) {
		this.divyAddr = divyAddr;
	}
	public String getDivyDate() {
		return divyDate;
	}
	
	
	////////////
	//JSON Domain Object Binding 위해 추가된 부분
	public void setDivyDate(String divyDate) {
		this.divyDate = divyDate;
		if(divyDate!=null) {
			this.setDivyDateString(divyDate.toString().split("-")[0]
											+"-"+divyDate.toString().split("-")[1]
											+"-"+divyDate.toString().split("-")[2]
														);
		}
	}
	public String getDivyRequest() {
		return divyRequest;
	}
	public void setDivyRequest(String divyRequest) {
		this.divyRequest = divyRequest;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getPaymentOption() {
		return paymentOption;
	}
	public void setPaymentOption(String paymentOption) {
		this.paymentOption = paymentOption;
	}
	public Product getPurchaseProd() {
		return purchaseProd;
	}
	public void setPurchaseProd(Product purchaseProd) {
		this.purchaseProd = purchaseProd;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverPhone() {
		return receiverPhone;
	}
	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}
	public String getTranCode() {
		return tranCode;
	}
	public void setTranCode(String tranCode) {
		this.tranCode = tranCode;
	}
	public int getTranNo() {
		return tranNo;
	}
	public void setTranNo(int tranNo) {
		this.tranNo = tranNo;
	}
	
	public String getDivyDateString() {
		return divyDateString;
	}
	
	public void setDivyDateString(String divyDateString) {
		this.divyDateString = divyDateString;
	}

	@Override
	public String toString() {
		return "Purchase [buyer=" + buyer + ", divyAddr=" + divyAddr + ", divyDate=" + divyDate + ", divyRequest="
				+ divyRequest + ", orderDate=" + orderDate + ", paymentOption=" + paymentOption + ", purchaseProd="
				+ purchaseProd + ", receiverName=" + receiverName + ", receiverPhone=" + receiverPhone + ", tranCode="
				+ tranCode + ", tranNo=" + tranNo + ", divyDateString=" + divyDateString + "]";
	}
	
	
//	@Override
//	public String toString() {
//		return "PurchaseVO [buyer=" + buyer + ", divyAddr=" + divyAddr
//				+ ", divyDate=" + divyDate + ", divyRequest=" + divyRequest
//				+ ", orderDate=" + orderDate + ", paymentOption="
//				+ paymentOption + ", purchaseProd=" + purchaseProd
//				+ ", receiverName=" + receiverName + ", receiverPhone="
//				+ receiverPhone + ", tranCode=" + tranCode + ", tranNo="
//				+ tranNo + "]";
//	}
	
	
}