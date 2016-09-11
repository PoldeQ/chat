defmodule Chat.Plugs.Authenticate do
  import Plug.Conn
  import Chat.Router.Helpers
  import Phoenix.Controller, only: [put_flash: 3, redirect: 2]
  import Chat.Session, only: [current_user: 1]

  def init(default), do: default

  def call(conn, default) do
    case current_user(conn) do
      nil ->
        conn
        |> put_flash(:error, "Musisz się zalogować, aby przeglądać tę stronę.")
        |> redirect(to: session_path(conn, :new))
      _ -> conn
    end
  end
end
