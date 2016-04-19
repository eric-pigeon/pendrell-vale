defmodule PendrellVale.Repo.Migrations.CreateCard do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :name, :string
      add :name_translations, :hstore

      timestamps
    end
  end
end
