defmodule HttpServer.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    
  end
end
