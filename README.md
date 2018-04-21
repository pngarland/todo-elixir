## Scaffolding a Phoenix Application

### Init
- `mix phx.new todo_elixir`
- `cd todo_elixer && mix ecto.create` (creates database, make sure database configuration file includes proper credentials)

### Scaffolding
([see docs](https://hexdocs.pm/phoenix/1.3.2/Mix.Tasks.Phx.Gen.Schema.html))
- scaffold schema: `mix phx.gen.schema Todo todos description tags:array:string`
    - note: id, inserted_at, updated_at are created automatically (like rails). Attribute types default to string if none is specified
- run migrations: `mix ecto.migrate`
- scaffold html: `mix phx.gen.html Web Todo todos description tags:array:string`

### Useful Commands
- `mix deps.get`
- `mix help | grep -i phx`
- `mix phx.routes`

### Links
- [slime](https://github.com/slime-lang/slime)