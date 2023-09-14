defmodule CanalNoticias.NoticierosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CanalNoticias.Noticieros` context.
  """

  @doc """
  Generate a noticiero.
  """
  def noticiero_fixture(attrs \\ %{}) do
    {:ok, noticiero} =
      attrs
      |> Enum.into(%{
        nombre: "some nombre",
        numero_programas: 42,
        pais: "some pais",
        idioma: "some idioma"
      })
      |> CanalNoticias.Noticieros.create_noticiero()

    noticiero
  end
end
