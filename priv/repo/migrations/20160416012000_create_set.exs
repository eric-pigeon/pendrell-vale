defmodule PendrellVale.Repo.Migrations.CreateSet do
  use Ecto.Migration

  def change do
    create table(:sets) do
      add :name,          :string
      add :code,          :string
      add :gatherer_code, :string
      add :release_date,  :date
      add :border,        :string
      add :type,          :string
      add :block,         :string
      add :online_only,   :boolean, null: false, default: false
    end
  end
end
