defmodule PhQuantifiedSelfWeb.Api.V1.Serializer do
  alias PhQuantifiedSelfWeb.Api.V1.Serializer

  def meal(meal) do
    %{
      id: meal.id,
      name: meal.name,
      foods: Serializer.foods(meal.foods)
    }
  end

  def meals(meals) do
    Enum.map(meals, &Serializer.meal/1)
  end

  def foods(foods) do
    Enum.map(foods, &Serializer.food/1)
  end

  def food(food) do
    %{
      id: food.id,
      name: food.name,
      calories: food.calories
    }
  end
end
