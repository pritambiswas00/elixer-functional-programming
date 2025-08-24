defmodule HttpServer.HelloWorldPlug do
  import Plug.Conn
  def init(options), do: options
  def call(connection, _opts) do
    connection
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello World")
  end
end
