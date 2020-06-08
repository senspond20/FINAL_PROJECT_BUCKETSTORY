package com.kh.BucketStory.common.model.vo;

import java.sql.Date;

public class Member {
	private String userId;
	private String userPwd;
	private String userName;
	private String phone;
	private String email;
	private String brith;
	private String gender;
	private String nickName;
	private String caution;
	private String prImage;
	private int fwCount;
	private Date enrollDate;
	
	public Member() {}

	public Member(String userId, String userPwd, String userName, String phone, String email, String brith,
			String gender, String nickName, String caution, String prImage, int fwCount, Date enrollDate) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.brith = brith;
		this.gender = gender;
		this.nickName = nickName;
		this.caution = caution;
		this.prImage = prImage;
		this.fwCount = fwCount;
		this.enrollDate = enrollDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBrith() {
		return brith;
	}

	public void setBrith(String brith) {
		this.brith = brith;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getCaution() {
		return caution;
	}

	public void setCaution(String caution) {
		this.caution = caution;
	}

	public String getPrImage() {
		return prImage;
	}

	public void setPrImage(String prImage) {
		this.prImage = prImage;
	}

	public int getFwCount() {
		return fwCount;
	}

	public void setFwCount(int fwCount) {
		this.fwCount = fwCount;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", phone=" + phone
				+ ", email=" + email + ", brith=" + brith + ", gender=" + gender + ", nickName=" + nickName
				+ ", caution=" + caution + ", prImage=" + prImage + ", fwCount=" + fwCount + ", enrollDate="
				+ enrollDate + "]";
	}
	
	

}