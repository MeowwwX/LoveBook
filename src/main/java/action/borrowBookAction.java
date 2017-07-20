package action;

import service.BookService;

public class borrowBookAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private BookService bookService;
	private int bookid;
	private int userid;
	public void setBookService(BookService bookService){
		this.bookService=bookService;
	}
	public int getBookid(){
		return bookid;
	}
	public void setBookid(int bookid){
		this.bookid=bookid;
	}
	public int getUserid(){
		return userid;
	}
	public void setUserid(int userid){
		this.userid=userid;
	}
	public String execute() throws Exception{
		if(bookService.borrowBook(bookid,userid)==0){
			String err="书本已借出！！";
			request().setAttribute("err",err);
			return ERROR;
		}
		return SUCCESS;
	}
}