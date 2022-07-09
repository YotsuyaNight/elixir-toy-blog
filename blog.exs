defmodule Blog do
  use GenServer

  def init(_) do
    {:ok, Map.new}
  end

  def start do
    GenServer.start(__MODULE__, nil)
  end

  def handle_cast({:create, data}, state), do: {:noreply, Map.put(state, data.id, Map.delete(data, :id))}
  def handle_call({:get, id}, _, state), do: {:reply, Map.get(state, id), state}

  def create(pid, data), do: GenServer.cast(pid, {:create, data})
  def get(pid, id), do: GenServer.call(pid, {:get, id})
end

{:ok, blog} = Blog.start
Blog.create(blog, %{id: 1, title: "How to learn Elixir", author: "Yotsuya", body: "Fast and easy"})
:timer.sleep(1000)
IO.inspect(Blog.get(blog, 1))
