defmodule Chat.LoginTest do
    use Chat.IntegrationCase
    alias Chat.User
    alias Chat.Repo

    @tag :integration
    test "login" do
    User.changeset(%User{}, %{email: "kloc@gmail.com", password: "klocky"})
    |> Chat.Registration.create

    navigate_to "/login"
    login_form = find_element(:css, "form")

    login_form
    |> find_within_element(:id, "session_email")
    |> fill_field("kloc@gmail.com")

    login_form
    |> find_within_element(:id, "session_password")
    |> fill_field("klocky")

    login_form
    |> submit_element

    assert page_source =~ "Zalogowałeś się!"
  end

end
