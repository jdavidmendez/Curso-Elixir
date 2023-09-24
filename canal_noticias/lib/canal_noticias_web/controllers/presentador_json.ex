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
      programa: presentador.programa,
      noticiero: data_noticiero(presentador.noticiero)
    }
  end

#Structure to load propietarios
defp data_noticiero(noticiero) when is_nil(noticiero), do: :ok

defp data_noticiero(%Noticiero{} = noticiero) do
  %{
      #id: noticiero.id,
    nombre: noticiero.nombre,
    numero_programas: noticiero.numero_programas,
    pais: noticiero.pais,
    idioma: noticiero.idioma,
  }
end
end
