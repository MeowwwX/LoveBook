package action;

import model.Book;
import service.BookService;

public class modBookAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private BookService bookService;
	private int bookid;
	private String category;
	private String title;
	private String author;
	private String publisher;
	private String description;
	public void setBookService(BookService bookService){
		this.bookService=bookService;
	}
	public int getBookid(){
		return bookid;
	}
	public void setBookid(int bookid){
		this.bookid=bookid;
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
	public String getDescription(){
		return description;
	}
	public void setDescription(String description){
		this.description=description;
	}
	public String execute() throws Exception{
		Book b=bookService.getBookById(bookid);
		b.setAuthor(author);
		b.setCategory(bookService.transCategory(category));
		b.setPublisher(publisher);
		b.setTitle(title);
		b.setDescription(description);
		bookService.update(b);
		return SUCCESS;
	}
}