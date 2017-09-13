package model;

public class Book{
	private int id;
	private int owner;
	private int category;
	private String title;
	private String author;
	private String publisher;
	private String description;
	private int status;
	private String cover;
	public Book(){};
	public Book(int owner,int category,String title,String author,String publisher,String description,String cover){
		this.owner=owner;
		this.category=category;
		this.title=title;
		this.author=author;
		this.publisher=publisher;
		this.description=description;
		this.status=0;
		this.cover=cover;
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
	public int getCategory(){
		return category;
	}
	public void setCategory(int category){
		this.category=category;
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
	public String getCover(){
		return cover;
	}
	public void setCover(String cover){
		this.cover=cover;
	}
	public String transCategory(){
		if(category==1) return "经典名著";
		if(category==2) return "现代小说";
		if(category==3) return "教材教辅";
		if(category==4) return "励志读物";
		if(category==5) return "艺术美术";
		if(category==6) return "儿童文学";
		return "Unknown";
	}
}