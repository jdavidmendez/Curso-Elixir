defmodule CanalNoticiasWeb.PresentadorControllerTest do
  use CanalNoticiasWeb.ConnCase

  import CanalNoticias.PresentadoresFixtures

  alias CanalNoticias.Presentadores.Presentador

  @create_attrs %{
    nombre: "some nombre",
    edad: 42,
    programa: "some programa"
  }
  @update_attrs %{
    nombre: "some updated nombre",
    edad: 43,
    programa: "some updated programa"
  }
  @invalid_attrs %{nombre: nil, edad: nil, programa: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all presentadores", %{conn: conn} do
      conn = get(conn, ~p"/api/presentadores")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create presentador" do
    test "renders presentador when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/presentadores", presentador: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/presentadores/#{id}")

      assert %{
               "id" => ^id,
               "edad" => 42,
               "nombre" => "some nombre",
               "programa" => "some programa"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/presentadores", presentador: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update presentador" do
    setup [:create_presentador]

    test "renders presentador when data is valid", %{conn: conn, presentador: %Presentador{id: id} = presentador} do
      conn = put(conn, ~p"/api/presentadores/#{presentador}", presentador: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/presentadores/#{id}")

      assert %{
               "id" => ^id,
               "edad" => 43,
               "nombre" => "some updated nombre",
               "programa" => "some updated programa"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, presentador: presentador} do
      conn = put(conn, ~p"/api/presentadores/#{presentador}", presentador: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete presentador" do
    setup [:create_presentador]

    test "deletes chosen presentador", %{conn: conn, presentador: presentador} do
      conn = delete(conn, ~p"/api/presentadores/#{presentador}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/presentadores/#{presentador}")
      end
    end
  end

  defp create_presentador(_) do
    presentador = presentador_fixture()
    %{presentador: presentador}
  end
end
