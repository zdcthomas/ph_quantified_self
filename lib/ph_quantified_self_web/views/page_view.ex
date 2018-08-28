defmodule PhQuantifiedSelfWeb.PageView do
  use PhQuantifiedSelfWeb, :view

  def render("show.json", food) do
    %{
      name: food.name
      calories: food.calories
    }
  end
end
