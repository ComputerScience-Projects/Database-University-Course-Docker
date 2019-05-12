# PostgreSQL & PGAdmin4 come Docker container a scopi didattici

## Introduzione
Le seguenti istruzioni permettono di istanziare due Docker container collegati tra loro contenenti: 

* il DBMS [PostgreSQL](https://www.postgresql.org/)
* [PGAdmin4](https://www.pgadmin.org/)

PGAdmin4 è una interfaccia web che consente di amministrare in modo semplificato un server PostgreSQL, scrivere ed eseguire query e file di comandi SQL utilizzando un qualunque browser web.

## Come iniziare
Queste istruzioni permetteranno di installare Docker, i container e di creare una shared folder fra l'host e i container.

### Prerequisiti
1. Una macchina con sistema operativo Linux o MacOS. Attualmente Windows non è supportato.
2. Bisogna avere i permessi di ***root*** e avere disponibili le porte 5000 (PGAdmin4) e 5432 (PostgreSQL). (Le porte esposte dai container verso la macchina host possono essere modificate editando il file `.env`).
3. [Docker](https://www.docker.com/), docker-compose e git installati. Per la loro installazione, si seguano le istruzioni in base al proprio sistema operativo.

### Installazione ed avviamento tramite docker-compose
1. Aprire una shell
2. Posizionarsi nella directory dove si vuole installare il tutto (ad es., `$HOME/bd2/`). Da qui in poi, chiameremo questa directory `$BASE_DIR`.

        cd "$BASE_DIR"

3. Scaricare questo repository nella directory corrente. Per scoprire il comando da utilizzare:
    1. cliccare il pulsante "Clone" in alto in questa pagina; 
    2. scegliere il metodo "https" dal menu, copiare il comando mostrato (`git clone https://...`);
    3. incollare il comando nella shell aperta.

4. Avviare il docker container:

        docker-compose up -d 

Alla prima esecuzione, il comando scaricherà da Internet le ultime versioni di PostgreSQL e PGAdmin4 e avvierà i due server. 


### Configurazione PGAdmin4
6. Eseguire l'accesso tramite il browser all'indirizzo <http://localhost:5000> (la propria installazione di PGAdmin4; ovviamente usare il numero di porta corretto se modificato nel file `.env`). 
In caso PGAdmin4 non dovesse rispondere, fare riferimento alla sezione "Esecuzione dei test".
6. Effettuare il login usando le credenziali riportate nella sezione "Credenziali"
7. Nella dashboard cliccare su 'Add new server'
8. Nella tab 'General' nel campo Name scrivere 'postgres' 
9. Cambiare tab e scegliere 'Connection'
10. Nel campo Host name / address scrivere: `postgres`
11. Nel campo port se non presente scrivere: `5432`
12. Nel campo Maintenance database scrivere: `postgres`
13. Nel campo username scrivere `postgres`
13. Nel campo password scrivere: `postgres`
13. Spuntare la casella "Save password"

## Credenziali
I container sono già configurati con le seguenti credenziali.

#### Credenziali PGAdmin4:

* user: `admin@pgadmin.org`
* password: `admin`

#### Credenziali PostgreSQL:

* user: `postgres`
* password: `postgres`


## Esecuzione dei test

Per controllare che tutto sia andato a buon fine: 

1. Assicurarsi che i container `pgadmin_container` e `postgres_container` siano attivi (nello stato "up") mediante il comando:

        docker container ls -a
        
1. Puntare il proprio browser alla URL <http://localhost:5000> (la propria installazione di PGAdmin4; ovviamente usare il numero di porta corretto se modificato nel file `.env`) ed assicurarsi che venga correttamente caricata la pagina di login di PGAdmin4.

1. Effettuare il login in PGAdmin4 e assicurarsi che vi sia il server di postgres sotto il menu Servers nella barra laterale sinistra. Se così non fosse, ricontrollare i passi nella sezione "Configurazione PGAdmin4". 

## Condividere file tra il Docker e il File System host
La sottodirectory `postgresData` di `$BASE_DIR` è visibile all'interno del container docker di PostgreSQL.
Questa directory conterrà i file di configurazione e i database PostgreSQL, che resteranno dunque persistenti anche in caso di interruzione del servizio Docker, o della rimozione dei container.

## Utilizzare PostgreSQL da linea di comando:
E' possibile avviare il comando `psql` per accedere alla shell di PostgreSQL mediante:

        docker exec -it postgres_container psql -U postgres


## Altri utili comandi Docker

5. Per fermare l'esecuzione di PostgreSQL e di PGAdmin4 usare il comando:

        docker-compose stop

5. Per avviare l'esecuzione di PostgreSQL e di PGAdmin4 usare il comando:

        docker-compose start
    
5. Per reinstallare i docker container di PostgreSQL e di PGAdmin4 usare il comando:

        docker-compose down
        docker-compose up -d

I dati (ad es., il contenuto dei propri database) resteranno salvati nella cartella $BASE_DIR.
Ai successivi avvii, docker utilizzerà le immagini dei container PostgreSQL e di PGAdmin4 scaricate in precedenza.

Si rinvia alla documentazione di Docker per gli usi più avanzati.

## Authors

* **Andrea Bacciu**  [Github profile](https://github.com/andreabac3)
* **Valerio Neri**   [Github profile](https://github.com/selektion)

## Riferimenti
* **Docker:** [docker.com](https://www.docker.com/)
* **PostgreSQL:**  [postgresql.org](https://www.postgresql.org/)
* **pgadmin4:**  [pgadmin.org](https://www.pgadmin.org/)
