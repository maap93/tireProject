defmodule Tire.Repo.Migrations.AddTsPrice do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :tsprice, :float
    end
  end
end
