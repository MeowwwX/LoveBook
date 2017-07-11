package action;

import java.util.List;
import model.User;
import service.UserService;

public class modifyProfileAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private UserService userService;
	String uid;
	String password;
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
		User u=userService.getUserById(userid);
		u.setPassword(password);
		if(gender.equals("male")) u.setGender(1);
		else u.setGender(0);
		u.setMail(mail);
		u.setPhone(phone);
		u.setBio(bio);
		List<User> users=userService.getAllUsers();
		request().setAttribute("users",users);
		return SUCCESS;
	}
}