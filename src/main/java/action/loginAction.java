package action;

import service.UserService;

public class loginAction extends BaseAction{
	private static final long serialVersionUID= 1L;
	private UserService userService;
	private String username;
	private String password;
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
	public String execute() throws Exception{
		int uid=userService.loginCheck(username,password);
		if(uid!=0){
			response().addCookie(userService.newCookie(uid));
			return SUCCESS;
		}
		String err="用户名或密码错误！";
		request().setAttribute("err",err);
		return ERROR;
	}
}