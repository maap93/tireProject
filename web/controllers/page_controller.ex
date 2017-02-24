defmodule Tire.PageController do
  use Tire.Web, :controller

  def index(conn, _params) do

    redirect conn, to: "/products"
  end
end
