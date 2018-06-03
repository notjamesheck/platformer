defmodule PlatformerWeb.Router do
  use PlatformerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug PlatformWeb.PlayerAuthController, repo: Platform.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PlatformerWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/players", PlayerController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PlatformerWeb do
  #   pipe_through :api
  # end
end
