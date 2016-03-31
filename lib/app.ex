defmodule App do
	import Plug.Conn
  use Router

  def route("GET", [], conn) do
    IO.puts("GET /")
    conn |> send_resp(200, Poison.encode!(%{mensagem: "Hello, world!"}))
  end

  def route("GET", ["hello", name], conn) do
    IO.puts("GET /hello/#{name}")
		conn
		|> put_resp_content_type("application/json")
  	|> send_resp(200, Poison.encode!(%{mensagem: "Hello " <> name}))
  end

  def route(method, path, conn) do
    IO.puts("#{String.upcase(method)} /#{path}")
    conn |> send_resp(404, Poison.encode!(%{mensagem: "Oops!"}))
  end

end
