package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.model.Item;
import com.journaldev.spring.model.Progetto;

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
		Query createQuery = sessionFactory.getCurrentSession().createQuery(
				"from Progetto p where p.id = :id");
		createQuery.setParameter("id", id);
		List list = createQuery.list();
		return (Progetto) list.get(0);
	}

	@Transactional
	public void addItem(Item item) {
		sessionFactory.getCurrentSession().save(item);

	}

}
