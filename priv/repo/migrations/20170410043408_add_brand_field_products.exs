defmodule Tire.Repo.Migrations.AddBrandFieldProducts do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :brand, :string
    end
  end
end
