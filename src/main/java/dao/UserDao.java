package dao;

import java.util.List;

import model.User;

public interface UserDao{
	public int save(User u);
	public User getUserByUsername(String Username);
	public List<User> getAllUsers();
	public User getUserById(int id);
}