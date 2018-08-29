# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PhQuantifiedSelf.Repo.insert!(%PhQuantifiedSelf.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias PhQuantifiedSelf.{Repo, Food, Meal}

Repo.insert(%Meal{name: "Breakfast", id: 1})
Repo.insert(%Meal{name: "Snack", id: 2})
Repo.insert(%Meal{name: "Lunch", id: 3})
Repo.insert(%Meal{name: "Dinner", id: 4})
