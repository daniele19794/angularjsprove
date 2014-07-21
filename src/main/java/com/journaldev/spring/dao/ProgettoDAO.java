package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.Item;
import com.journaldev.spring.model.Progetto;

public interface ProgettoDAO {

	public void addProgetto(Progetto progetto);

	public void addItem(Item item);

	public List<Progetto> getProgetti();

	public Progetto getProgettoById(Integer id);

	public void ciao();

	public List<Item> getItems();

	public List<Item> getItems(Integer id);
}
