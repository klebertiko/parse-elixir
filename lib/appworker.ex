defmodule AppWorker do
  def start_link do
    port = System.get_env("PORT") |> String.to_integer
    IO.puts("Starting Cowboy on port #{port} ...")
    Plug.Adapters.Cowboy.http(App, [], port: port)
  end
end
