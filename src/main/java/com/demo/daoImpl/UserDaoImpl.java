package com.demo.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.demo.dao.UserDao;
import com.demo.model.User;

@Repository
@Transactional
public class UserDaoImpl implements UserDao{
	
	@Autowired
	SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void saveUserDetails(User user) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Transaction t = session.beginTransaction();
			session.save(user);
			t.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUserList() {
		Session session = sessionFactory.getCurrentSession();
		try {
			Transaction t = session.beginTransaction();
			List<User> allUser = session.createQuery("from User").list();
			t.commit();
			return allUser;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

	@Override
	public void deleteUser(int id) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Transaction t = session.beginTransaction();
			User user = session.load(User.class, id);
			session.delete(user);
			System.out.println("User deleted successfully, User details=" + user);
			t.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> viewUserById(int id) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Transaction t = session.beginTransaction();
			List<User> allUser = session.createQuery("from User where id=:id").setParameter("id", id).list();
			t.commit();
			return allUser;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}
}
