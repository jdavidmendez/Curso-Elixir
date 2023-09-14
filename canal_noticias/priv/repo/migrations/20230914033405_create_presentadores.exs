defmodule CanalNoticias.Repo.Migrations.CreatePresentadores do
  use Ecto.Migration

  def change do
    create table(:presentadores, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :nombre, :string
      add :edad, :integer
      add :programa, :string
      add :noticiero_id, references(:noticieros, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:presentadores, [:noticiero_id])
  end
end
