# Interest Places

### Setup

#### Prerequisites

  Considering a machine with ruby ​​installed. 

  If not, I suggest using [asdf](https://asdf-vm.com/#/core-manage-asdf-vm), 
  with [ruby-plugin](https://github.com/asdf-vm/asdf-ruby), 
  as ruby version manager. Or one that you prefer.

---

1 - Clone the repo:

    $ git clone git@github.com:m-pereira/interest-places.git

  Browse app folder: 

    $ cd interest-places

2 - Install dependencies:

    $ bundle install

3 - Set your postgres database configs:

    $ cp config/database.example.yml config/database.yml

  Open `config/database.yml` and edit it acording your database settings.

  If you don't have postgres installed, please click [here](https://www.postgresql.org/download/) and install it.

4 - Run database setup:

    $ rails db:setup
    
5 - Run rails server:

    $ rails s

6 - Go to [postman](https://www.postman.com/downloads/):

  * GET index: localhost:3000/api/v1/interest_places
  * POST create: localhost:3000/api/v1/interest_places

  with body example:
  ```json
    {
      "interest_place": {
        "name": "Posto de gasolina",
        "x": 20,
        "y": 12,
        "opened": "07:00",
        "closed": "20:00"
      }
    }
  ```

  * GET show: localhost:3000/api/v1/interest_places/<interest_place_id>
  * PUT update: localhost:3000/api/v1/interest_places/<interest_place_id> 

  with body example:

  ```json
    {
      "interest_place": {
        "name": "Some place"
      }
    }
  ```

  * DELETE destroy: localhost:3000/api/v1/interest_places/<interest_place_id>

  * GET search_interest_places: localhost:3000/api/v1/search_places

  with body example:

  ```json
    {
      "search": {
        "x": 10,
        "y": 10,
        "mts": 20,
        "hr": "06:00"
      }
    }
  ```
