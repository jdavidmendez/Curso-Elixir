defmodule CanalNoticiasWeb.NoticieroControllerTest do
  use CanalNoticiasWeb.ConnCase

  import CanalNoticias.NoticierosFixtures

  alias CanalNoticias.Noticieros.Noticiero

  @create_attrs %{
    nombre: "some nombre",
    numero_programas: 42,
    pais: "some pais",
    idioma: "some idioma"
  }
  @update_attrs %{
    nombre: "some updated nombre",
    numero_programas: 43,
    pais: "some updated pais",
    idioma: "some updated idioma"
  }
  @invalid_attrs %{nombre: nil, numero_programas: nil, pais: nil, idioma: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all noticieros", %{conn: conn} do
      conn = get(conn, ~p"/api/noticieros")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create noticiero" do
    test "renders noticiero when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/noticieros", noticiero: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/noticieros/#{id}")

      assert %{
               "id" => ^id,
               "idioma" => "some idioma",
               "nombre" => "some nombre",
               "numero_programas" => 42,
               "pais" => "some pais"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/noticieros", noticiero: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update noticiero" do
    setup [:create_noticiero]

    test "renders noticiero when data is valid", %{conn: conn, noticiero: %Noticiero{id: id} = noticiero} do
      conn = put(conn, ~p"/api/noticieros/#{noticiero}", noticiero: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/noticieros/#{id}")

      assert %{
               "id" => ^id,
               "idioma" => "some updated idioma",
               "nombre" => "some updated nombre",
               "numero_programas" => 43,
               "pais" => "some updated pais"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, noticiero: noticiero} do
      conn = put(conn, ~p"/api/noticieros/#{noticiero}", noticiero: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete noticiero" do
    setup [:create_noticiero]

    test "deletes chosen noticiero", %{conn: conn, noticiero: noticiero} do
      conn = delete(conn, ~p"/api/noticieros/#{noticiero}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/noticieros/#{noticiero}")
      end
    end
  end

  defp create_noticiero(_) do
    noticiero = noticiero_fixture()
    %{noticiero: noticiero}
  end
end
