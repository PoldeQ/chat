defmodule Chat.UsersTest do
  use Chat.ModelCase

  alias Chat.User

  @valid_attrs %{password: "some content", email: "user@user.com"}
  @empty_attrs %{}
  @invalid_attrs %{password: "1", email: "1"}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with empty attributes" do
    changeset = User.changeset(%User{}, @empty_attrs)
    assert changeset.errors[:password] == {"can't be blank", []}
    assert changeset.errors[:emai] == nil
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    assert changeset.errors[:password] == {"should be at least %{count} character(s)", [count: 6]}
    assert changeset.errors[:emai] == nil
  end

end
