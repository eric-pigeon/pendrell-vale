defmodule PendrellVale.Router do
  use PendrellVale.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PendrellVale do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/sets", SetController, only: [:index]
    resources "/cards", CardController, only: [:show]
    resources "/signup", SignupController, only: [:new, :create]
    get "/login", LoginController, :new
    post "/login", LoginController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", PendrellVale do
  #   pipe_through :api
  # end
end
