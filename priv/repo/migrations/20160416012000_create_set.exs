defmodule PendrellVale.Repo.Migrations.CreateSet do
  use Ecto.Migration

  def change do
    create table(:sets) do
      add :name,          :text, null: false
      add :code,          :text
      add :gatherer_code, :text
      add :release_date,  :date
      add :border,        :text
      add :type,          :text
      add :block,         :text
      add :online_only,   :boolean, null: false, default: false
    end

    create unique_index(:sets, [:name])
  end
end
