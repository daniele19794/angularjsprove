package com.journaldev.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.journaldev.spring.dao.ProgettoDAO;
import com.journaldev.spring.model.Employee;
import com.journaldev.spring.model.Item;
import com.journaldev.spring.model.Progetto;

/**
 * Handles requests for the Employee service.
 */
@Controller
public class ProgettoController {

	private static final Logger logger = LoggerFactory
			.getLogger(ProgettoController.class);

	// Map to store employees, ideally we should use database
	Map<Integer, Employee> empData = new HashMap<Integer, Employee>();

	@Autowired
	private ProgettoDAO progettoDao;

	@RequestMapping(value = ProgettoRestURIConstants.DUMMY_EMP, method = RequestMethod.GET)
	public @ResponseBody
	Progetto getDummyEmployee() {
		logger.info("Start getDummyEmployee");
		System.out.println("asdf");
		// Employee emp = new Employee();
		// emp.setId(9999);
		// emp.setName("Dummy");
		// emp.setCreatedDate(new Date());
		// empData.put(9999, emp);
		//
		// progettoDao.addProgetto(new Progetto());
		Progetto pr = new Progetto();
		pr.setTitolo("pr1");

		System.out.println("vaiiii");
		return pr;
	}

	@RequestMapping(value = ProgettoRestURIConstants.GET_EMP, method = RequestMethod.GET)
	public @ResponseBody
	Employee getEmployee(@PathVariable("id") int empId) {
		logger.info("Start getEmployee. ID=" + empId);

		return empData.get(empId);
	}

	@RequestMapping(value = ProgettoRestURIConstants.GET_ALL_EMP, method = RequestMethod.GET)
	public @ResponseBody
	List<Progetto> getAllProgetti() {
		logger.info("Start getAllProgetti");

		return progettoDao.getProgetti();

	}

	@RequestMapping(value = ProgettoRestURIConstants.GET_ALL_ITEMS, method = RequestMethod.GET)
	public @ResponseBody
	List<Item> getAllItems() {
		logger.info("Start getAllItems");

		return progettoDao.getItems();

	}

	@RequestMapping(value = ProgettoRestURIConstants.CREATE_EMP, method = RequestMethod.POST)
	public @ResponseBody
	void addItem(@RequestBody Item item) {
		logger.info("Start addItem ..");

		progettoDao.addItem(item);
	}

	@RequestMapping(value = ProgettoRestURIConstants.GET_ITEMS_ID, method = RequestMethod.GET)
	public @ResponseBody
	List<Item> getItems(@PathVariable("id") int idProgetto) {
		logger.info("Start getItems");

		return progettoDao.getItems(new Integer(idProgetto));

	}

	@RequestMapping(value = ProgettoRestURIConstants.CREATE_EMP, method = RequestMethod.POST)
	public @ResponseBody
	void createProgetto(@RequestBody Progetto progetto) {
		logger.info("Start createProgetto.");
		// emp.setCreatedDate(new Date());
		// empData.put(emp.getId(), emp);

		System.out.println("Aggiungo progetto " + progetto.getTitolo());
		// return emp;
	}

	@RequestMapping(value = ProgettoRestURIConstants.UPDATE_EMP, method = RequestMethod.POST)
	public @ResponseBody
	void updateProgetto(@RequestBody Progetto progetto) {
		logger.info("Start updateProgetto.");
		// emp.setCreatedDate(new Date());
		// empData.put(emp.getId(), emp);

		System.out.println("updateProgetto progetto " + progetto);
		// return emp;
	}

	@RequestMapping(value = ProgettoRestURIConstants.DELETE_EMP, method = RequestMethod.PUT)
	public @ResponseBody
	void deleteEmployee(@PathVariable("id") int empId) {
		System.out.println("start delete");
		logger.info("Start deleteEmployee. " + empId);
		// Employee emp = empData.get(empId);
		// empData.remove(empId);
		// return emp;
	}

}
