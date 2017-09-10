package service.impl;

import service.BookService;
import java.util.List;
import model.Book;
import dao.BookDao;

public class BookServiceImpl implements BookService{
	private BookDao bookDao;
	public void setBookDao(BookDao bookDao) {
		this.bookDao = bookDao;
	}
	public List<Book> getAllBooks(){
		return bookDao.getAllBooks();
	}
	public Book getBookById(int id){
		return bookDao.getBookById(id);
	}
	public int addBook(Book b){
		return bookDao.save(b);
	}
	public List<Book> searchBook(int category){
		return bookDao.getBookByCategory(category);
	}
	public int transCategory(String category){
		if(category.equals("经典名著")) return 1;
		if(category.equals("现代小说")) return 2;
		if(category.equals("教材教辅")) return 3;
		if(category.equals("励志读物")) return 4;
		if(category.equals("艺术美术")) return 5;
		if(category.equals("儿童文学")) return 6;
		// 待增加分类
		return 0;
	}
	public int borrowBook(int bookid,int userid){
		Book b=bookDao.getBookById(bookid);
		if(b==null||b.getStatus()!=0) return 0;
		b.setStatus(userid);
		bookDao.update(b);
		return 1;
	}

	public void returnBook(int id) {
		Book b=bookDao.getBookById(id);
		b.setStatus(0);
		bookDao.update(b);
	}

	public List<Book> getBooksByOwner(int userid) {
		return bookDao.getBookByOwner(userid);
	}
	@Override
	public List<Book> getBorrowed(int userid) {
		return bookDao.getBookByStatus(userid);
	}
	@Override
	public void delBook(int bookid) {
		Book b=bookDao.getBookById(bookid);
		bookDao.delete(b);
	}
	@Override
	public void update(Book b) {
		bookDao.update(b);
	}
}