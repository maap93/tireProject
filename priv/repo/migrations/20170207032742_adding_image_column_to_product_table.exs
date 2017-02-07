defmodule Tire.Repo.Migrations.AddingImageColumnToProductTable do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :image, :string
    end
  end
end
