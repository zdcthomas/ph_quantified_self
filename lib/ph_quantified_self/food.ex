defmodule PhQuantifiedSelf.Food do
  use Ecto.Schema
  import Ecto.Changeset

  import Ecto.Query, warn: false
  alias PhQuantifiedSelf.{Repo, Food}


  schema "foods" do
    field :calories, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(food, attrs) do
    food
    |> cast(attrs, [:name, :calories])
    |> validate_required([:name, :calories])
  end

  def all do
    Repo.all Food
  end

  def find(id) do
    Repo.get!(Food,id)
  end

  def create(attrs) do
    attrs
    |>Food.changeset(attrs)
    |>Food.insert(attrs)
  end
end
