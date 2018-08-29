defmodule PhQuantifiedSelfWeb.MealTest do
  use PhQuantifiedSelf.DataCase
  alias PhQuantifiedSelf.{Repo, Meal, Food}
  alias PhQuantifiedSelf.Meal.Food, as: Meal_Food


  
  describe "meal model queries" do
    test "all" do
      Repo.insert(%Meal{name: "Breakfast", id: 1})
      Repo.insert(%Meal{name: "Snack", id: 2})
      Repo.insert(%Meal{name: "Lunch", id: 3})
      Repo.insert(%Food{id: 1, name: "Bannana", calories: 150})
      Repo.insert(%Food{name: "Grape", calories: 200, id: 2})
      Repo.insert(%Meal_Food{meal_id: 1, food_id: 1})
      Repo.insert(%Meal_Food{meal_id: 3, food_id: 2})
      Repo.insert(%Meal_Food{meal_id: 2, food_id: 2})

      meals = Meal.all
      
      assert length(meals) == 3
      [breakfast|_] = meals
      assert breakfast.id == 1
      assert length(breakfast.foods) == 1
    end

    test "find" do
      Repo.insert(%Food{id: 1, name: "Bannana", calories: 150})
      Repo.insert(%Food{name: "Grape", calories: 200, id: 2})
      Repo.insert(%Meal{name: "Breakfast", id: 1})
      Repo.insert(%Meal_Food{meal_id: 1, food_id: 1})
      Repo.insert(%Meal_Food{meal_id: 1, food_id: 2})
      
      meal = Meal.find(1)
      assert length(meal.foods) == 2
      assert meal.name == "Breakfast"
    end

    test "add_food(meal, food)" do
      Repo.insert(%Meal{name: "Breakfast", id: 1})
      Repo.insert(%Food{id: 1, name: "Bannana", calories: 150})

      meal = Meal.find(1)
      food = Food.find(1)
      assert length(meal.foods) == 0

      Meal.add_food(meal, food)
      meal = Meal.find(1)
      food = Food.find(1)

      assert length(meal.foods) == 1
    end

    test "remove_food(meal, food)" do
      Repo.insert(%Meal{name: "Breakfast", id: 1})
      Repo.insert(%Food{id: 1, name: "Bannana", calories: 150})
      Repo.insert(%Meal_Food{meal_id: 1, food_id: 1})


      meal = Meal.find(1)
      food = Food.find(1)
      assert length(meal.foods) == 1

      Meal.remove_food(meal, food)
      meal = Meal.find(1)
      food = Food.find(1)

      assert length(meal.foods) == 0
    end
  end
end
