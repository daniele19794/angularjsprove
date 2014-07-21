package com.journaldev.spring.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import com.fasterxml.jackson.annotation.JsonManagedReference;


@Entity
@Table(name = "PROGETTO")
public class Progetto {

	@Id
	@Column(name = "ID")
	@GeneratedValue
	private Integer id;

	@Column(name = "TITOLO")
	private String titolo;

	@OneToMany(mappedBy = "progetto", fetch = FetchType.EAGER)
	@Cascade({ CascadeType.ALL })
    @JsonManagedReference
	private Set<Item> items;

	public Set<Item> getItems() {
		return items;
	}

	public void setItems(Set<Item> items) {
		this.items = items;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public void addItem(Item i) {
		if (items == null)
			items = new HashSet<Item>();
		this.items.add(i);

	}
}