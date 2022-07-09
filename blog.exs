defmodule Blog do
  def start do
    spawn(&loop/0)
  end

  def loop do
    IO.puts("Hello W0rld")
  end
end

Enum.map(1..10, fn(_) -> Blog.start end)
