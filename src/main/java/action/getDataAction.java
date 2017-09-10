package action;

import java.util.List;
import model.User;
import model.Book;
import service.BookService;
import service.UserService;

public class getDataAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private UserService userService;
	private BookService bookService;
	private int cate;
	private int page;
	public void setUserService(UserService userService){
		this.userService=userService;
	}
	public void setBookService(BookService bookService){
		this.bookService=bookService;
	}
	public int getCate(){
		return cate;
	}
	public void setCate(int cate){
		this.cate=cate;
	}
	public int getPage(){
		return page;
	}
	public void setPage(int page){
		this.page=page;
	}
	public String execute() throws Exception{
		List<User> users=userService.getAllUsers();
		request().setAttribute("users",users);
		List<Book> books;
		if(cate==0) books=bookService.getAllBooks();
		else books=bookService.searchBook(cate);
		request().setAttribute("books",books);
		request().setAttribute("cate",cate);
		request().setAttribute("page",page);
		return SUCCESS;
	}
}