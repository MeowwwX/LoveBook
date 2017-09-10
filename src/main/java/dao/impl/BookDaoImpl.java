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
				"from Book as b where b.id=?", id);
		Book book = books.size() > 0 ? books.get(0) : null;
		return book;
	}
	public List<Book> getBookByKeyWord(int category,String title,String author,String publisher){
		StringBuilder query=new StringBuilder("from Book as b where");
		if(!title.equals("")) query.append(" b.title like %"+title+"%");
		if(!author.equals("")) query.append(" b.author="+author);
		if(!publisher.equals("")) query.append(" b.publisher="+publisher);
		if(category!=0){
			query.append(" b.category=?");
			@SuppressWarnings("unchecked")
			List<Book> books=(List<Book>)getHibernateTemplate().find(query.toString(),category);
			return books;
		}else{
			if(query.toString().equals("from Book as b where")) return getAllBooks();
			@SuppressWarnings("unchecked")
			List<Book> books=(List<Book>)getHibernateTemplate().find(query.toString());
			return books;
		}
	}
	//Category==0 means all categories;
	
	public List<Book> getBookByCategory(int category){
		@SuppressWarnings("unchecked")
		List<Book> books = (List<Book>) getHibernateTemplate().find(
				"from Book as b where b.category=?", category);
		return books;
	}
	public List<Book> getBookByOwner(int userid) {
		@SuppressWarnings("unchecked")
		List<Book> books = (List<Book>) getHibernateTemplate().find(
				"from Book as b where b.owner=?", userid);
		return books;
	}

	public List<Book> getBookByStatus(int userid) {
		@SuppressWarnings("unchecked")
		List<Book> books = (List<Book>) getHibernateTemplate().find(
				"from Book as b where b.status=?", userid);
		return books;
	}
}