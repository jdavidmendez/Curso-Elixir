defmodule CanalNoticias.Noticieros do
  @moduledoc """
  The Noticieros context.
  """

  import Ecto.Query, warn: false
  alias CanalNoticias.Repo

  alias CanalNoticias.Noticieros.Noticiero

  @doc """
  Returns the list of noticieros.

  ## Examples

      iex> list_noticieros()
      [%Noticiero{}, ...]

  """
  def list_noticieros do
    Repo.all(Noticiero)
  end

  @doc """
  Gets a single noticiero.

  Raises `Ecto.NoResultsError` if the Noticiero does not exist.

  ## Examples

      iex> get_noticiero!(123)
      %Noticiero{}

      iex> get_noticiero!(456)
      ** (Ecto.NoResultsError)

  """
  def get_noticiero!(id), do: Repo.get!(Noticiero, id)

  @doc """
  Creates a noticiero.

  ## Examples

      iex> create_noticiero(%{field: value})
      {:ok, %Noticiero{}}

      iex> create_noticiero(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_noticiero(attrs \\ %{}) do
    %Noticiero{}
    |> Noticiero.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a noticiero.

  ## Examples

      iex> update_noticiero(noticiero, %{field: new_value})
      {:ok, %Noticiero{}}

      iex> update_noticiero(noticiero, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_noticiero(%Noticiero{} = noticiero, attrs) do
    noticiero
    |> Noticiero.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a noticiero.

  ## Examples

      iex> delete_noticiero(noticiero)
      {:ok, %Noticiero{}}

      iex> delete_noticiero(noticiero)
      {:error, %Ecto.Changeset{}}

  """
  def delete_noticiero(%Noticiero{} = noticiero) do
    Repo.delete(noticiero)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking noticiero changes.

  ## Examples

      iex> change_noticiero(noticiero)
      %Ecto.Changeset{data: %Noticiero{}}

  """
  def change_noticiero(%Noticiero{} = noticiero, attrs \\ %{}) do
    Noticiero.changeset(noticiero, attrs)
  end
end
