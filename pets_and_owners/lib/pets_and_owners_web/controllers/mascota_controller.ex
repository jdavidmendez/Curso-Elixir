defmodule PetsAndOwnersWeb.MascotaController do
  use PetsAndOwnersWeb, :controller

  alias PetsAndOwners.Mascostas
  alias PetsAndOwners.Mascostas.Mascota

  action_fallback PetsAndOwnersWeb.FallbackController

  def index(conn, _params) do
    mascotas = Mascostas.list_mascotas()
    render(conn, :index, mascotas: mascotas)
  end

  def create(conn, %{"mascota" => mascota_params}) do
    with {:ok, %Mascota{} = mascota} <- Mascostas.create_mascota(mascota_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/mascotas/#{mascota}")
      |> render(:show, mascota: mascota)
    end
  end

  def show(conn, %{"id" => id}) do
    mascota = Mascostas.get_mascota!(id)
    render(conn, :show, mascota: mascota)
  end

  def update(conn, %{"id" => id, "mascota" => mascota_params}) do
    mascota = Mascostas.get_mascota!(id)

    with {:ok, %Mascota{} = mascota} <- Mascostas.update_mascota(mascota, mascota_params) do
      render(conn, :show, mascota: mascota)
    end
  end

  def delete(conn, %{"id" => id}) do
    mascota = Mascostas.get_mascota!(id)

    with {:ok, %Mascota{}} <- Mascostas.delete_mascota(mascota) do
      send_resp(conn, :no_content, "")
    end
  end
end
