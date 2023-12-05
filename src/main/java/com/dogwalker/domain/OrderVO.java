package com.dogwalker.domain;

import java.sql.Date;

public class OrderVO {
	
    private Integer order_num;
	private String id;
	private Date order_date;
	private String order_status;
	private String usepoint;
		
	public Integer getOrder_num() {
		return order_num;
	}
	public void setOrder_num(Integer order_num) {
		this.order_num = order_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	
	public String getUsepoint() {
		return usepoint;
	}
	public void setUsepoint(String usepoint) {
		this.usepoint = usepoint;
	}
	
	@Override
	public String toString() {
		return "OrderVO [order_num=" + order_num + ", id=" + id + ", order_date=" + order_date + ", order_status="
				+ order_status + ", usepoint=" + usepoint + "]";
	}
	
}
