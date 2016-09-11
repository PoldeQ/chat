defmodule Chat.SessionController do
  use Chat.Web, :controller

  def new(conn, _params) do
  render(conn, "new.html")
  end

  def create(conn, %{"session" => session_params}) do
    case Chat.Session.login(session_params) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "Zalogowałeś się!")
        |> redirect(to: "/")
      :error ->
        conn
        |> put_flash(:info, "Niepoprawny login lub hasło")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> delete_session(:current_user)
    |> put_flash(:info, "Zostałeś wylogowany!")
    |> redirect(to: "/")
  end
end
