defmodule Tire.Repo.Migrations.AddedSearchFieldProducts do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :search, :string
    end
  end
end
