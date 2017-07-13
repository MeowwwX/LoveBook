package service.impl;

import service.UserService;
import java.util.List;
import javax.servlet.http.Cookie;
import model.User;
import dao.UserDao;

public class UserServiceImpl implements UserService{
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public Cookie newCookie(int uid){
		Cookie cookie=new Cookie("uid",String.valueOf(uid));
		cookie.setMaxAge(60*60*24*7);
		cookie.setPath("/");
		return cookie;
	}
	public int addUser(User u){
		User res=userDao.getUserByUsername(u.getUsername());
		if(res!=null) return 0;
		userDao.save(u);
		res=userDao.getUserByUsername(u.getUsername());
		return res.getId();
	}
	public int loginCheck(String username,String password){
		User res=userDao.getUserByUsername(username);
		if(res!=null&&res.getPassword().equals(password)) return res.getId();
		return 0;
	}
	public List<User> getAllUsers(){
		return userDao.getAllUsers();
	}
	public User getUserById(int id){
		return userDao.getUserById(id);
	}
	public boolean modifyProfile(int uid,String password,String password_rep,int g,String mail,String phone,String bio){
		User u=userDao.getUserById(uid);
		if(!password.equals("")&&password.equals(password_rep)) u.setPassword(password);
		u.setGender(g);
		u.setMail(mail);
		u.setPhone(phone);
		u.setBio(bio);
		if(!password.equals("")){
			if(password.equals(password_rep)) u.setPassword(password);
			else{
				userDao.update(u);
				return false;
			}
		}
		userDao.update(u);
		return true;
	}
}