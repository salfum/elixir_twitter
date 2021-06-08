defmodule ElixirTwitterWeb.Router do
  use ElixirTwitterWeb, :router

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

  pipeline :jwt_authenticated do
    plug ElixirTwitterWeb.Guardian.AuthPipeline
  end

  scope "/", ElixirTwitterWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", ElixirTwitterWeb do
    pipe_through [:api, :jwt_authenticated]

    get "/current_user", UsersController, :show
  end

    scope "/api", ElixirTwitterWeb do
    pipe_through :api

    resources "/users", UsersController, only: [:create]
    post "/sign_up", UsersController, :sign_up
    post "/sign_in", UsersController, :sign_in

    resources "/session", SessionController

    resources "/tweets", TweetsController, only: [:index, :create]
    get "/tweets/:id", TweetsController, :show_with_replies
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  #  if Mix.env() in [:dev, :test] do
  #    import Phoenix.LiveDashboard.Router
  #
  #    scope "/" do
  #      pipe_through :browser
  #      live_dashboard "/dashboard", metrics: ElixirTwitterWeb.Telemetry
  #    end
  #  end
end
