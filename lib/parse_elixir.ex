defmodule ParseElixir do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(AppWorker, [])
    ]

    opts = [strategy: :one_for_one, name: ParseElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
