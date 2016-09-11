defmodule Chat.Message do
  use Chat.Web, :model

  schema "messages" do
    field :body, :string
    belongs_to :user, Chat.User
    belongs_to :room, Chat.Room

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:body, :user_id, :room_id])
    |> validate_required([:body, :user_id, :room_id])
  end
end
