package com.journaldev.spring.model;

public class ItemConverter {

	public static ItemGui toItemGui(Item i) {
		ItemGui ig = new ItemGui();
		ig.setDataFine(i.getDataFine());
		ig.setDataInizio(i.getDataInizio());
		ig.setId(i.getId());
		ig.setIdProgetto(i.getProgetto().getId());
		ig.setTitolo(i.getTitolo());

		return ig;
	}

}
