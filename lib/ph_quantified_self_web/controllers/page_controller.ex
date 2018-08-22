defmodule PhQuantifiedSelfWeb.PageController do
  use PhQuantifiedSelfWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
