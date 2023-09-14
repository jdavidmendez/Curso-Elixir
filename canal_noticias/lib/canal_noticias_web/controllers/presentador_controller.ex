defmodule CanalNoticiasWeb.PresentadorController do
  use CanalNoticiasWeb, :controller

  alias CanalNoticias.Presentadores
  alias CanalNoticias.Presentadores.Presentador

  action_fallback CanalNoticiasWeb.FallbackController

  def index(conn, _params) do
    presentadores = Presentadores.list_presentadores()
    render(conn, :index, presentadores: presentadores)
  end

  def create(conn, %{"presentador" => presentador_params}) do
    with {:ok, %Presentador{} = presentador} <- Presentadores.create_presentador(presentador_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/presentadores/#{presentador}")
      |> render(:show, presentador: presentador)
    end
  end

  def show(conn, %{"id" => id}) do
    presentador = Presentadores.get_presentador!(id)
    render(conn, :show, presentador: presentador)
  end

  def update(conn, %{"id" => id, "presentador" => presentador_params}) do
    presentador = Presentadores.get_presentador!(id)

    with {:ok, %Presentador{} = presentador} <- Presentadores.update_presentador(presentador, presentador_params) do
      render(conn, :show, presentador: presentador)
    end
  end

  def delete(conn, %{"id" => id}) do
    presentador = Presentadores.get_presentador!(id)

    with {:ok, %Presentador{}} <- Presentadores.delete_presentador(presentador) do
      send_resp(conn, :no_content, "")
    end
  end
end
