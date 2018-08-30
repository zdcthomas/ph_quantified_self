defmodule PhQuantifiedSelf.Food do
  @derive {Poison.Encoder, except: [:__meta__]}
  use Ecto.Schema
  import Ecto.Changeset

  import Ecto.Query, warn: false
  alias PhQuantifiedSelf.{Repo, Food, Meal}


  schema "foods" do
    field :calories, :integer
    field :name, :string

    many_to_many :meals, Meal, join_through: "meal_foods"

    timestamps()
  end

  @doc false
  def changeset(food, attrs) do
    food
    |> cast(attrs, [:name, :calories])
    |> validate_required([:name, :calories])
  end

  def all do
    Food
    |>select([:id, :name, :calories])
    |>Repo.all()
    |>Repo.preload(:meals)
  end

  def find(id) do
    Food
    |>select([:id, :name, :calories])
    |>Repo.get(id)
    |>Repo.preload(:meals)
  end

  def update(%Food{} = food, attrs) do
    food
    |>Repo.preload(:meals)
    |> Food.changeset(attrs)
    |> Repo.update()
  end

  def delete(%Food{} = food) do
    Repo.delete(food)
  end

  def create(attrs \\ %{}) do
    %Food{} 
    |>Repo.preload(:meals)
    |>Food.changeset(attrs)
    |>Repo.insert()
  end 
end
