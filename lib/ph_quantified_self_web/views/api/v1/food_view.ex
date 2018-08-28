defmodule PhQuantifiedSelfWeb.FoodView do
  use PhQuantifiedSelfWeb, :view
  def render("index.json", %{food: foods}) do
    require IEx; IEx.pry
    foods
  end
end