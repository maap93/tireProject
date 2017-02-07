defmodule Tire.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :product_code, :string
      add :description, :string
      add :pattern, :string
      add :stock, :integer
      add :price, :float

      timestamps()
    end

  end
end
