defmodule Tire.UserController do
  use Tire.Web, :controller

  alias Tire.User
  alias Tire.Repo

  def show(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    render(conn, "show.html", user: user)
  end

end
