defmodule Mix.Tasks.PendrellVale.ImportCards do
  use Mix.Task
  alias PendrellVale.Repo

  def run(_args) do
    Mix.Task.run "app.start", []

    with {:ok, file} <- Path.expand("data/sets.json") |> File.read,
         {:ok, sets} <- Poison.Parser.parse(file) do

      sets |> Enum.map(&insert_set/1)
    end
  end

  defp insert_set(json_set) do
    with {:ok, release_date} <- Ecto.Date.cast(json_set["releaseDate"]) do
      changes = %{
        name: json_set["name"],
        code: json_set["code"],
        gatherer_code: json_set["gathererCode"],
        release_date: release_date,
        border: json_set["border"],
        type: json_set["type"],
        block: json_set["block"],
        online_only: json_set["onlineOnly"]
      }

      set =
        %PendrellVale.Set{}
        |> PendrellVale.Set.changeset(changes)
        |> Repo.insert!

      json_set["cards"] |> Enum.map(&(insert_card(&1, set)))
    end
  end

  defp insert_card(card, set) do
    changes = %{
      name: card["name"],
      name_translations: %{},
      multiverse_id: card["multiverseid"],
      #names,
      layout: card["layout"],
      mana_cost: card["manaCost"],
      converted_mana_cost: card["cmc"],
      #colors,
      type: card["type"],
      #types,
      #subtypes,
      rarity: card["rarity"],
      #text,
      #original_text,
      #flavor,
      artist: card["artist"],
      #number,
      #power,
      #toughness,
      #variants,
      reserved: card["reserved"],
      #printings
      set_id: set.id
    }

    IO.inspect changes

    %PendrellVale.Card{}
    |> PendrellVale.Card.changeset(changes)
    |> Repo.insert!
  end
end
