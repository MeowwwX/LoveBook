package dao;

import java.util.List;

import model.Book;

public interface BookDao{
	public int save(Book b);
	public void delete(Book b);
	public void update(Book b);
	public List<Book> getAllBooks();
	public Book getBookById(int id);
	public List<Book> getBookByKeyWord(int catalog,String title,String author,String publisher);
}