defmodule PhQuantifiedSelfWeb.Api.V1.FoodView do
  use PhQuantifiedSelfWeb, :view
  alias PhQuantifiedSelfWeb.Api.V1.FoodView

  def render("index.json", foods) do
    foods
  end

  def render("show.json", %{food: food}) do
    %{data: render_one(food, FoodView, "food.json")}
  end

  def render("food.json", %{food: food}) do
    %{id: food.id,
      name: food.name,
      calories: food.calories}
  end
end