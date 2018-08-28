defmodule PhQuantifiedSelfWeb.Api.V1.FoodController do
  use PhQuantifiedSelfWeb, :controller
  alias PhQuantifiedSelf.Food

  def index(conn, _params) do
    foods = Food.all
    json conn, foods
  end

  def show(conn, params) do
    params["id"]
    {id, ""} = Integer.parse(params["id"])
    food = Food.find(id)
    if (food) do
      put_status(conn, 200)
      json(conn, food)
    else
      conn
      |>put_status(404)
      |>json(%{error: "Food not found"})
    end
  end
end