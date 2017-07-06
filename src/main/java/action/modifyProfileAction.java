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