defmodule Tire.Product do
  use Tire.Web, :model
  use Arc.Ecto.Schema

  schema "products" do
    field :product_code, :string
    field :description, :string
    field :pattern, :string
    field :stock, :integer
    field :price, :float
    field :search, :string
    field :image1, Tire.ImageUploader.Type
    field :image2, Tire.ImageUploader.Type
    field :image3, Tire.ImageUploader.Type
    field :image4, Tire.ImageUploader.Type

    many_to_many :requests, Tire.Request, join_through: Tire.Order

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:product_code, :description, :pattern, :stock, :price, :search, :image1, :image2, :image3, :image4])
    |> validate_required([:product_code, :description, :pattern, :stock, :price, :image1])
  end
end
