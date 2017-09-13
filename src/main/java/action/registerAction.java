package action;

import model.User;
import service.UserService;

public class registerAction extends BaseAction{
	private static final long serialVersionUID= 1L;
	private UserService userService;
	private String username;
	private String password;
	private String password_rep;
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
	public String execute() throws Exception{
		if(username.equals("")){
			String err="请输入用户名！";
			request().setAttribute("err",err);
			return ERROR;
		}
		if(password.equals("")){
			String err="请输入密码！";
			request().setAttribute("err",err);
			return ERROR;
		}
		if(!password.equals(password_rep)){
			String err="两次输入的密码不一致！";
			request().setAttribute("err",err);
			return ERROR;
		}
		User u=new User(username,password);
		int uid=userService.addUser(u);
		if(uid!=0){
			response().addCookie(userService.newCookie(uid));
			return SUCCESS;
		}
		String err="用户名已存在！";
		request().setAttribute("err",err);
		return ERROR;
	}
}