defmodule TodoElixir.Web.Todo do
  use Ecto.Schema
  import Ecto.Changeset


  schema "todos" do
    field :description, :string
    field :tags, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:description, :tags])
    |> validate_required([:description, :tags])
  end
end
