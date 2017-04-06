defmodule Tire.OrderController do
  use Tire.Web, :controller

  alias Tire.Order
  alias Tire.Mailer
  alias Tire.OrderEmail

  def sendEmail(conn, %{"_json" => email_params}) do
    user_email = conn.assigns.current_user.email
    user_name = conn.assigns.current_user.name
    #IO.inspect "EMAIL PARAMS"
    IO.inspect "EMAIL PARAMS"
    IO.inspect email_params

    OrderEmail.welcome(user_email, user_name, email_params)
    |> Mailer.deliver
    |> case do
      {:ok, _result} ->
        IO.inspect "SIIIIIII"
        conn
        |> put_flash(:info, "Email sent successfully")
        |> redirect(to: page_path(conn, :index))
      {:error, _reason} ->
        IO.inspect "AQUI EMPIEZA"
        IO.inspect _reason
        IO.inspect "AQUI TERMINA"

        conn
        |> put_flash(:error, "There was an error while sending the email")
        |> redirect(to: page_path(conn, :index))
      end
  end

end
