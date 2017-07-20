package service.impl;

import service.CommentService;
import java.util.List;
import model.Comment;
import dao.CommentDao;

public class CommentServiceImpl implements CommentService{
	private CommentDao commentDao;
	public void setUserDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}
}