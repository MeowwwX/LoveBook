package service;

import java.util.List;
import model.Book;

public interface BookService{
	public List<Book> getAllBooks();
	public Book getBookById(int id);
	public int addBook(Book b);
	public List<Book> searchBook(int category);
	public int transCategory(String category);
	public int borrowBook(int bookid,int userid);
	public void returnBook(int id);
	public List<Book> getBooksByOwner(int userid);
	public List<Book> getBorrowed(int userid);
	public void delBook(int bookid);
	public void update(Book b);
}