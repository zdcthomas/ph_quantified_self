defmodule PhQuantifiedSelfWeb.Api.V1.MealController do
  use PhQuantifiedSelfWeb, :controller
  alias PhQuantifiedSelf.{Meal, Food}
  alias PhQuantifiedSelfWeb.Api.V1.Serializer

  def index(conn, _params) do
    meals = Meal.all
    require IEx; IEx.pry
    json conn, Serializer.meals(meals)
  end

  def show(conn, params) do
    params["id"]
    {id, ""} = Integer.parse(params["id"])
    meal = Meal.find(id)
    if (meal) do
      put_status(conn, 200)
      json(conn, Serializer.meal(meal))
    else
      conn
      |>put_status(404)
      |>json(%{error: "Meal not found"})
    end
  end
    
end