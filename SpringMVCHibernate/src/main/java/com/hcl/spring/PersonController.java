package com.hcl.spring;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hcl.spring.model.Person;
import com.hcl.spring.service.PersonService;

@Controller
public class PersonController {
	static Logger log = Logger.getLogger(PersonController.class.getName());
	private PersonService personService;

	@Autowired(required = true)
	@Qualifier(value = "personService")
	public void setPersonService(PersonService ps) {
		this.personService = ps;
	}

	@RequestMapping(value = "/viewuser", method = RequestMethod.GET)
	public String frontPage(Model model) {
		model.addAttribute("person", new Person());
		log.info("Loading Frontpage");
		return "FrontPage";
	}

	@RequestMapping(value = "/viewuser", method = RequestMethod.POST)
	public String getUserDetails(@RequestParam("id") String id, Model model) {
		int idnum = 0;
		try {
			idnum = Integer.parseInt(id);
			try {
				model.addAttribute("person", this.personService.getPersonById(idnum));
			} catch (Exception e) {
				model.addAttribute("person", new Person());
				model.addAttribute("message", "The user does not exist! ");
				log.info("The user does not exist! ");
			}
		} catch (Exception e) {
			model.addAttribute("message", "Enter correct ID number!");
			log.info("Enter correct ID number!");
		}

		return "DetailsPage";
	}

	// For add and update person both
	@RequestMapping(value = "/userdetails", method = RequestMethod.POST)
	public String addPerson(@ModelAttribute("person") Person p) {
		this.personService.getPersonById(p.getId());
		if (p.getId() == 0) {
			this.personService.addPerson(p);
			log.info("Added Person");
		} else {
			this.personService.updatePerson(p);
			log.info("Updated Person");
		}
		return "SuccessPage";

	}

}
