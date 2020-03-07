# Interest Places

### Setup

* TODO: criar o setup

* TODO: apagar o backlog

### Backlog

1- Criar uma api em node

2- Fazer o setup, instalar as dependencias

3- Criar um model chamado InteresPlace com os compos:

  * name:string
  * x:integer
  * y:integer
  * opened:string
  * closed:string

obs: alguns lugares não terão horario de abrir ou de fechar como por exemplo uma Praça.

4- Criar o controller(CRUD, RESTful)

5- Criar um controller que fará as queries por exemplo:

`{ x: 20, y: 12, mts: 10, hr: "19:00" }`

e a resposta deve ser uma collection com os lugares encontrados.

ex:

```json
  [
    {
      "place_name": "Restalrante da Joaoa",
      "status": "open"
    },
    {
      "palce_name": "Barbearia do José",
      "status": "closed"
    }
  ]
```

6-  Criar um README.md explicando o setup.
