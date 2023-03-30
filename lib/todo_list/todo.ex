defmodule TodoList.Todo do
  def view() do
    GenServer.call(TodoList.Todo.TodoServer, :view)
  end

  def add(item) do
    GenServer.call(TodoList.Todo.TodoServer, {:add, item})
  end

  def update(id, new_content) do
    GenServer.call(TodoList.Todo.TodoServer, {:update, id, new_content})
  end

  def delete(id) do
    GenServer.call(TodoList.Todo.TodoServer, {:delete, id})
  end
end
