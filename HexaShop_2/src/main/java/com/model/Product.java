package com.model;

import java.io.InputStream;

public class Product 

{
		private int id,catid,quantity;
		private String product_name,product_details,product_size,create_at,update_at;
		private float product_price,discount_price;
		InputStream image;
		
		public InputStream getImage() {
			return image;
		}
		public void setImage(InputStream image) {
			this.image = image;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public int getCatid() {
			return catid;
		}
		public void setCatid(int catid) {
			this.catid = catid;
		}
		public int getQuantity() {
			return quantity;
		}
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
		public String getProduct_name() {
			return product_name;
		}
		public void setProduct_name(String product_name) {
			this.product_name = product_name;
		}
		public String getProduct_details() {
			return product_details;
		}
		public void setProduct_details(String product_details) {
			this.product_details = product_details;
		}
		public String getProduct_size() {
			return product_size;
		}
		public void setProduct_size(String product_size) {
			this.product_size = product_size;
		}
		
		public String getCreate_at() {
			return create_at;
		}
		public void setCreate_at(String create_at) {
			this.create_at = create_at;
		}
		public String getUpdate_at() {
			return update_at;
		}
		public void setUpdate_at(String update_at) {
			this.update_at = update_at;
		}
		public float getProduct_price() {
			return product_price;
		}
		public void setProduct_price(float product_price) {
			this.product_price = product_price;
		}
		public float getDiscount_price() {
			return discount_price;
		}
		public void setDiscount_price(float discount_price) {
			this.discount_price = discount_price;
		}
		
		
		
		
		
}
