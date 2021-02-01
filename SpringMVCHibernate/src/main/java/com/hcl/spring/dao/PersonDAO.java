package com.hcl.spring.dao;

import com.hcl.spring.model.Person;

public interface PersonDAO {

	public void addPerson(Person p);

	public void updatePerson(Person p);

	public Person getPersonById(int id);
}
