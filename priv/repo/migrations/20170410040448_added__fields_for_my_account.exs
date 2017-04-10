defmodule Tire.Repo.Migrations.AddedFieldsForMyAccount do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :address, :string
      add :country, :string
      add :phone, :string
      add :username, :string
    end
  end
end
