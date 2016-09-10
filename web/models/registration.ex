defmodule Chat.Registration do
  alias Chat.Repo
  import Ecto.Changeset, only: [put_change: 3]
  def create(changeset) do
  changeset
    |> put_change(:crypted_password, Comeonin.Bcrypt.hashpwsalt(changeset.params["password"]))
    |> Repo.insert
  end

end
