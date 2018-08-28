defmodule PhQuantifiedSelfWeb.Api.V1.FoodController do
  use PhQuantifiedSelfWeb, :controller
  alias PhQuantifiedSelf.Food

  def index(conn, _params) do
    foods = Food.all
    json conn, foods
  end
  
end