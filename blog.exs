defmodule Blog do
  def start do
    spawn(&loop/0)
  end

  def loop do
    receive do
      any -> IO.puts("ECHO #{any}")
    end

    loop
  end
end

blog = Blog.start
send(blog, "Hello world")
