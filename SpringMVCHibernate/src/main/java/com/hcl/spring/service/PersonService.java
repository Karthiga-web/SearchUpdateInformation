package com.hcl.spring.service;

import java.util.List;

import com.hcl.spring.model.Person;

public interface PersonService {

	public void addPerson(Person p);

	public void updatePerson(Person p);

	public Person getPersonById(int id);

}
