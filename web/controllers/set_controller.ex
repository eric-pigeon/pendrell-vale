defmodule PendrellVale.SetController do
  use PendrellVale.Web, :controller

  alias PendrellVale.Set

  def index(conn, _params) do
    sets = Repo.all(Set)
    render(conn, "index.html", sets: sets)
  end
end
