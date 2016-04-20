defmodule PendrellVale.Card do
  use PendrellVale.Web, :model

  schema "cards" do
    field :name,                :string
    field :name_translations,   :map
    field :multiverse_id,       :integer
    # todo multiverse id translations
    field :names,               {:array, :string}
    field :layout,              :string
    field :mana_cost,           :string
    field :converted_mana_cost, :integer, default: 0
    field :colors,              {:array, :string}
    field :type,                :string
    field :types,               {:array, :string}
    field :subtypes,            {:array, :string}
    field :rarity,              :string
    field :text,                :string
    field :original_text,       :string
    field :flavor,              :string
    field :artist,              :string
    field :number,              :string
    field :power,               :integer
    field :toughness,           :integer
    field :variants,            {:array, :integer}
    field :reserved,            :boolean, default: false
    field :printings,           {:array, :string}
    #field :rulings, :json

    belongs_to :set, PendrellVale.Set

    timestamps
  end

  @required_fields ~w(name layout colors type types subtypes rarity artist)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
