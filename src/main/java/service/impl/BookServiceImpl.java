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
	public List<Book> searchBook(int category,String title,String author,String publisher){
		return bookDao.getBookByKeyWord(category,title,author,publisher);
	}
	public int transCategory(String category){
		if(category.equals("Example")) return 1;
		// 待增加分类
		return 0;
	}
	public int borrowBook(int bookid,int userid){
		Book b=bookDao.getBookById(bookid);
		if(b.getStatus()!=0) return 0;
		b.setStatus(userid);
		bookDao.update(b);
		return 1;
	}
	@Override
	public void returnBook(int id) {
		Book b=bookDao.getBookById(id);
		b.setStatus(0);
		bookDao.update(b);
	}
}