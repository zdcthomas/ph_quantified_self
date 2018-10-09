defmodule PhQuantifiedSelfWeb.Api.V1.FoodController do
  use PhQuantifiedSelfWeb, :controller
  alias PhQuantifiedSelf.Food
  alias PhQuantifiedSelfWeb.Api.V1.Serializer

  def index(conn, _params) do
    foods = Food.all
    json conn, Serializer.foods(foods)
  end

  def show(conn, params) do
    params["id"]
    {id, ""} = Integer.parse(params["id"])
    food = Food.find(id)
    if (food) do
      put_status(conn, 200)
      json(conn, Serializer.food(food))
    else
      conn
      |> put_status(404)
      |> json(%{error: "Food not found"})
    end
  end

  def update(conn, params) do
    {id, ""} = Integer.parse(params["id"])
    %{"food"=> food_params} = params
    food = Food.find(id)
    if (food) do
      case Food.update(food, food_params) do
        {:ok, food} ->
          conn
          |> put_status(201)
          |> json(Serializer.food(food))
        {:error, error} ->
          conn
          |>put_status(400)
          |>json(%{error: "Unable to create food"})
      end
    else
      conn
      |>put_status(400)
      |>json(%{error: "Food not found"})
    end
  end

  def create(conn, params) do
    %{"food"=> food} = params
    case Food.create(food) do
      {:ok, food} ->
        conn
        |> put_status(200)
        |> json(Serializer.food(food))
      {:error, error} ->
        conn
        |> put_status(400)
        |> json(%{error: "#{inspect error.errors}"})
    end
  end

  def delete(conn, params) do
    {id, ""} = Integer.parse(params["id"])
    food = Food.find(id)
    if (food) do
      Food.delete(food)
      conn
      |> put_status(204)
      |> json(%{message: "Food destroyed"})
    else
      conn
      |> put_status(404)
      |> json(%{error: "Food not found"})
    end
  end
end