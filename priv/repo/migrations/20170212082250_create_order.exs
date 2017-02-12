defmodule Tire.Repo.Migrations.CreateOrder do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :request_id, references(:requests)
      add :product_id, references(:products)

      timestamps()
    end

  end
end
