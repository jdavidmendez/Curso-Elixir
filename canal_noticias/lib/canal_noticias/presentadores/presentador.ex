defmodule CanalNoticias.Presentadores.Presentador do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "presentadores" do
    field :nombre, :string
    field :edad, :integer
    field :programa, :string
    field :noticiero_id, :binary_id
    belongs_to :noticiero, CanalNoticias.Noticieros.Noticiero
    timestamps()
  end

  @doc false
  def changeset(presentador, attrs) do
    presentador
    |> cast(attrs, [:nombre, :edad, :programa])
    |> validate_required([:nombre, :edad, :programa])
  end
end
