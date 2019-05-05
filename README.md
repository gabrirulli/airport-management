# README

Setup applicazione:

* rails db:setup

* rails db:seed (viene creato l'utente admin)

Per accedere alla dashboard amministrativa, accedere ad '/admin'

Gli endpoint per l'autenticazione Api sono:

* '/api/registration'

* '/api/login'

Per la registrazione passare oggetto 'user'

```
{
  "user": {
    "email": "admin@example.com",
    "password": "password"
  }
}
```

Per il login passare oggetto 'session'

```
{
  "session": {
    "email": "admin@example.com",
    "password": "password"
  }
}
```
Restituiranno entrambi gli endpoint un token ('remember_token') da poter utilizzare per l'autenticazione delle chiamate

```
{
    "email": "admin@example.com",
    "remember_token": "66f1...",
}
```

Per effettuare la prenotazione di volo l'endpoint è '/api/flights/:id/bookings' e passare come parametri l'id del volo ed i passeggeri

```
{
	"flight_id": 1,
	"passengers": [
		{
			"first_name": "Pasquale",
			"last_name": "Catuzzo",
			"fiscal_code": "RLLGRL95B07A859G"
		},
		{
			"first_name": "Gabriele",
			"last_name": "Rulli",
			"fiscal_code": "RLLGRL95B07A858G"
		}
	]
}
```
