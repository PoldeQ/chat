defmodule Chat.IntegrationCase do
  use ExUnit.CaseTemplate
  use Hound.Helpers

  using do
    quote do
      use Hound.Helpers
      import Chat.IntegrationCase

      hound_session
      end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Chat.Repo)

    unless tags[:async] do
    Ecto.Adapters.SQL.Sandbox.mode(Chat.Repo, {:shared, self()})
  end

  :ok
  end
end
