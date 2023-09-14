defmodule CanalNoticiasWeb.PresentadorJSON do
  alias CanalNoticias.Presentadores.Presentador

  @doc """
  Renders a list of presentadores.
  """
  def index(%{presentadores: presentadores}) do
    %{data: for(presentador <- presentadores, do: data(presentador))}
  end

  @doc """
  Renders a single presentador.
  """
  def show(%{presentador: presentador}) do
    %{data: data(presentador)}
  end

  defp data(%Presentador{} = presentador) do
    %{
      id: presentador.id,
      nombre: presentador.nombre,
      edad: presentador.edad,
      programa: presentador.programa
    }
  end
end
