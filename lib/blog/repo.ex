defmodule Blog.Repo do
  use GenServer

  def init(_) do
    {:ok, Map.new}
  end

  def start do
    GenServer.start(__MODULE__, nil)
  end

  def start_link do
    IO.puts('Starting Blog.Repo...')
    GenServer.start_link(__MODULE__, nil)
  end

  def handle_cast({:create, data}, state), do: {:noreply, Map.put(state, data.id, Map.delete(data, :id))}
  def handle_call({:get, id}, _, state), do: {:reply, Map.get(state, id), state}

  def create(pid, data), do: GenServer.cast(pid, {:create, data})
  def get(pid, id), do: GenServer.call(pid, {:get, id})
end
