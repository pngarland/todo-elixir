defmodule TodoElixir.WebTest do
  use TodoElixir.DataCase

  alias TodoElixir.Web

  describe "todos" do
    alias TodoElixir.Web.Todo

    @valid_attrs %{description: "some description", tags: []}
    @update_attrs %{description: "some updated description", tags: []}
    @invalid_attrs %{description: nil, tags: nil}

    def todo_fixture(attrs \\ %{}) do
      {:ok, todo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Web.create_todo()

      todo
    end

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert Web.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Web.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      assert {:ok, %Todo{} = todo} = Web.create_todo(@valid_attrs)
      assert todo.description == "some description"
      assert todo.tags == []
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Web.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      assert {:ok, todo} = Web.update_todo(todo, @update_attrs)
      assert %Todo{} = todo
      assert todo.description == "some updated description"
      assert todo.tags == []
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Web.update_todo(todo, @invalid_attrs)
      assert todo == Web.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = Web.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> Web.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Web.change_todo(todo)
    end
  end
end
