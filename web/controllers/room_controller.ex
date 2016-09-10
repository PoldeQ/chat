defmodule Chat.RoomController do
  use Chat.Web, :controller
  alias Chat.Repo
  alias Chat.Room

  def index(conn, _params) do
    rooms = Repo.all(Room)
    render(conn, "index.html", %{rooms: rooms})
  end

  def new(conn, _params) do
    changeset = Room.changeset(%Room{})
    render(conn, "new.html", %{changeset: changeset})
  end

  def create(conn, %{"room" => room_params}) do
    changeset = Room.changeset(%Room{}, room_params)

    case Repo.insert(changeset) do
      {:ok, _room} ->
        conn
        |> put_flash(:info, "Room created successfully.")
        |> redirect(to: room_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, params) do
    %{"id" => id} = params
    room = Repo.get!(Room, id)
    render(conn, "show.html", %{room: room})
  end

  def delete(conn, params) do
    %{"id" => id} = params
    room = Repo.get!(Room, id)
    Repo.delete!(room)
    redirect(conn, to: room_path(conn, :index))
  end

end
