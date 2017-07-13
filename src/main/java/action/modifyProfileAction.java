package action;

import service.UserService;

public class modifyProfileAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private UserService userService;
	String uid;
	String password;
	String password_rep;
	String gender;
	String mail;
	String phone;
	String bio;
	public void setUserService(UserService userService){
		this.userService=userService;
	}
	public String getUid(){
		return uid;
	}
	public void setUid(String uid){
		this.uid=uid;
	}
	public String getPassword(){
		return password;
	}
	public void setPassword(String password){
		this.password=password;
	}
	public String getPassword_rep(){
		return password_rep;
	}
	public void setPassword_rep(String password_rep){
		this.password_rep=password_rep;
	}
	public String getGender(){
		return gender;
	}
	public void setGender(String gender){
		this.gender=gender;
	}
	public String getMail(){
		return mail;
	}
	public void setMail(String mail){
		this.mail=mail;
	}
	public String getPhone(){
		return phone;
	}
	public void setPhone(String phone){
		this.phone=phone;
	}
	public String getBio(){
		return bio;
	}
	public void setBio(String bio){
		this.bio=bio;
	}
	public String execute() throws Exception{
		int userid=Integer.valueOf(uid);
		int g=1;
		if(gender.equals("female")) g=0;
		if(userService.modifyProfile(userid,password,password_rep,g,mail,phone,bio)) return SUCCESS;
		else return INPUT;
	}
}