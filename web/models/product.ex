defmodule Tire.Product do
  use Tire.Web, :model
  use Arc.Ecto.Schema

  schema "products" do
    field :product_code, :string
    field :description, :string
    field :pattern, :string
    field :stock, :integer
    field :price, :float
    field :image, Tire.ImageUploader.Type

    many_to_many :requests, Tire.Request, join_through: Tire.Order

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:product_code, :description, :pattern, :stock, :price, :image])
    |> validate_required([:product_code, :description, :pattern, :stock, :price, :image])
  end
end
