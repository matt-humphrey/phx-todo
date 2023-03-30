defmodule TodoList.Todo.TodoServer do
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  # Server callback functions

  @impl true
  def init(list) do
    {:ok, list}
  end

  @impl true
  def handle_call(:view, _from, todo_list) do
    {:reply, Enum.reverse(todo_list), todo_list}
  end

  @impl true
  def handle_call({:add, item}, _from, todo_list) do
    {:reply, [item | todo_list], [item | todo_list]}
  end

  @impl true
  def handle_call({:update, id, new_content}, _from, todo_list) do
    updated_list = List.update_at(todo_list, id - 1, new_content)
    {:reply, updated_list, updated_list}
  end

  @impl true
  def handle_call({:delete, id}, _from, todo_list) do
    updated_list = List.delete_at(todo_list, id - 1)
    {:reply, updated_list, updated_list}
  end
end
