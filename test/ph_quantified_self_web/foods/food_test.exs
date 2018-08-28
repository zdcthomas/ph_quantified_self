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
      Food.create
    end
  end
  


end
