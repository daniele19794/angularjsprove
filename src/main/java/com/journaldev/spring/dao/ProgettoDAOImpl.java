package com.journaldev.spring.dao;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.model.Category;
import com.journaldev.spring.model.Item;
import com.journaldev.spring.model.ItemGui;
import com.journaldev.spring.model.Progetto;
import com.journaldev.spring.model.Stock;

@Service
public class ProgettoDAOImpl implements ProgettoDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public void addProgetto(Progetto progetto) {
		sessionFactory.getCurrentSession().save(progetto);
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Progetto> getProgetti() {
		return sessionFactory.getCurrentSession().createQuery("from Progetto")
				.list();

	}

	@Transactional
	public List<Item> getItems() {
		@SuppressWarnings("rawtypes")
		java.util.List list = sessionFactory.getCurrentSession()
				.createQuery("from Item").list();

		return list;
	}

	@Transactional
	public List<Item> getItems(Integer id) {
		@SuppressWarnings("rawtypes")
		// TODO daniele da sistemare la query
		Progetto pr = new Progetto();
		pr.setId(id);

		Query createQuery = sessionFactory.getCurrentSession()
				.createQuery("from Item i where i.progetto = :id")
				.setParameter("id", pr);
		return createQuery.list();

	}

	public void ciao() {

	}

	@Transactional
	public Progetto getProgettoById(Integer id) {
		System.out.println("getProgettoById " + id.toString());
		Query createQuery = sessionFactory.getCurrentSession().createQuery(
				"from Progetto p where p.id = :id");
		createQuery.setParameter("id", id);
		List list = createQuery.list();
		return (Progetto) list.get(0);
	}

	@Transactional
	public void addItem(ItemGui item) {
		System.out.println("addItem " + item.getTitolo() + " id "
				+ item.getIdProgetto());
		Item i = createItem(item);
		sessionFactory.getCurrentSession().save(i);

	}

	@Transactional
	public void deleteItem(Integer itemId) {
		System.out.println("deleteItem " + itemId + " id ");

		Query createQuery = sessionFactory.getCurrentSession().createQuery(
				"delete  Item i where i.id = :id  ");
		createQuery.setParameter("id", itemId);
		int result = createQuery.executeUpdate();

	}

	private Item createItem(ItemGui item) {
		Item i = new Item();
		if (item.getId() != null) {
			i.setId(item.getId());
		}
		i.setTitolo(item.getTitolo());
		i.setProgetto(getProgettoById(item.getIdProgetto()));

		return i;
	}

	public void testStock() {
		System.out.println("Hibernate many to many (Annotation)");

		sessionFactory.getCurrentSession().beginTransaction();

		Stock stock = new Stock();
		stock.setStockCode("7052");
		stock.setStockName("PADINI");

		Category category1 = new Category("CONSUMER", "CONSUMER COMPANY");
		Category category2 = new Category("INVESTMENT", "INVESTMENT COMPANY");

		Set<Category> categories = new HashSet<Category>();
		categories.add(category1);
		categories.add(category2);

		stock.setCategories(categories);

		sessionFactory.getCurrentSession().save(stock);

		sessionFactory.getCurrentSession().getTransaction().commit();
		System.out.println("Done");
	}

}
