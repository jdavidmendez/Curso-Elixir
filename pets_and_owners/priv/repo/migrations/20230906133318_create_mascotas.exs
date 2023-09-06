defmodule PetsAndOwners.Repo.Migrations.CreateMascotas do
  use Ecto.Migration

  def change do
    create table(:mascotas, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :nombre, :string
      add :edad, :integer
      add :tipo, :string
      add :propietario_id, references(:propietarios, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:mascotas, [:propietario_id])
  end
end
