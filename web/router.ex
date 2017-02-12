defmodule Tire.Router do
  use Tire.Web, :router
  use Coherence.Router
  use ExAdmin.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :browser
    coherence_routes
  end

  scope "/" do
    pipe_through :protected
    coherence_routes :protected
  end

  scope "/", Tire do
    pipe_through :protected # Use the default browser stack

    get "/", PageController, :index
    resources "/products", ProductController
  end

  scope "/", Tire do
    pipe_through :protected
  end

  scope "/admin", ExAdmin do
    pipe_through :protected
    admin_routes
  end

  # Other scopes may use custom stacks.
  # scope "/api", Tire do
  #   pipe_through :api
  # end
end
