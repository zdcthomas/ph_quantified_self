defmodule PhQuantifiedSelfWeb.MealRequestTest do
  use PhQuantifiedSelfWeb.ConnCase
  alias PhQuantifiedSelf.{Meal, Food}
  alias PhQuantifiedSelf.Repo
  alias PhQuantifiedSelf.Meal.Food, as: Meal_Food

  describe "get queries" do
    test "get /api/v1/meals", %{conn: conn} do
      Repo.insert(%Meal{name: "Breakfast", id: 1})
      Repo.insert(%Meal{name: "Snack", id: 2})
      Repo.insert(%Meal{name: "Lunch", id: 3})
      Repo.insert(%Food{id: 1, name: "Bannana", calories: 150})
      Repo.insert(%Food{name: "Grape", calories: 200, id: 2})
      Repo.insert(%Meal_Food{meal_id: 1, food_id: 1})
      Repo.insert(%Meal_Food{meal_id: 3, food_id: 2})
      Repo.insert(%Meal_Food{meal_id: 2, food_id: 2})

      conn = get conn, "/api/v1/meals"
      response = json_response(conn, 200)
      assert length(response) == length(Meal.all)
      [meal|_] = response
      assert meal["name"] == "Breakfast"
      assert length(meal["foods"]) == 1
    end

    test "get /api/v1/meals/:id/foods", %{conn: conn} do
      Repo.insert(%Meal{name: "Breakfast", id: 1})
      Repo.insert(%Meal{name: "Snack", id: 2})
      Repo.insert(%Meal{name: "Lunch", id: 3})
      Repo.insert(%Food{id: 1, name: "Bannana", calories: 150})
      Repo.insert(%Food{name: "Grape", calories: 200, id: 2})
      Repo.insert(%Meal_Food{meal_id: 1, food_id: 1})
      Repo.insert(%Meal_Food{meal_id: 1, food_id: 2})
      Repo.insert(%Meal_Food{meal_id: 2, food_id: 2})

      conn = get conn, "/api/v1/meals/1/foods"
      response = json_response(conn, 200)
      assert response["name"] == "Breakfast"
      assert length(response["foods"]) == 2
    end
  end
end
