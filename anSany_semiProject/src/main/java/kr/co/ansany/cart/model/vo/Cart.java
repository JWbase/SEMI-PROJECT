package kr.co.ansany.cart.model.vo;

public class Cart {
	private int cartNo;
	private int productNo;
	private String productImg;
	private String productName;
	private int productPrice;
	private int orderQty;
	private String memberId;
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cart(int cartNo, int productNo, String productImg, String productName, int productPrice, int orderQty,
			String memberId) {
		super();
		this.cartNo = cartNo;
		this.productNo = productNo;
		this.productImg = productImg;
		this.productName = productName;
		this.productPrice = productPrice;
		this.orderQty = orderQty;
		this.memberId = memberId;
	}
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getOrderQty() {
		return orderQty;
	}
	public void setOrderQty(int orderQty) {
		this.orderQty = orderQty;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
}