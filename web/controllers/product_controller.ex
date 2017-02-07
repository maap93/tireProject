defmodule Tire.ProductController do
  use Tire.Web, :controller

  alias Tire.Product
  alias Tire.Repo

  def index(conn, _params) do
    products = Repo.all(Product)
    render(conn, "index.html", products: products)
  end

  def new(conn, _params) do
    changeset = Product.changeset(%Product{})
    render(conn, "new.html", changeset: changeset)
  end


end
