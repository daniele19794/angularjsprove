package com.journaldev.spring.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.model.Progetto;

@Service
public class ProgettoDAOImpl implements ProgettoDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public void addProgetto(Progetto progetto) {
		sessionFactory.getCurrentSession().save(progetto);
	}

	@Transactional
	public int getProgetti() {
		java.util.List list = sessionFactory.getCurrentSession()
				.createQuery("from Progetto").list();

		return list.size();
	}

	public void ciao() {

	}

}
