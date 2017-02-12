defmodule Tire.Request do
  use Tire.Web, :model

  schema "requests" do
    field :comments, :string
    belongs_to :user, Tire.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:comments, :user_id])
    |> validate_required([:comments])
  end
end
