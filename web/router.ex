defmodule Juru.Router do
  use Juru.Web, :router

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

  scope "/", Juru do
    pipe_through :browser # Use the default browser stack

    get "/", TransactionController, :new
    post "/create", TransactionController, :create, as: :transaction

    get "/assets", AssetController, :index
    get "/assets/new", AssetController, :new
    post "/assets/create", AssetController, :create

    get "/login", SessionController, :new, as: :login
    post "/login", SessionController, :create, as: :login
    get "/logout", SessionController, :delete, as: :logout
    delete "/logout", SessionController, :delete, as: :logout
  end

  # Other scopes may use custom stacks.
  # scope "/api", Juru do
  #   pipe_through :api
  # end
end
