defmodule Tire.PageController do
  use Tire.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
