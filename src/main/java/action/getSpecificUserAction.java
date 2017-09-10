package action;

import java.util.List;

import model.User;
import service.UserService;

public class getSpecificUserAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private UserService userService;
	public void setUserService(UserService userService){
		this.userService=userService;
	}
	public String execute() throws Exception{
		List<User> users=userService.getAllUsers();
		request().setAttribute("users",users);
		return SUCCESS;
	}
}