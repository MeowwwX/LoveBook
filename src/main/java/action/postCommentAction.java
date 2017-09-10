package action;

import model.Comment;
import service.CommentService;

public class postCommentAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private CommentService commentService;
	int userid;
	int bookid;
	String content;
	public void setCommentService(CommentService commentService){
		this.commentService=commentService;
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
	public String getContent(){
		return content;
	}
	public void setContent(String content){
		this.content=content;
	}
	public String execute() throws Exception{
		Comment c=new Comment(bookid,userid,content);
		commentService.addComment(c);
		return SUCCESS;
	}
}