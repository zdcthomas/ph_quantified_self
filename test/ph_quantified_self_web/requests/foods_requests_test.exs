defmodule PhQuantifiedSelfWeb.FoodRequestTest do
  use PhQuantifiedSelfWeb.ConnCase
  alias PhQuantifiedSelf.Food
  alias PhQuantifiedSelf.Repo

  describe "get queries" do
    test "get api/v1/foods", %{conn: conn} do
      Repo.insert(%Food{name: "Bannana",calories: 150})
      Repo.insert(%Food{name: "Grape",calories: 200})

      conn = get conn, "/api/v1/foods"
      response = json_response(conn, 200)
      bannana = List.first(response)
    
      assert length(response) == 2
      assert bannana["name"] == "Bannana"
      assert bannana["calories"] == 150
    end

    test "get api/v1/foods/:id returns 200 for found id", %{conn: conn} do
      Repo.insert(%Food{name: "Bannana",calories: 150, id: 1})
      Repo.insert(%Food{name: "Grape",calories: 200})

      conn = get conn, "/api/v1/foods/1"
      response = json_response(conn, 200)

      assert response["name"]== "Bannana"
      assert response["calories"] == 150
    end

    test "get api/v1/foods/:id returns 404 for not found id", %{conn: conn} do
      Repo.insert(%Food{name: "Bannana",calories: 150, id: 1})
      Repo.insert(%Food{name: "Grape",calories: 200, id: 2})

      conn = get conn, "/api/v1/foods/3"
      response = json_response(conn, 404)

      assert response
    end
  end

  describe "create/update queries" do
    test "post api/v1/foods success", %{conn: conn} do
      name = "Grape"
      calories = 20
      food_params = %{food: %{name: name, calories: calories}}
      conn = post conn, "/api/v1/foods", food_params
      response = json_response(conn, 200)
      food =  response
      assert food["name"] == name
      assert food["calories"] == calories
      [food|_] = Food.all
      assert food.name == name
      assert food.calories == calories
    end
    test "post api/v1/foods failure", %{conn: conn} do
      name = "Grape"
      _calories = 20
      food_params = %{food: %{name: name}}
      conn = post conn, "/api/v1/foods", food_params
      response = json_response(conn, 400)
      assert response
    end
  end
  describe "delete queries" do
    test "DELETE /api/v1/foods/:id", %{conn: conn} do
      Repo.insert(%Food{name: "Bannana",calories: 150, id: 1})
      conn = delete conn, "/api/v1/foods/1"
      response = json_response(conn, 204)
      assert response
      refute List.first(Food.all)
    end
    test "DELETE /api/v1/foods/:id unsuccesful ", %{conn: conn} do
      Repo.insert(%Food{name: "Bannana",calories: 150, id: 1})
      conn = delete conn, "/api/v1/foods/2" 
      response = json_response(conn, 404)
      assert response
    end
  end
end