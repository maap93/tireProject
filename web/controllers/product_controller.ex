defmodule Tire.ProductController do
  use Tire.Web, :controller

  alias Tire.Product
  alias Tire.Repo

  def index(conn, _params) do
    products = Repo.all(Product)
    user_discount = conn.assigns.current_user.discount
    render(conn, "index.html", products: products, user_discount: user_discount)
  end

  #def index(conn, params) do
  #  page = Product |> Repo.paginate(params)
  #  user_discount = conn.assigns.current_user.discount
  #  render(conn, "index.html", products: page.entries, page: page, user_discount: user_discount)
  #end

  def new(conn, _params) do
    changeset = Product.changeset(%Product{})
    render(conn, "new.html", changeset: changeset)
  end

  def show(conn, %{"id" => id}) do
    product = Repo.get!(Product, id)
    render(conn, "show.html", product: product)
  end

end
