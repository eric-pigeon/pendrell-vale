defmodule Mix.Tasks.PendrellVale.ImportCards do
  use Mix.Task
  alias PendrellVale.Repo

  def run(_args) do
    Mix.Task.run "app.start", []

    {:ok, file} =
      Path.expand("data/sets.json")
        |> File.read

    {:ok, sets} = Poison.Parser.parse(file)
    sets
    #|> Enum.take(2)
    |> Enum.map(&insert_set/1)
    #IO.puts (Poison.Parser.parse(file) |> Enum.take(1))
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

      %PendrellVale.Set{}
      |> PendrellVale.Set.changeset(changes)
      |> Repo.insert!
    end
  end
end
