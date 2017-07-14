package action;

import model.Book;
import service.BookService;

public class returnBookAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private BookService bookService;
	private int bookid;
	public void setBookService(BookService bookService){
		this.bookService=bookService;
	}
	public int getBookid(){
		return bookid;
	}
	public void setBookid(int bookid){
		this.bookid=bookid;
	}
	public String execute() throws Exception{
		bookService.returnBook(bookid);
		return SUCCESS;
	}
}