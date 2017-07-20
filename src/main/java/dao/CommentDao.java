package dao;

import java.util.List;

import model.Comment;

public interface CommentDao{
	public int save(Comment c);
	public void delete(Comment c);
	public void update(Comment c);
	public List<Comment> getCommentsByBookid(int bookid);
	public List<Comment> getCommentsByUserid(int userid);
	public Comment getCommentById(int id);
}