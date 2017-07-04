package dao.impl;

import model.User;
import java.util.List;
import dao.UserDao;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao{
	public int save(User u){
		return (Integer) getHibernateTemplate().save(u);
	}
	public User getUserByUsername(String username){
		@SuppressWarnings("unchecked")
		List<User> users=(List<User>) getHibernateTemplate().find(
					"from user as u where u.username='"+username+"'");
		User u=users.size()>0?users.get(0):null;
		return u;
	}	
	public List<User> getAllUsers() {
		@SuppressWarnings("unchecked")
		List<User> users = (List<User>) getHibernateTemplate()
				.find("from user");
		return users;
	}
	public User getUserById(int id){
		@SuppressWarnings("unchecked")
		List<User> users = (List<User>) getHibernateTemplate().find(
				"from User as u where u.id=?", id);
		User user = users.size() > 0 ? users.get(0) : null;
		return user;
	}
}