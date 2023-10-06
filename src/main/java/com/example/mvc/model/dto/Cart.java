package com.example.mvc.model.dto;

public class Cart {
	private String productId;
	private Integer cartCnt;
	
	public Cart(String productId, Integer cartCnt) {
		this.productId = productId;
		this.cartCnt = cartCnt;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public Integer getCartCnt() {
		return cartCnt;
	}

	public void setCartCnt(Integer cartCnt) {
		this.cartCnt = cartCnt;
	}

	@Override
	public String toString() {
		return "Cart [productId=" + productId + ", cartCnt=" + cartCnt + "]";
	}
	
	
	
}
