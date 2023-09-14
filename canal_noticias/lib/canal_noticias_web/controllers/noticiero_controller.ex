defmodule CanalNoticiasWeb.NoticieroController do
  use CanalNoticiasWeb, :controller

  alias CanalNoticias.Noticieros
  alias CanalNoticias.Noticieros.Noticiero

  action_fallback CanalNoticiasWeb.FallbackController

  def index(conn, _params) do
    noticieros = Noticieros.list_noticieros()
    render(conn, :index, noticieros: noticieros)
  end

  def create(conn, %{"noticiero" => noticiero_params}) do
    with {:ok, %Noticiero{} = noticiero} <- Noticieros.create_noticiero(noticiero_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/noticieros/#{noticiero}")
      |> render(:show, noticiero: noticiero)
    end
  end

  def show(conn, %{"id" => id}) do
    noticiero = Noticieros.get_noticiero!(id)
    render(conn, :show, noticiero: noticiero)
  end

  def update(conn, %{"id" => id, "noticiero" => noticiero_params}) do
    noticiero = Noticieros.get_noticiero!(id)

    with {:ok, %Noticiero{} = noticiero} <- Noticieros.update_noticiero(noticiero, noticiero_params) do
      render(conn, :show, noticiero: noticiero)
    end
  end

  def delete(conn, %{"id" => id}) do
    noticiero = Noticieros.get_noticiero!(id)

    with {:ok, %Noticiero{}} <- Noticieros.delete_noticiero(noticiero) do
      send_resp(conn, :no_content, "")
    end
  end
end
