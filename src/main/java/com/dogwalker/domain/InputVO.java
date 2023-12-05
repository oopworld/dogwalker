package com.dogwalker.domain;

import org.apache.ibatis.type.Alias;

@Alias("input")
public class InputVO {

	public String dog_id;
	public String m_date;
	public String m_start;
	public String m_duration;
	
	public String getDog_id() {
		return dog_id;
	}
	public void setDog_id(String dog_id) {
		this.dog_id = dog_id;
	}
	public String getM_date() {
		return m_date;
	}
	public void setM_date(String m_date) {
		this.m_date = m_date;
	}
	public String getM_start() {
		return m_start;
	}
	public void setM_start(String m_start) {
		this.m_start = m_start;
	}
	public String getM_duration() {
		return m_duration;
	}
	public void setM_duration(String m_duration) {
		this.m_duration = m_duration;
	}
	@Override
	public String toString() {
		return "inputVO [dog_id=" + dog_id + ", m_date=" + m_date + ", m_start=" + m_start + ", m_duration="
				+ m_duration + "]";
	}

	
}
