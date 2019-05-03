# Postgres & pgadmin4 docker per Base Dati 2 
## Introduzione
Le seguenti istruzioni ti permetteranno di istanziare un Docker contenente il DBMS PostgreSQL e  pgadmin4, una interfaccia grafica che consente di amministrare in modo semplificato database di PostgreSQL. Tramite cui è possibile eseguire query tramite il query editor.

## Come iniziare
Queste istruzioni permetteranno di installare Docker, e il container e di creare una shared folder fra l'host e il docker.

### Prerequisiti
1. Una macchina con sistema operativo Linux o MacOS.
2. Bisogna avere i permessi di ***root*** e avere disponibile la porta 5000 e 5432.
3. Bisogna installare docker, puoi seguire le istruzioni in base al tuo sistema operativo per installarlo  [docker.com](https://www.docker.com/)
### Installazione tramite setup.sh
5. Scaricare il pacchetto 'dockerBD2'  dal [sito del corso](http://tmancini.di.uniroma1.it/index.php?page=teaching.bd2)
6. eseguire il seguente comando:
```sh
$ sudo bash setup.sh
``` 
7. Eseguire l'accesso tramite il browser all'indirizzo localhost:5000
8. Nella dashboard cliccare su 'Add new server'
9. Nella tab 'General' nel campo Name scrivere 'postgres' 
10. Cambiare tab e scegliere 'Connection'
11. Nel campo Host name / address' scrivere 'postgres'
12. Nel campo port se non presente scrivere 5432
13. Nel campo Maintenance database scrivere 'postgres'
14. Nel campo password scrivere 'basedati2'

NB: tutti i campi sono da completare senza apici

## Esecuzione dei test

Per controllare che tutto sia andato a buon fine, caricate nel browser la pagina localhost:5000.

## Credenziali
è possibile eseguire il comando help tramite il file sh per ottenere le credenziali d'accesso di default:
```sh
sudo bash setup.sh -h
``` 
#### Credenziali PGADMIN4:
Per eseguire l'accesso a PGADMIN4 utilizzate le seguenti credenziali:
> id: base@dati2.it
> password: admin
> port: 5000

#### Credenziali PostgreSQL:
Per eseguire tramite linea di comando utilizzate le seguenti credenziali:

> id: postgres
> password: basedati2
> port: 5432
##### Utilizzare PostgreSQL da linea di comando:
Eseguire il seguente comando per accedere alla shell del container.
```sh
$ sudo docker exec -it postgres_container bash
$ psql -U postgres
``` 
## Authors

* **Andrea Bacciu**  [Github profile](https://github.com/andreabac3)
* **Valerio Neri**  [Github profile](https://github.com/selektion)

## Riferimenti
* **Docker:** [docker.com](https://www.docker.com/)
* **PostgreSQL:**  [postgresql.org](https://www.postgresql.org/)
* **pgadmin4:**  [pgadmin.org](https://www.pgadmin.org/)
