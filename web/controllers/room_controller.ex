defmodule Chat.RoomController do
  use Chat.Web, :controller
  alias Chat.Repo
  alias Chat.Room
  import Chat.Session, only: [current_user: 1]

  plug Chat.Plugs.Authenticate

  def index(conn, _params) do
    rooms = Repo.all(Room) |> Repo.preload(:user)
    render(conn, "index.html", %{rooms: rooms})
  end

  def new(conn, _params) do
    changeset = Room.changeset(%Room{})
    render(conn, "new.html", %{changeset: changeset})
  end

  def create(conn, %{"room" => room_params}) do
    room_params = room_params
    |>Map.put("user_id", current_user(conn).id)
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
    query = from m in Chat.Message, where: m.room_id == ^id
    room = Repo.get!(Room, id)
    messages = Repo.all(query) |> Repo.preload(:user)
    render(conn, "show.html", %{room: room, messages: messages})
  end

  def delete(conn, params) do
    %{"id" => id} = params
    room = Repo.get!(Room, id)
    Repo.delete!(room)
    redirect(conn, to: room_path(conn, :index))
  end

end
