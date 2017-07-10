package dao;

import java.util.List;

import model.User;

public interface UserDao{
	public int save(User u);
	public void delete(User u);
	public void update(User u);
	public User getUserByUsername(String Username);
	public List<User> getAllUsers();
	public User getUserById(int id);
}