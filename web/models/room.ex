defmodule Chat.Room do
  use Chat.Web, :model

  schema "rooms" do
    field :name, :string
    has_many :messages, Chat.Message
    
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
    |> validate_length(:name, min: 3)
  end
end
