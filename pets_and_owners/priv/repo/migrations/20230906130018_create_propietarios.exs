defmodule PetsAndOwners.Repo.Migrations.CreatePropietarios do
  use Ecto.Migration

  def change do
    create table(:propietarios, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :num_iden, :string
      add :apellido, :string
      add :fecha_nac, :date
      add :edad, :integer

      timestamps()
    end
  end
end
