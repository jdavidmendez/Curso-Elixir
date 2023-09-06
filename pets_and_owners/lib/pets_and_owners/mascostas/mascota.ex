defmodule PetsAndOwners.Mascostas.Mascota do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "mascotas" do
    field :nombre, :string
    field :edad, :integer
    field :tipo, :string
    belongs_to :propietario, TransitoApp.Propietarios.Propietario

    timestamps()
  end

  @doc false
  def changeset(mascota, attrs) do
    mascota
    |> cast(attrs, [:nombre, :edad, :tipo])
    |> validate_required([:nombre, :edad, :tipo])
  end
end
