defmodule Blog.Supervisor do
  use Application
  use Supervisor

  @impl true
  def start(_, _) do
    start_link()
  end

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl true
  def init(_) do
    children = [
      Blog.Repo
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
