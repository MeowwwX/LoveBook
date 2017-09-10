package action;

import java.util.List;

import model.Book;
import model.User;
import service.BookService;
import service.UserService;

public class getManageDataAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private BookService bookService;
	private UserService userService;
	private String manage;
	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
	public void setUserService(UserService userService){
		this.userService=userService;
	}
	public String getManage(){
		return manage;
	}
	public void setManage(String manage){
		this.manage=manage;
	}
	public String execute() throws Exception{
		List<User> users=userService.getAllUsers();
		request().setAttribute("users",users);
		if(manage.equals("user"))return SUCCESS;
		List<Book> b=bookService.getAllBooks();
		request().setAttribute("books",b);
		return INPUT;
	}
}