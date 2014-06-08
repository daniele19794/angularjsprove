package com.journaldev.spring.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
	Employee getDummyEmployee() {
		logger.info("Start getDummyEmployee");
		System.out.println("asdf");
		Employee emp = new Employee();
		emp.setId(9999);
		emp.setName("Dummy");
		emp.setCreatedDate(new Date());
		empData.put(9999, emp);

		progettoDao.addProgetto(new Progetto());

		System.out.println("vaiiii");
		return new Employee();
	}

	@RequestMapping(value = ProgettoRestURIConstants.GET_EMP, method = RequestMethod.GET)
	public @ResponseBody
	Employee getEmployee(@PathVariable("id") int empId) {
		logger.info("Start getEmployee. ID=" + empId);

		return empData.get(empId);
	}

	@RequestMapping(value = ProgettoRestURIConstants.GET_ALL_EMP, method = RequestMethod.GET)
	public @ResponseBody
	List<Employee> getAllEmployees() {
		logger.info("Start getAllEmployees.");
		List<Employee> emps = new ArrayList<Employee>();
		Set<Integer> empIdKeys = empData.keySet();
		for (Integer i : empIdKeys) {
			emps.add(empData.get(i));
		}
		return emps;
	}

	@RequestMapping(value = ProgettoRestURIConstants.CREATE_EMP, method = RequestMethod.POST)
	public @ResponseBody
	Employee createEmployee(@RequestBody Employee emp) {
		logger.info("Start createEmployee.");
		emp.setCreatedDate(new Date());
		empData.put(emp.getId(), emp);
		return emp;
	}

	@RequestMapping(value = ProgettoRestURIConstants.DELETE_EMP, method = RequestMethod.PUT)
	public @ResponseBody
	Employee deleteEmployee(@PathVariable("id") int empId) {
		logger.info("Start deleteEmployee.");
		Employee emp = empData.get(empId);
		empData.remove(empId);
		return emp;
	}

}
