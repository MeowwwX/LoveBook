package service;

import java.util.List;
import javax.servlet.http.Cookie;
import model.User;

public interface UserService{
	public Cookie newCookie(int uid);
	public int addUser(User u);
	public int loginCheck(String username,String password);
	public List<User> getAllUsers();
	public User getUserById(int id);
}