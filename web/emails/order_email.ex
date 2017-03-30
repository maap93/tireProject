defmodule Tire.OrderEmail do
  use Phoenix.Swoosh, view: Tire.OrderView, layout: {Tire.LayoutView, :email}

  @section "<p>Testing</p>"

  def traverse(email_params) do

    Enum.map(email_params, fn %{"code" => code,
    "count" => count,
    "price" => price,
    "total" => total } ->
    "<p>Product Code: #{code}, Quantity: #{count}, Individual Price: #{price} , Total: #{total}</p><br>"
    end)
  end

  def welcome(user_email, user_name, email_params) do

    email =
      new()
      |> from("admin@ctdtires.com")
      |> to({"vazquez","vahqueh@gmail.com"})
      |> subject("A new order has arrived!")
      |> text_body("Hello")
      |> html_body(
          Enum.join([
            "<div> Client Name: #{user_name} <br>",
            "Client Email: #{user_email}" ,
            traverse(email_params),
            "</div>"],"")
        )
  end
end



#defmodule Tire.OrderEmail do
#  use Phoenix.Swoosh, view: Tire.OrderView, layout: {Tire.LayoutView, :email}
#

#  def welcome(user_email, user_name) do
#    new
#    |> from("admin@ctdtires.com")
#    |> to({"vazquez","vahqueh@gmail.com"})
#    |> subject("A new order have arrived!")
#    |> html_body(  "
#      <div>
#        Client Name: #{user_name} <br>
#        Client Email: #{user_email} <br>
#
#      </div>
#      ")
#    |> text_body()
#  end

#end  |> html_body(
    #Enum.join([
#      "<div> Client Name: #{user_name} <br>",
#      "Client Email: #{user_email}" ,
#      "</div>"],"")
  #)
  #|> t
