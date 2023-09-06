defmodule PetsAndOwners.MascostasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PetsAndOwners.Mascostas` context.
  """

  @doc """
  Generate a mascota.
  """
  def mascota_fixture(attrs \\ %{}) do
    {:ok, mascota} =
      attrs
      |> Enum.into(%{
        nombre: "some nombre",
        edad: 42,
        tipo: "some tipo"
      })
      |> PetsAndOwners.Mascostas.create_mascota()

    mascota
  end
end
