defmodule PendrellVale.User do
  use PendrellVale.Web, :model

  schema "users" do
    field :email, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_digest, :string

    has_many :decks, PendrellVale.Deck
    timestamps
  end

  @required_fields ~w(username)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:email)
    |> unique_constraint(:username)
  end


  def signup_changeset(model, params) do
    model
    |> changeset(params)
    |> cast(params, ~w(email password), [])
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_digest, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end
