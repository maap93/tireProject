defmodule Tire.Order do
  use Tire.Web, :model

  schema "orders" do
    belongs_to :request, Tire.Request
    belongs_to :product, Tire.Product

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:request_id, :product_id])
    |> validate_required([])
  end
end
