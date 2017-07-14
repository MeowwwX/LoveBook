package service;

import java.util.List;
import model.Book;

public interface BookService{
	public List<Book> getAllBooks();
	public Book getBookById(int id);
	public int addBook(Book b);
	public List<Book> searchBook(int category,String title,String author,String publisher);
	public int transCategory(String category);
	public int borrowBook(int bookid,int userid);
	public void returnBook(int id);
}