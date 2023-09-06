defmodule PetsAndOwners.Propietarios.Propietario do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "propietarios" do
    field :num_iden, :string
    field :apellido, :string
    field :fecha_nac, :date
    field :edad, :integer
    has_many :mascotas, PetsAndOwners.Mascotas.Mascota
    timestamps()
  end

  @doc false
  def changeset(propietario, attrs) do
    propietario
    |> cast(attrs, [:num_iden, :apellido, :fecha_nac, :edad])
    |> validate_required([:num_iden, :apellido, :fecha_nac, :edad])
  end
end
