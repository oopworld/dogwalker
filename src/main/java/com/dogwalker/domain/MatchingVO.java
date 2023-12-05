package com.dogwalker.domain;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("matching")
public class MatchingVO {

	private int m_num;
	private String id;
	private String name;
	private String photo;
	private int dog_id;
	private String dog_name;
	private String dog_photo;
	private String m_start;
	private int m_duration;
	private Date m_date;
	private int m_level;
	
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getDog_id() {
		return dog_id;
	}
	public void setDog_id(int dog_id) {
		this.dog_id = dog_id;
	}
	public String getDog_name() {
		return dog_name;
	}
	public void setDog_name(String dog_name) {
		this.dog_name = dog_name;
	}
	public String getDog_photo() {
		return dog_photo;
	}
	public void setDog_photo(String dog_photo) {
		this.dog_photo = dog_photo;
	}
	public String getM_start() {
		return m_start;
	}
	public void setM_start(String m_start) {
		this.m_start = m_start;
	}
	public int getM_duration() {
		return m_duration;
	}
	public void setM_duration(int m_duration) {
		this.m_duration = m_duration;
	}
	public Date getM_date() {
		return m_date;
	}
	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}
	public int getM_level() {
		return m_level;
	}
	public void setM_level(int m_level) {
		this.m_level = m_level;
	}
	
	@Override
	public String toString() {
		return "MatchingVO [m_num=" + m_num + ", id=" + id + ", name=" + name + ", photo=" + photo + ", dog_id="
				+ dog_id + ", dog_name=" + dog_name + ", dog_photo=" + dog_photo + ", m_start=" + m_start
				+ ", m_duration=" + m_duration + ", m_date=" + m_date + ", m_level=" + m_level + "]";
	}
	
	
}
