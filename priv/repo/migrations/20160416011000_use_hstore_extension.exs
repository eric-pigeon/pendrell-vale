defmodule PendrellVale.Repo.Migrations.UseHstoreExtension do
  use Ecto.Migration

  def up do
    execute ~s(CREATE EXTENSION IF NOT EXISTS "hstore")
  end

  def down do
    execute ~s(DROP EXTENSION IF EXISTS "hstore")
  end
end
