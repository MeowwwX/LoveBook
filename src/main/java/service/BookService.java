package service;

import java.util.List;
import model.Book;

public interface BookService{
	public List<Book> getAllBooks();
	public int addBook(Book b);
	public List<Book> searchBook(int catalog,String title,String author,String publisher);
	public int transCatalog(String catalog);
}