package action;

import model.Book;
import java.io.File;
import java.io.FileInputStream;  
import java.io.FileNotFoundException;  
import java.io.FileOutputStream;  
import java.io.IOException;  
import java.io.InputStream;  
import java.io.OutputStream;  
import java.util.Random;

import org.apache.commons.io.FileUtils;

import service.BookService;

public class publishBookAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private BookService bookService;
	private int userid;
	private String category;
	private String title;
	private String author;
	private String publisher;
	private File cover;
	private String description;
	public void setBookService(BookService bookService){
		this.bookService=bookService;
	}
	public int getUserid(){
		return userid;
	}
	public void setUserid(int userid){
		this.userid=userid;
	}
	public String getCategory(){
		return category;
	}
	public void setCategory(String category){
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
	public File getCover(){
		return cover;
	}
	public void setCover(File cover){
		this.cover=cover;
	}
	public String getDescription(){
		return description;
	}
	public void setDescription(String description){
		this.description=description;
	}
	public String getRandomString(int length){
	    String base = "abcdefghijklmnopqrstuvwxyz0123456789";   
	    Random random = new Random();   
	    StringBuffer sb = new StringBuffer();   
	    for (int i = 0; i < length; i++) {   
	        int number = random.nextInt(base.length());   
	        sb.append(base.charAt(number));
	    }   
	    return sb.toString();   
	}
	public String execute() throws Exception{
		String filename=getRandomString(230)+".jpg";
		if(cover==null){
			String err="请选择封面！";
			request().setAttribute("err",err);
			return ERROR;
		}
		try{
			@SuppressWarnings("deprecation")
			String dir=request().getRealPath("/img");
			File uploadFile=new File(dir+File.separator+filename);
			FileUtils.copyFile(cover,uploadFile);
		}catch(Exception e){
			String err="文件上传失败！";
			request().setAttribute("err",err);
			return ERROR;
		}
		Book b=new Book(userid,bookService.transCategory(category),title,author,publisher,description,filename);
		bookService.addBook(b);
		return SUCCESS;
	}
}