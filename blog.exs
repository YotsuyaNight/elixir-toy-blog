defmodule Blog do
  def start do
    spawn(fn -> loop(Map.new) end)
  end

  def loop(state) do
    new_state = receive do
      {:create, %{id: id, author: author, title: title, body: body}} -> Map.put(state, id, %{author: author, title: title, body: body})
      _ -> raise "Unknown operation"
    end

    loop(new_state)
  end

  def create(pid, data), do: send(pid, {:create, data})
end

blog = Blog.start
Blog.create(blog, %{id: 1, title: "How to learn Elixir", author: "Yotsuya", body: "Fast and easy"})
