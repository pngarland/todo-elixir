defmodule TodoElixir.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :description, :string
      add :tags, {:array, :string}

      timestamps()
    end

  end
end
