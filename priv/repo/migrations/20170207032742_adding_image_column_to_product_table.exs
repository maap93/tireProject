defmodule Tire.Repo.Migrations.AddingImageColumnToProductTable do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :image1, :string
      add :image2, :string
      add :image3, :string
      add :image4, :string
    end
  end
end
