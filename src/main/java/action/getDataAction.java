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
	private String category;
	private String title;
	private String author;
	private String publisher;
	public void setUserService(UserService userService){
		this.userService=userService;
	}
	public void setBookService(BookService bookService){
		this.bookService=bookService;
	}
	public String getCategory(){
		return category;
	}
	public void setCategory(String category){
		this.category=category;
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
		if(category==null) books=bookService.getAllBooks();
		else books=bookService.searchBook(bookService.transCategory(category),title,author,publisher);
		request().setAttribute("books",books);
		return SUCCESS;
	}
}