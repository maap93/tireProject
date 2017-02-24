defmodule Tire.Repo.Migrations.AddedDiscountField do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :discount, :float
    end
  end
end
