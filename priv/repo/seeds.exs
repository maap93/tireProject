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


Tire.Repo.delete_all Tire.User

Tire.User.changeset(%Tire.User{}, %{name: "Administrator", email: "admin@example.org", password: "password", password_confirmation: "password", admin: true})
|> Tire.Repo.insert!

Tire.User.changeset(%Tire.User{}, %{name: "Guest", email: "guest@example.org", password: "password", password_confirmation: "password", admin: false})
|> Tire.Repo.insert!

Tire.User.changeset(%Tire.User{}, %{name: "Luis Vazquez", email: "vahqueh@gmail.com", password: "vahqueh12", password_confirmation: "vahqueh12", admin: true})
|> Tire.Repo.insert!
