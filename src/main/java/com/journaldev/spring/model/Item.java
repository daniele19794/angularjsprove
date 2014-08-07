package com.journaldev.spring.model;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "ITEM")
public class Item {

	@Id
	@Column(name = "ITEM_ID")
	@GeneratedValue
	private Integer id;

	@Column(name = "TITOLO")
	private String titolo;

	@Column(name = "DATA_INIZIO")
	private Date dataInizio;

	@Column(name = "DATA_FINE")
	private Date dataFine;

	@Column(name = "DATA_CERTIFICAZIONE")
	private Date dataInizioCertificazione;

	@Column(name = "DATA_PASSAGGIO_PRODUZIONE")
	private Date dataPassaggioProduzione;

	@Column(name = "EFFORT_PREVISTO")
	private Integer effortPrevisto;

	@Column(name = "EFFORT_EFFETTIVO")
	private Integer effortEffettivo;

	private Set<Persona> persone = new HashSet<Persona>(0);

	@ManyToOne
	@JoinColumn(name = "progetto_id")
	@JsonBackReference
	private Progetto progetto;

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

	public Progetto getProgetto() {
		return progetto;
	}

	public void setProgetto(Progetto progetto) {
		this.progetto = progetto;
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

	public Date getDataPassaggioProduzione() {
		return dataPassaggioProduzione;
	}

	public void setDataPassaggioProduzione(Date dataPassaggioProduzione) {
		this.dataPassaggioProduzione = dataPassaggioProduzione;
	}

	public Date getDataInizioCertificazione() {
		return dataInizioCertificazione;
	}

	public void setDataInizioCertificazione(Date dataInizioCertificazione) {
		this.dataInizioCertificazione = dataInizioCertificazione;
	}

	public Integer getEffortPrevisto() {
		return effortPrevisto;
	}

	public void setEffortPrevisto(Integer effortPrevisto) {
		this.effortPrevisto = effortPrevisto;
	}

	public Integer getEffortEffettivo() {
		return effortEffettivo;
	}

	public void setEffortEffettivo(Integer effortEffettivo) {
		this.effortEffettivo = effortEffettivo;
	}

	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "item_persona", joinColumns = { @JoinColumn(name = "PERSONA_ID", nullable = false, updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "ITEM_ID", nullable = false, updatable = false) })
	public Set<Persona> getPersone() {
		return persone;
	}

	public void setPersone(Set<Persona> persone) {
		this.persone = persone;
	}

}