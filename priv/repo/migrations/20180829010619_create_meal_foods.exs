defmodule PhQuantifiedSelf.Repo.Migrations.CreateMealFoods do
  use Ecto.Migration

  def change do
    create table(:meal_foods) do
      add :meal_id, references(:meals, on_delete: :nothing)
      add :food_id, references(:foods, on_delete: :nothing)

      timestamps()
    end

    create index(:meal_foods, [:meal_id])
    create index(:meal_foods, [:food_id])
  end
end
