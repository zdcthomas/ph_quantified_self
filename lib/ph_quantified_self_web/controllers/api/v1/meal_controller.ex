defmodule PhQuantifiedSelfWeb.Api.V1.MealController do
  use PhQuantifiedSelfWeb, :controller
  alias PhQuantifiedSelf.{Meal, Food}
  alias PhQuantifiedSelfWeb.Api.V1.Serializer

  def index(conn, _params) do
    meals = Meal.all
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
      |> put_status(404)
      |> json(%{error: "Meal not found"})
    end
  end

  def update(conn, params) do\
    [{food_id, ""}, {meal_id, ""}] = [Integer.parse(params["food_id"]), Integer.parse(params["meal_id"])]
    [food, meal] = [Food.find(food_id), Meal.find(meal_id)]
    if (food && meal) do
      Meal.add_food(meal, food)
      conn
      |> put_status(201)
      |> json(%{message: "Successfully added #{food.name} to #{meal.name}"})
    else
      conn
      |> put_status(404)
      |> json(%{error: "Meal or Food not found"})
    end
  end

  def delete(conn, params) do
    [{food_id, ""}, {meal_id, ""}] = [Integer.parse(params["food_id"]), Integer.parse(params["meal_id"])]
    [food, meal] = [Food.find(food_id), Meal.find(meal_id)]
    if (food && meal && Meal.assoc?(meal, food)) do
      Meal.remove_food(meal, food)
      conn
      |> put_status(200)
      |> json(%{message: "Successfully removed #{food.name} to #{meal.name}"})
    else
      conn
      |> put_status(404)
      |> json(%{error: "Not Found"})
    end
  end
end