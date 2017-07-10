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
	public int addBook(Book b){
		return bookDao.save(b);
	}
}