defmodule Tire.ProductTest do
  use Tire.ModelCase

  alias Tire.Product

  @valid_attrs %{description: "some content", pattern: "some content", price: "120.5", product_code: "some content", stock: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Product.changeset(%Product{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Product.changeset(%Product{}, @invalid_attrs)
    refute changeset.valid?
  end
end
