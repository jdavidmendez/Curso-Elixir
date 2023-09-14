defmodule CanalNoticias.Noticieros.Noticiero do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "noticieros" do
    field :nombre, :string
    field :numero_programas, :integer
    field :pais, :string
    field :idioma, :string
    has_many :presentadores, CanalNoticias.Presentadores.Presentador
    timestamps()
  end

  @doc false
  def changeset(noticiero, attrs) do
    noticiero
    |> cast(attrs, [:nombre, :numero_programas, :pais, :idioma])
    |> validate_required([:nombre, :numero_programas, :pais, :idioma])
  end
end
