defmodule Chat.RegistrationController do
  use Chat.Web, :controller
  alias Chat.User

    def new(conn, _params) do
    changeset = User.changeset(%User{})
      render(conn, %{changeset: changeset})
    end

    def create(conn, %{"user" => user_params}) do
      changeset = User.changeset(%User{}, user_params)

        case Chat.Registration.create(changeset) do
          {:ok, _user} ->
          conn
          |> put_flash(:info, "Zrobiłeś konto!!!")
          |> redirect(to: "/rooms")
          {:error, changeset} ->
          render(conn, "new.html", changeset: changeset)
        end
    end
end
