package dao.impl;

import model.Comment;
import java.util.List;
import dao.CommentDao;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class CommentDaoImpl extends HibernateDaoSupport implements CommentDao{
	public int save(Comment c){
		return (Integer) getHibernateTemplate().save(c);
	}
	public void delete(Comment c){
		getHibernateTemplate().delete(c);
	}
	public void update(Comment c){
		getHibernateTemplate().merge(c);
	}
	public List<Comment> getCommentsByBookid(int bookid){
		@SuppressWarnings("unchecked")
		List<Comment> comments=(List<Comment>)getHibernateTemplate().find(
				"from Comment as c where c.bookid=?",bookid);
		return comments;
	}
	public List<Comment> getCommentsByUserid(int userid){
		@SuppressWarnings("unchecked")
		List<Comment> comments=(List<Comment>)getHibernateTemplate().find(
				"from Comment as c where c.userid=?",userid);
		return comments;
	}
	public Comment getCommentById(int id){
		@SuppressWarnings("unchecked")
		List<Comment> comments=(List<Comment>)getHibernateTemplate().find(
				"from Comment as c where c.id=?",id);
		Comment comment=comments.size()>0?comments.get(0):null;
		return comment;
	}
}