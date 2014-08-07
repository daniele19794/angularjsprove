package com.journaldev.spring.model;

import java.sql.Date;

public class ItemGui {

	private Integer id;

	private String titolo;

	private Date dataInizio;

	private Date dataFine;

	private Integer idProgetto;

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

	public Date getDataInizio() {
		return dataInizio;
	}

	public void setDataInizio(Date dataInizio) {
		this.dataInizio = dataInizio;
	}

	public Date getDataFine() {
		return dataFine;
	}

	public void setDataFine(Date dataFine) {
		this.dataFine = dataFine;
	}

	public Integer getIdProgetto() {
		return idProgetto;
	}

	public void setIdProgetto(Integer idProgetto) {
		this.idProgetto = idProgetto;
	}

}
