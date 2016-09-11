defmodule Chat.RoomChannel do
  use Phoenix.Channel
  alias Chat.Repo
  alias Chat.Message
  alias Chat.User

  def join("room:" <> _room_name, _params, socket) do
    {:ok, socket}
  end

  def handle_in("new_msg", %{"body" => body, "user" => user_email, "room_id" => room_id}, socket) do
    create_message(body, user_email, room_id)
    broadcast! socket, "new_msg", %{body: body, user: user_email}
    {:noreply, socket}
  end

  defp create_message(body, user_email, room_id) do
    user = Repo.get_by!(User, %{email: user_email})
    params = %{body: body, user_id: user.id, room_id: room_id}
    changeset = Message.changeset(%Message{}, params)
    Repo.insert!(changeset)
  end
end
