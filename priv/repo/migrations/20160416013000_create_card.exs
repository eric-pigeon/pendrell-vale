defmodule PendrellVale.Repo.Migrations.CreateCard do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :name,                :text,           null: false
      add :name_translations,   :hstore
      add :multiverse_id,       :integer
      add :names,               {:array, :text}
      add :layout,              :text,           null: false
      add :mana_cost,           :text
      add :converted_mana_cost, :integer,        null: false, default: 0
      add :colors,              {:array, :text}, null: false
      add :type,                :text,           null: false
      add :types,               {:array, :text}, null: false
      add :subtypes,            {:array, :text}, null: false
      add :rarity,              :text,           null: false
      add :text,                :text
      add :original_text,       :text
      add :flavor,              :text
      add :artist,              :text,           null: false
      add :number,              :text
      add :power,               :integer
      add :toughness,           :integer
      add :variants,            {:array, :integer}
      add :reserved,            :boolean,        null: false, default: false
      add :printings,           {:array, :text}

      add :set_id, references(:sets, on_delete: :delete_all)

      timestamps
    end
  end
end
