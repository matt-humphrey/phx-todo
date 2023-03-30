defmodule TodoListWeb.PageController do
  use TodoListWeb, :controller

  def index(conn, _params) do
    items = TodoList.Todo.view()
    render(conn, "index.html", todo: items)
  end

  def add(conn, _params) do
    item = conn.params["add"]
    TodoList.Todo.add(item)
    redirect(conn, to: Routes.page_path(conn, :index))
  end

  def update(conn, _params) do
    IO.inspect(conn.params)
    TodoList.Todo.update(1, "updated")
    redirect(conn, to: Routes.page_path(conn, :index))
  end

  def delete(conn, _params) do
    id = conn.params["delete"] |> String.to_integer()
    TodoList.Todo.delete(id)
    redirect(conn, to: Routes.page_path(conn, :index))
  end
end
