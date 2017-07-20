package action;

import java.util.List;

import model.User;
import service.UserService;

public class getSpecificUserAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private UserService userService;
	private int userid;
	public void setUserService(UserService userService){
		this.userService=userService;
	}
	public int getUserid(){
		return userid;
	}
	public void setUserid(int userid){
		this.userid=userid; 
	}
	public String execute() throws Exception{
		List<User> users=userService.getAllUsers();
		request().setAttribute("users",users);
		User user=userService.getUserById(userid);
		request().setAttribute("user",user);
		return SUCCESS;
	}
}