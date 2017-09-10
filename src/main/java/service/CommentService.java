package service;

import java.util.List;
import model.Comment;

public interface CommentService{

	public List<Comment> getCommentsByBookid(int bookid);

	public int addComment(Comment c);

	public void delComment(int id);
	
}