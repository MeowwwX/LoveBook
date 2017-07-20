package action;

import java.util.List;

import model.Book;
import model.User;
import service.BookService;
import service.UserService;

public class getSpecificBookAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private BookService bookService;
	private UserService userService;
	private int bookid;
	private int manage;
	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
	public void setUserService(UserService userService){
		this.userService=userService;
	}
	public int getBookid(){
		return bookid;
	}
	public void setBookid(int bookid){
		this.bookid=bookid;
	}
	public int getManage(){
		return manage;
	}
	public void setManage(int manage){
		this.manage=manage;
	}
	public String execute() throws Exception{
		List<User> users=userService.getAllUsers();
		request().setAttribute("users",users);
		Book b=bookService.getBookById(bookid);
		request().setAttribute("book",b);
		if(manage!=1)return SUCCESS;
		return INPUT;
	}
}