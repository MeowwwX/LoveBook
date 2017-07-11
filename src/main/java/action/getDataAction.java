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
	private String catalog;
	private String title;
	private String author;
	private String publisher;
	public void setUserService(UserService userService){
		this.userService=userService;
	}
	public void setBookService(BookService bookService){
		this.bookService=bookService;
	}
	public String getCatalog(){
		return catalog;
	}
	public void setCatalog(String catalog){
		this.catalog=catalog;
	}
	public String getTitle(){
		return title;
	}
	public void setTitle(String title){
		this.title=title;
	}
	public String getAuthor(){
		return author;
	}
	public void setAuthor(String author){
		this.author=author;
	}
	public String getPublisher(){
		return publisher;
	}
	public void setPublisher(String publisher){
		this.publisher=publisher;
	}
	public String execute() throws Exception{
		List<User> users=userService.getAllUsers();
		request().setAttribute("users",users);
		List<Book> books;
		if(catalog==null) books=bookService.getAllBooks();
		else books=bookService.searchBook(bookService.transCatalog(catalog),title,author,publisher);
		request().setAttribute("books",books);
		return SUCCESS;
	}
}