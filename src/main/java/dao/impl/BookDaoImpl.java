package dao.impl;

import model.Book;
import java.util.List;
import dao.BookDao;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class BookDaoImpl extends HibernateDaoSupport implements BookDao{
	public int save(Book b){
		return (Integer) getHibernateTemplate().save(b);
	}
	public void delete(Book b){
		getHibernateTemplate().delete(b);
	}
	public void update(Book b){
		getHibernateTemplate().merge(b);
	}
	public List<Book> getAllBooks() {
		@SuppressWarnings("unchecked")
		List<Book> books = (List<Book>) getHibernateTemplate()
				.find("from Book");
		return books;
	}
	public Book getBookById(int id){
		@SuppressWarnings("unchecked")
		List<Book> books = (List<Book>) getHibernateTemplate().find(
				"from Book as u where u.id=?", id);
		Book book = books.size() > 0 ? books.get(0) : null;
		return book;
	}
	public List<Book> getBookByKeyWord(int catalog,String title,String author,String publisher);
	//catalog==0 means all catalogs;
}