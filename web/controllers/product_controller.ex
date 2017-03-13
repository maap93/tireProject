defmodule Tire.ProductController do
  use Tire.Web, :controller

  alias Tire.Product
  alias Tire.Repo

  def index(conn, _params) do
    products = Repo.all(Product)
    products = Tire.Product |> Tire.Repo.paginate(page_size: 2)
    IO.inspect products
    user_discount = conn.assigns.current_user.discount
    render(conn, "index.html",
    products: products,
    user_discount: user_discount,
    page_number: products.page_number,
    page_size: products.page_size,
    total_pages: products.total_pages,
    total_entries: products.total_entries)
  end

  def new(conn, _params) do
    changeset = Product.changeset(%Product{})
    render(conn, "new.html", changeset: changeset)
  end

  def show(conn, %{"id" => id}) do
    product = Repo.get!(Product, id)
    render(conn, "show.html", product: product)
  end

end
