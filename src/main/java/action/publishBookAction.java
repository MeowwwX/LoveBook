package action;

import model.Book;
import service.BookService;

public class publishBookAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private BookService bookService;
	private int userid;
	private String title;
	private String author;
	private String publisher;
	private String description;
	public void setBookService(BookService bookService){
		this.bookService=bookService;
	}
	public int getUserid(){
		return userid;
	}
	public void setUserid(int userid){
		this.userid=userid;
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
	public String getDescription(){
		return description;
	}
	public void setDescription(String description){
		this.description=description;
	}
	public String execute() throws Exception{
		Book b=new Book(userid,title,author,publisher,description);
		bookService.addBook(b);
		return SUCCESS;
	}
}