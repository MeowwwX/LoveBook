package service.impl;

import service.CommentService;
import java.util.List;
import model.Comment;
import dao.CommentDao;

public class CommentServiceImpl implements CommentService{
	private CommentDao commentDao;
	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}

	public List<Comment> getCommentsByBookid(int bookid) {
		return commentDao.getCommentsByBookid(bookid);
	}

	public int addComment(Comment c) {
		return commentDao.save(c);
	}

	public void delComment(int id) {
		Comment c=commentDao.getCommentById(id);
		commentDao.delete(c);
	}
}