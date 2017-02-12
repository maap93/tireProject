# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Tire.Repo.insert!(%Tire.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Tire.Repo.delete_all Tire.User
Tire.Repo.delete_all Tire.Request
Tire.Repo.delete_all Tire.Order
Tire.Repo.delete_all Tire.Product


Tire.User.changeset(%Tire.User{}, %{name: "Test User", email: "testuser@example.com", password: "secret", password_confirmation: "secret"})
|> Tire.Repo.insert!
