package com.hcl.spring.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.ObjectNotFoundException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.hcl.spring.PersonController;
import com.hcl.spring.model.Person;

@Repository
public class PersonDAOImpl implements PersonDAO {
	
	static Logger logger = Logger.getLogger(PersonController.class.getName());

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addPerson(Person p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Person saved successfully, Person Details="+p);
	}

	@Override
	public void updatePerson(Person p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Person updated successfully, Person Details="+p);
	}
	@Override
	public Person getPersonById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Person p = null;
		try {
			p = (Person) session.load(Person.class, new Integer(id));
			logger.info("Person loaded successfully, Person details="+p);
		}catch(ObjectNotFoundException o) {
			p.setName(null);
		}
		return p;
	}

}
