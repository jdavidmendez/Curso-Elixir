defmodule CanalNoticias.Presentadores do
  @moduledoc """
  The Presentadores context.
  """

  import Ecto.Query, warn: false
  alias CanalNoticias.Repo

  alias CanalNoticias.Presentadores.Presentador

  @doc """
  Returns the list of presentadores.

  ## Examples

      iex> list_presentadores()
      [%Presentador{}, ...]

  """
  def list_presentadores do
    Repo.all(Presentador)
  end

  @doc """
  Gets a single presentador.

  Raises `Ecto.NoResultsError` if the Presentador does not exist.

  ## Examples

      iex> get_presentador!(123)
      %Presentador{}

      iex> get_presentador!(456)
      ** (Ecto.NoResultsError)

  """
  def get_presentador!(id), do: Repo.get!(Presentador, id)

  @doc """
  Creates a presentador.

  ## Examples

      iex> create_presentador(%{field: value})
      {:ok, %Presentador{}}

      iex> create_presentador(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_presentador(attrs \\ %{}) do
    %Presentador{}
    |> Presentador.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a presentador.

  ## Examples

      iex> update_presentador(presentador, %{field: new_value})
      {:ok, %Presentador{}}

      iex> update_presentador(presentador, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_presentador(%Presentador{} = presentador, attrs) do
    presentador
    |> Presentador.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a presentador.

  ## Examples

      iex> delete_presentador(presentador)
      {:ok, %Presentador{}}

      iex> delete_presentador(presentador)
      {:error, %Ecto.Changeset{}}

  """
  def delete_presentador(%Presentador{} = presentador) do
    Repo.delete(presentador)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking presentador changes.

  ## Examples

      iex> change_presentador(presentador)
      %Ecto.Changeset{data: %Presentador{}}

  """
  def change_presentador(%Presentador{} = presentador, attrs \\ %{}) do
    Presentador.changeset(presentador, attrs)
  end
end
