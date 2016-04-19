defmodule PendrellVale.Set do
  use PendrellVale.Web, :model

  schema "sets" do
    field :name,          :string
    field :code,          :string
    field :gatherer_code, :string
    field :release_date,  Ecto.Date
    field :border,        :string
    field :type,          :string
    field :block,         :string
    field :online_only,   :boolean, default: false

    has_many :cards, PendrellVale.Card
  end

  @required_fields ~w(name code release_date border type)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
