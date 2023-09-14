defmodule CanalNoticias.PresentadoresFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CanalNoticias.Presentadores` context.
  """

  @doc """
  Generate a presentador.
  """
  def presentador_fixture(attrs \\ %{}) do
    {:ok, presentador} =
      attrs
      |> Enum.into(%{
        nombre: "some nombre",
        edad: 42,
        programa: "some programa"
      })
      |> CanalNoticias.Presentadores.create_presentador()

    presentador
  end
end
