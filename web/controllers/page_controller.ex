defmodule PendrellVale.PageController do
  use PendrellVale.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
