defmodule Tire.RequestController do
  use Tire.Web, :controller

  alias Tire.Request
  alias Tire.Repo

  # Index working just fine
  def index(conn, _params) do
    requests = Repo.all(Request) |> Repo.preload([user: [:requests]])
    render(conn, "index.html", requests: requests )
  end

  # New request working fine
  def new(conn, _params) do
    changeset = Request.changeset(%Request{})
    render(conn, "new.html", changeset: changeset)
  end

  #Create still trying to figure it out the functionality and the relations
  def create(conn, %{"request" => request_params}) do
    changeset = conn.assigns[:user]
    |> build_assoc(:requests)
    |> Request.changeset(request_params)

    case Repo.insert(changeset) do
      {:ok, request} ->
        changeset = User.changeset(conn.assigns[:user], %{current_request: request.id})
        user = Repo.update! changeset

        conn
        |> put_flash(:info, "Order created successfully.")
        |> redirect(to: request_path(conn, :index))

      {:error, changeset} ->
        render(conn, "error.html", changeset: changeset)
    end
  end


end
