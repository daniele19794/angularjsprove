insert into Progetto (id,titolo) values (1,'Emp test');  
insert into Progetto (id,titolo) values (2,'Emp test');  
insert into Progetto (id,titolo) values (3,'Emp test'); 

insert into Persona (persona_id,cognome,nome) values (1,'Campanini','Daniele'); 
insert into Persona (persona_id,cognome,nome) values (2,'Facchin','Matteo'); 


--insert into Item(id,titolo,DATA_INIZIO,DATA_FINE,DATA_CERTIFICAZIONE,DATA_PASSAGGIO_PRODUZIONE,EFFORT_PREVISTO,EFFORT_EFFETTIVO,progetto_id) values (1,'titolo1','2012-11-01','2012-11-01','2012-11-01','2012-11-01',1,2,1););
insert into Item(item_id,titolo,progetto_id) values (1,'titolo1',1)
insert into Item(item_id,titolo,progetto_id) values (2,'titolo2',1);
insert into Item(item_id,titolo,progetto_id) values (3,'titolo3',1);