package com.journaldev.spring.dao;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import com.journaldev.spring.model.Progetto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-context.xml")
@TransactionConfiguration(defaultRollback = true, transactionManager = "transactionManager")
public class Test {

	@Autowired
	private ProgettoDAO progettoDAO;

	private static final SessionFactory sessionFactory;
	static {
		try {
			sessionFactory = new AnnotationConfiguration().configure()
					.buildSessionFactory();
		} catch (Throwable ex) {
			System.err.println("Initial SessionFactory creation failed." + ex);
			throw new ExceptionInInitializerError(ex);
		}
	}

	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@org.junit.Test
	public void testdb() {
		System.out.println("go");
		Progetto pr1 = new Progetto();
		pr1.setTitolo("adsf");
		progettoDAO.addProgetto(pr1);

		int progetti = progettoDAO.getProgetti();

		System.out.println("Progetti found " + progetti);
	}
}
