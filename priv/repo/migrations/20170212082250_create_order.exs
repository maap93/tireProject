defmodule Tire.Repo.Migrations.CreateOrder do
  use Ecto.Migration

  def change do
    create table(:orders) do

      timestamps()
    end

  end
end
