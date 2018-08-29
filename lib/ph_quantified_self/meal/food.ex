defmodule PhQuantifiedSelf.Meal.Food do
  use Ecto.Schema
  import Ecto.Changeset


  schema "meal_foods" do
    field :meal_id, :id
    field :food_id, :id

    timestamps()
  end

  @doc false
  def changeset(food, attrs) do
    require IEx; IEx.pry
    food
    |> cast(attrs, [])
    |> validate_required([])
  end
end
