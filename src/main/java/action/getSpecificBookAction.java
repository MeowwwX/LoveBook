package action;

import java.util.List;

import model.Book;
import model.User;
import model.Comment;
import service.CommentService;
import service.BookService;
import service.UserService;

public class getSpecificBookAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private BookService bookService;
	private UserService userService;
	private CommentService commentService;
	private int bookid;
	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
	public void setUserService(UserService userService){
		this.userService=userService;
	}
	public void setCommentService(CommentService commentService){
		this.commentService=commentService;
	}
	public int getBookid(){
		return bookid;
	}
	public void setBookid(int bookid){
		this.bookid=bookid;
	}
	public String execute() throws Exception{
		Book b=bookService.getBookById(bookid);
		request().setAttribute("book",b);
		List<User> users=userService.getAllUsers();
		request().setAttribute("users",users);
		List<Comment> comments=commentService.getCommentsByBookid(bookid);
		request().setAttribute("comments",comments);
		return SUCCESS;
	}
}