defmodule PetsAndOwnersWeb.MascotaControllerTest do
  use PetsAndOwnersWeb.ConnCase

  import PetsAndOwners.MascostasFixtures

  alias PetsAndOwners.Mascostas.Mascota

  @create_attrs %{
    nombre: "some nombre",
    edad: 42,
    tipo: "some tipo"
  }
  @update_attrs %{
    nombre: "some updated nombre",
    edad: 43,
    tipo: "some updated tipo"
  }
  @invalid_attrs %{nombre: nil, edad: nil, tipo: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all mascotas", %{conn: conn} do
      conn = get(conn, ~p"/api/mascotas")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create mascota" do
    test "renders mascota when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/mascotas", mascota: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/mascotas/#{id}")

      assert %{
               "id" => ^id,
               "edad" => 42,
               "nombre" => "some nombre",
               "tipo" => "some tipo"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/mascotas", mascota: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update mascota" do
    setup [:create_mascota]

    test "renders mascota when data is valid", %{conn: conn, mascota: %Mascota{id: id} = mascota} do
      conn = put(conn, ~p"/api/mascotas/#{mascota}", mascota: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/mascotas/#{id}")

      assert %{
               "id" => ^id,
               "edad" => 43,
               "nombre" => "some updated nombre",
               "tipo" => "some updated tipo"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, mascota: mascota} do
      conn = put(conn, ~p"/api/mascotas/#{mascota}", mascota: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete mascota" do
    setup [:create_mascota]

    test "deletes chosen mascota", %{conn: conn, mascota: mascota} do
      conn = delete(conn, ~p"/api/mascotas/#{mascota}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/mascotas/#{mascota}")
      end
    end
  end

  defp create_mascota(_) do
    mascota = mascota_fixture()
    %{mascota: mascota}
  end
end
