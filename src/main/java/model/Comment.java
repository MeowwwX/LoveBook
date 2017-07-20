package model;

import java.sql.Timestamp;

public class Comment{
	private int id;
	private int bookid;
	private int userid;
	private Timestamp time;
	private String content;
	public Comment(){}
	public Comment(int bookid,int userid,String content){
		this.bookid=bookid;
		this.userid=userid;
		this.content=content;
		time=new Timestamp(System.currentTimeMillis());
	}
	public int getId(){
		return id;
	}
	public void setId(int id){
		this.id=id;
	}
	public int getBookid(){
		return bookid;
	}
	public void setBookid(int bookid){
		this.bookid=bookid;
	}
	public int getUserid(){
		return userid;
	}
	public void setUserid(int userid){
		this.userid=userid;
	}
	public Timestamp getTime(){
		return time;
	}
	public void setTime(Timestamp time){
		this.time=time;
	}
	public String getContent(){
		return content;
	}
	public void setContent(String content){
		this.content=content;
	}
}