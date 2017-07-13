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
}