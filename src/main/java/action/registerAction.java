package action;

import model.User;
import service.UserService;

public class registerAction extends BaseAction{
	private static final long serialVersionUID= 1L;
	private UserService userService;
	private String username;
	private String password;
	private String password_rep;
	private String gender;
	public void setUserService(UserService userService){
		this.userService=userService;
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
	public String execute() throws Exception{
		if(!password.equals(password_rep)) return INPUT;
		int g=0;
		if(gender.equals("male")) g=1;
		User u=new User(username,password,g);
		int uid=userService.addUser(u);
		if(uid!=0){
			response().addCookie(userService.newCookie(uid));
			return SUCCESS;
		}
		return ERROR;
	}
}