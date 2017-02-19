defmodule Tire.RequestController do
  use Tire.Web, :controller

  alias Tire.Request


  def index(conn, _params) do
    requests = Repo.all(Request) |> Repo.preload([user: [:requests]])
    render(conn, "index.html", requests: requests)
  end

  def new(conn, _params) do
    changeset = Request.changeset(%Request{})

    # get product id
    product_id = Repo.all(Tire.Product) |> Enum.map(&{&1.product_code, &1.id})
    user_id = Repo.all(Tire.User) |> Enum.map(&{&1.name, &1.id})

    # get current user id
    name = to_string conn.assigns.current_user.id
    # user_id = Repo.get!(User, id)
    IO.inspect "aqui empieza"
    IO.inspect name
    IO.inspect "aqui terminar"

    render(conn, "new.html", changeset: changeset,
                             product_id: product_id,
                             user_id: user_id,
                             name: name)
  end

  def create(conn, %{"request" => request_params}) do
    testing_params = %{"request_id" => 2, "product_id" => 1}
    IO.inspect " AQUI EMPIEZA"
    IO.inspect testing_params
    IO.inspect "AQUI TERMNIA"


    changeset = Request.changeset(%Request{}, request_params)
    changeset2 = Tire.Order.changeset(%Tire.Order{}, testing_params)
    #|> Tire.Order.changeset(%Tire.Order{}, testing_params)

    Repo.insert(changeset2)

    case Repo.insert(changeset) do
      {:ok, _request} ->
        conn
        |> put_flash(:info, "Request created successfully.")
        |> redirect(to: request_path(conn, :index))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    request = Repo.get!(Request, id)
    render(conn, "show.html", request: request)
  end

  def edit(conn, %{"id" => id}) do
    request = Repo.get!(Request, id)
    changeset = Request.changeset(request)
    render(conn, "edit.html", request: request, changeset: changeset)
  end

  def update(conn, %{"id" => id, "request" => request_params}) do
    request = Repo.get!(Request, id)
    changeset = Request.changeset(request, request_params)

    case Repo.update(changeset) do
      {:ok, request} ->
        conn
        |> put_flash(:info, "Request updated successfully.")
        |> redirect(to: request_path(conn, :show, request))
      {:error, changeset} ->
        render(conn, "edit.html", request: request, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    request = Repo.get!(Request, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(request)

    conn
    |> put_flash(:info, "Request deleted successfully.")
    |> redirect(to: request_path(conn, :index))
  end
end
