package action;

import service.UserService;

public class quitLoginAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public String execute() throws Exception{
		response().addCookie(userService.newCookie(0));
		return SUCCESS;
	}
}