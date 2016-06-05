defmodule PendrellVale.Deck do
  use PendrellVale.Web, :model

  schema "decks" do

    belongs_to :user, PendrellVale.User
    has_many :deck_card_relations, PendrellVale.DeckCardRelation
  end
end

defmodule PendrellVale.DeckCardRelation do
  use PendrellVale.Web, :model

  schema "deck_card_relation" do
    field :quantity, :integer
    field :group,    :string #main_deck or sideboard

    belongs_to :deck, PendrellVale.Deck
    has_many :cards, PendrellVale.Card
  end
end
