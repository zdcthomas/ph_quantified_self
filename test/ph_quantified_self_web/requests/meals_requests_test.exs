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
  describe "create/update queries" do
    test "post api/v1/meals/:id/foods/:id success", %{conn: conn} do
      Repo.insert(%Meal{name: "Breakfast", id: 1})
      Repo.insert(%Meal{name: "Snack", id: 2})
      Repo.insert(%Meal{name: "Lunch", id: 3})
      Repo.insert(%Food{id: 1, name: "Bannana", calories: 150})
      Repo.insert(%Food{name: "Grape", calories: 200, id: 2})
      Repo.insert(%Meal_Food{meal_id: 1, food_id: 1})
      Repo.insert(%Meal_Food{meal_id: 2, food_id: 2})

      conn = post conn, "/api/v1/meals/1/foods/2"
      response = json_response(conn, 201)
      creation_message =  response["message"]
      assert creation_message == "Successfully added Grape to Breakfast"
    end

    test "post api/v1/foods failure", %{conn: conn} do
      Repo.insert(%Meal{name: "Breakfast", id: 1})
      Repo.insert(%Meal{name: "Snack", id: 2})
      Repo.insert(%Meal{name: "Lunch", id: 3})
      
      conn = post conn, "/api/v1/meals/1/foods/2"
      response = json_response(conn, 404)
      assert response
    end
  end
  describe "destroy queries" do
    test "DELETE /api/v1/meals/:id/foods/:id", %{conn: conn} do
      Repo.insert(%Meal{name: "Breakfast", id: 1})
      Repo.insert(%Food{id: 1, name: "Bannana", calories: 150})
      Repo.insert(%Meal_Food{meal_id: 1, food_id: 1})

      conn = delete conn, "/api/v1/meals/1/foods/1"
      response = json_response(conn, 200)
      message = response["message"]
      assert message == "Successfully removed Bannana to Breakfast"
    end
    test "DELETE /api/v1/meals/:id/foods/:id non success", %{conn: conn} do
      Repo.insert(%Meal{name: "Breakfast", id: 1})

      conn = delete conn, "/api/v1/meals/1/foods/1"
      response = json_response(conn, 404)
      error = response["error"]
      assert error == "Not Found"
    end
  end
end
