defmodule Chat.RegistrationTest do
  use Chat.IntegrationCase

  @tag :integration
    test "register new user" do
    navigate_to "/registrations/new"
    sign_up_form = find_element(:css, "form")

    sign_up_form
    |> find_within_element(:id, "user_email")
    |> fill_field("kloc@gmail.com")

    sign_up_form
    |> find_within_element(:id, "user_password")
    |> fill_field("klocky")

    sign_up_form
    |> submit_element

    assert page_source =~ "Zrobiłeś konto!!!"
  end

end
