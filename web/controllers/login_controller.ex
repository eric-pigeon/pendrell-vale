defmodule PendrellVale.LoginController do
  use PendrellVale.Web, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"login" => %{"username" => username, "password" => password}}) do
    case PendrellVale.Auth.login_by_username_and_pass(conn, username, password, repo: Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome Back!")
        |> redirect(to: page_path(conn, :index))
      _ -> conn
    end
  end
end
