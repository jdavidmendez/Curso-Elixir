defmodule PetsAndOwnersWeb.MascotaJSON do
  alias PetsAndOwners.Mascostas.Mascota

  @doc """
  Renders a list of mascotas.
  """
  def index(%{mascotas: mascotas}) do
    %{data: for(mascota <- mascotas, do: data(mascota))}
  end

  @doc """
  Renders a single mascota.
  """
  def show(%{mascota: mascota}) do
    %{data: data(mascota)}
  end

  defp data(%Mascota{} = mascota) do
    %{
      id: mascota.id,
      nombre: mascota.nombre,
      edad: mascota.edad,
      tipo: mascota.tipo,
      propietario: data_propietario(mascota.propietario) #A single propietario
    }
  end

#Structure to load propietarios
defp data_propietario(propietario) when is_nil(propietario), do: :ok

defp data_propietario(%Propietario{} = propietario) do
  %{
    id: propietario.id,
    num_id: propietario.num_id,
    nombre: propietario.nombre,
    apellido: propietario.apellido,
    fecha_nac: propietario.fecha_nac
  }
end
end
