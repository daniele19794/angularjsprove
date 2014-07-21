package com.journaldev.spring.dao;

import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import com.journaldev.spring.model.Item;
import com.journaldev.spring.model.Progetto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-context-test.xml")
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
		List<Progetto> progetti = progettoDAO.getProgetti();

		System.out.println("Progetti found " + progetti.size());

		for (Iterator iterator = progetti.iterator(); iterator.hasNext();) {
			Progetto progetto = (Progetto) iterator.next();
			System.out.println("Progetto " + progetto.getTitolo());
			for (Iterator iterator2 = progetto.getItems().iterator(); iterator2
					.hasNext();) {
				Item item = (Item) iterator2.next();
				System.out.println("item " + item.getTitolo());
			}
		}
		List<Item> items = progettoDAO.getItems();
		System.out.println("items from query " + items.size());
		System.out.println();
	}

	@org.junit.Test
	public void getItemByIdProgetto() {
		List<Item> items = progettoDAO.getItems(new Integer("1"));
		System.out.println("size " + items.size());
	}

	@org.junit.Test
	public void addItemToProgetto() {
		System.out.println("go");
		Item i = new Item();
		i.setTitolo("i1");
		i.setDataFine(new Date(System.currentTimeMillis()));

		Progetto progettoById = progettoDAO.getProgettoById(new Integer(1));

		System.out.println("items before " + progettoById.getItems().size());

		i.setProgetto(progettoById);

		progettoDAO.addItem(i);

		Progetto progettoAfter = progettoDAO.getProgettoById(new Integer(1));

		System.out.println("items after " + progettoAfter.getItems().size());

	}
}
