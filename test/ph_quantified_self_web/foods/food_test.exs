defmodule PhQuantifiedSelfWeb.FoodTest do
  use PhQuantifiedSelf.DataCase
  alias PhQuantifiedSelf.Food
  alias PhQuantifiedSelf.Repo

  @valid_attributes %{name: "Bannana", calories: 150}
  @invalid_attributes %{name: 1234, calories: "string"}

  describe "changeset attributes" do
    test "Valid changeset attributes" do
      changeset = Food.changeset(%Food{}, @valid_attributes)
      assert changeset.valid?
    end

    test "Invalid changeset attributes" do

      changeset = Food.changeset(%Food{}, @invalid_attributes)
      refute changeset.valid?
    end
  end

  describe "food model queries" do
    test "all" do
      Repo.insert(%Food{name: "Bannana",calories: 150})
      Repo.insert(%Food{name: "Grape",calories: 200})

      foods = Food.all
      assert length(foods) == 2
      assert List.first(foods).name == "Bannana" 
      assert List.first(foods).calories == 150 
    end

    test "find" do
      Repo.insert(%Food{id: 1, name: "Bannana",calories: 150})
      Repo.insert(%Food{name: "Grape",calories: 200})

      food = Food.find(1)
      assert food.id == 1
      assert food.name == "Bannana"
      assert food.calories == 150
    end

    test "create" do
      assert length(Food.all) == 0
      name = "Bannana"
      calories = 150
      Food.create(%{name: name, calories: calories})
      [food | _] = Food.all
      assert food.name === name
      assert food.calories == calories
    end

    test "update" do
      Repo.insert(%Food{id: 1, name: "Bannana",calories: 150})
      food = Food.find(1)
      Food.update(food, %{name: "Mango"})
      food = Food.find(1)
      assert food.name == "Mango"
      assert food.id == 1
    end

    test "delete" do
      Repo.insert(%Food{id: 1, name: "Bannana",calories: 150})
      food = Food.find(1)      
      assert length(Food.all) == 1
      Food.delete(food)
      assert length(Food.all) == 0
    end
  end
end
