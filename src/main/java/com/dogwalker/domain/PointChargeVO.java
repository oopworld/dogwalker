package com.dogwalker.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("point")
public class PointChargeVO {
	private String id; //사용자 id
	private Date charge_date;//결제 시간
	private	int amount;//충전 
	private String history;//충전기록\
	
	//추가
	private int balance;
	
	
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getCharge_date() {
		return charge_date;
	}
	public void setCharge_date(Date charge_date) {
		this.charge_date = charge_date;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getHistory() {
		return history;
	}
	public void setHistory(String history) {
		this.history = history;
	}
	
	@Override
	public String toString() {
		return "PointChargeVO [id=" + id + ", charge_date=" + charge_date + ", amount=" + amount + ", history="
				+ history + ", balance=" + balance + "]";
	}
	
	
	
	
}
