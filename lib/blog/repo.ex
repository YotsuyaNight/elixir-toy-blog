defmodule Blog.Repo do
  use GenServer

  @impl true
  def init(_) do
    {:ok, Map.new}
  end

  def start(_) do
    GenServer.start(__MODULE__, nil, name: :blog_repo_process)
  end

  def start_link(_) do
    IO.puts('Starting Blog.Repo...')
    GenServer.start_link(__MODULE__, nil, name: :blog_repo_process)
  end

  @impl true
  def handle_cast({:create, data}, state), do: {:noreply, Map.put(state, data.id, Map.delete(data, :id))}

  @impl true
  def handle_call({:get, id}, _, state), do: {:reply, Map.get(state, id), state}

  def create(data), do: GenServer.cast(:blog_repo_process, {:create, data})
  def get(id), do: GenServer.call(:blog_repo_process, {:get, id})
end
