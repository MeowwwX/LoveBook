package action;

import java.util.List;

import model.Book;
import model.User;
import service.BookService;
import service.UserService;

public class getBooksByOwnerAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private BookService bookService;
	private UserService userService;
	private int userid;
	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
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
		List<Book> b=bookService.getBooksByOwner(userid);
		request().setAttribute("books",b);
		return SUCCESS;
	}
}