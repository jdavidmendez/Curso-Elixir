defmodule PetsAndOwnersWeb.ErrorJSONTest do
  use PetsAndOwnersWeb.ConnCase, async: true

  test "renders 404" do
    assert PetsAndOwnersWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert PetsAndOwnersWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
