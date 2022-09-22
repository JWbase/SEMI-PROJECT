package kr.co.ansany.product.vo;

public class Product {
	private int productNo; // 제품 번호
	private int cateCode; // 카테고리 번호
	private String productName; // 제품 이름
	private String productInfo; // 제품 설명
	private int productPrice; // 제품 가격
	private String productImg; // 관리자가 등록한 제품 사진 경로

	public Product() {
		super();
	}

	public Product(int productNo, int cateCode, String productName, String productInfo, int productPrice,
			String productImg) {
		super();
		this.productNo = productNo;
		this.cateCode = cateCode;
		this.productName = productName;
		this.productInfo = productInfo;
		this.productPrice = productPrice;
		this.productImg = productImg;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getCateCode() {
		return cateCode;
	}

	public void setCateCode(int cateCode) {
		this.cateCode = cateCode;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductInfo() {
		return productInfo;
	}

	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductImg() {
		return productImg;
	}

	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}


	
	
	
	
}
