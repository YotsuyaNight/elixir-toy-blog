defmodule Blog.Application do
  use Application

  def start(_, _) do
    Blog.Repo.start_link
  end
end
