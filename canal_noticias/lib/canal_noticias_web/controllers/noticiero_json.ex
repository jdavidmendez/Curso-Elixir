defmodule CanalNoticiasWeb.NoticieroJSON do
  alias CanalNoticias.Noticieros.Noticiero

  @doc """
  Renders a list of noticieros.
  """
  def index(%{noticieros: noticieros}) do
    %{data: for(noticiero <- noticieros, do: data(noticiero))}
  end

  @doc """
  Renders a single noticiero.
  """
  def show(%{noticiero: noticiero}) do
    %{data: data(noticiero)}
  end

  defp data(%Noticiero{} = noticiero) do
    %{
      id: noticiero.id,
      nombre: noticiero.nombre,
      numero_programas: noticiero.numero_programas,
      pais: noticiero.pais,
      idioma: noticiero.idioma,
      presentadores: for(v <- noticiero.presentadores, do: data_presentadores(v))
    }
  end

  defp data_presentadores(%Presentador{} = presentador) do
   %{
      nombre: presentador.nombre,
      edad: presentador.edad,
      programa: presentador.programa
    } 
  end
end
