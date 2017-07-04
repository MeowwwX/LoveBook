package model;

public class User{
	private int id;
	private String username;
	private String password;
	private int gender;
	private String mail;
	private String phone;
	private String bio;
	private int isAdmin;
	public User(){};
	public User(String username,String password,int gender){
		this.username=username;
		this.password=password;
		this.gender=gender;
		this.mail="";
		this.phone="";
		this.bio="";
	}
	public int getId(){
		return id;
	}
	public void setId(int id){
		this.id=id;
	}
	public String getUsername(){
		return username;
	}
	public void setUsername(String username){
		this.username=username;
	}
	public String getPassword(){
		return password;
	}
	public void setPassword(String password){
		this.password=password;
	}
	public int getGender(){
		return gender;
	}
	public void setGender(int gender){
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
	public int getIsAdmin(){
		return isAdmin;
	}
	public void setIsAdmin(int isAdmin){
		this.isAdmin=isAdmin;
	}
}