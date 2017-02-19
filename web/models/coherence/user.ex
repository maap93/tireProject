defmodule Tire.User do
  use Tire.Web, :model
  use Coherence.Schema

  schema "users" do
    field :name, :string
    field :email, :string
    field :admin, :boolean
    has_many :requests, Tire.Request
    coherence_schema

    timestamps
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:name, :email, :admin] ++ coherence_fields)
    |> cast_assoc(:requests)
    |> validate_required([:name, :email])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> validate_coherence(params)
  end
end
