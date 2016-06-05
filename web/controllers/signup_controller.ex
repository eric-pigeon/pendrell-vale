defmodule PendrellVale.SignupController do
  use PendrellVale.Web, :controller
  alias PendrellVale.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.signup_changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        #|> Rumbl.Auth.login(user)
        #|> put_flash(:info, "#{user.name} created!")
        #|> redirect(to: user_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
