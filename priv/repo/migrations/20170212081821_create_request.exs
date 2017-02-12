defmodule Tire.Repo.Migrations.CreateRequest do
  use Ecto.Migration

  def change do
    create table(:requests) do
      add :comments, :string
      add :user_id, references(:users)

      timestamps()
    end

  end
end
