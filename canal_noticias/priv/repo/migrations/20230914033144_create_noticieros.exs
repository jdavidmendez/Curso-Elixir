defmodule CanalNoticias.Repo.Migrations.CreateNoticieros do
  use Ecto.Migration

  def change do
    create table(:noticieros, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :nombre, :string
      add :numero_programas, :integer
      add :pais, :string
      add :idioma, :string

      timestamps()
    end
  end
end
