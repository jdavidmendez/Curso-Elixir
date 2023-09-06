defmodule PetsAndOwners.PropietariosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PetsAndOwners.Propietarios` context.
  """

  @doc """
  Generate a propietario.
  """
  def propietario_fixture(attrs \\ %{}) do
    {:ok, propietario} =
      attrs
      |> Enum.into(%{
        num_iden: "some num_iden",
        apellido: "some apellido",
        fecha_nac: ~D[2023-09-05],
        edad: 42
      })
      |> PetsAndOwners.Propietarios.create_propietario()

    propietario
  end
end
