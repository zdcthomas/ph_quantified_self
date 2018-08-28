ExUnit.configure(timeout: :infinity)
ExUnit.start(trace: true)

Ecto.Adapters.SQL.Sandbox.mode(PhQuantifiedSelf.Repo, :manual)

