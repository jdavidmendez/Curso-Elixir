defmodule PetsAndOwnersWeb.PropietarioJSON do
  alias PetsAndOwners.Propietarios.Propietario

  @doc """
  Renders a list of propietarios.
  """
  def index(%{propietarios: propietarios}) do
    %{data: for(propietario <- propietarios, do: data(propietario))}
  end

  @doc """
  Renders a single propietario.
  """
  def show(%{propietario: propietario}) do
    %{data: data(propietario)}
  end

  defp data(%Propietario{} = propietario) do
    %{
      id: propietario.id,
      num_iden: propietario.num_iden,
      apellido: propietario.apellido,
      fecha_nac: propietario.fecha_nac,
      edad: propietario.edad,
      mascotas: for(m <- propietario.mascotas, do: data_mascotas(m)) #Many mascotas
    }
  end

#Structure to load mascotas
  defp data_mascotas(%Mascota{} = mascota) do
    %{
      id: mascota.id,
      nombre: mascota.nombre,
      edad: mascota.edad,
      tipo: mascota.tipo
    }

  end
end
