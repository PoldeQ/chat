defmodule Chat.RoomTest do
  use Chat.ModelCase

  alias Chat.Room

  @valid_attrs %{name: "cokolwieka"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Room.changeset(%Room{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Room.changeset(%Room{}, @invalid_attrs)
    refute changeset.valid?
  end
end