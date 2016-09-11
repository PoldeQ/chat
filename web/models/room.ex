defmodule Chat.Room do
  use Chat.Web, :model

  schema "rooms" do
    field :name, :string
    has_many :messages, Chat.Message
    belongs_to :user, Chat.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :user_id])
    |> validate_required([:name])
    |> validate_length(:name, min: 3)
  end
end
