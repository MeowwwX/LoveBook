package model;

public class Book{
	private int id;
	private int owner;
	private String title;
	private String author;
	private String publisher;
	private String description;
	private int status;
	public Book(){};
	public Book(int owner,String title,String author,String publisher,String description){
		this.owner=owner;
		this.title=title;
		this.author=author;
		this.publisher=publisher;
		this.description=description;
		this.status=0;
	}
	public int getId(){
		return id;
	}
	public void setId(int id){
		this.id=id;
	}
	public int getOwner(){
		return owner;
	}
	public void setOwner(int owner){
		this.owner=owner;
	}
	public String getTitle(){
		return title;
	}
	public void setTitle(String title){
		this.title=title;
	}
	public String getAuthor(){
		return author;
	}
	public void setAuthor(String author){
		this.author=author;
	}
	public String getPublisher(){
		return publisher;
	}
	public void setPublisher(String publisher){
		this.publisher=publisher;
	}
	public String getDescription(){
		return description;
	}
	public void setDescription(String description){
		this.description=description;
	}
	public int getStatus(){
		return status;
	}
	public void setStatus(int status){
		this.status=status;
	}
}