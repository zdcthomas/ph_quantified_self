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

  def update(%Food{} = food, attrs) do
    food
    |> Food.changeset(attrs)
    |> Repo.update()
  end

  def delete(%Food{} = food) do
    Repo.delete(food)
  end

  def create(attrs \\ %{}) do
    %Food{} 
    |>Food.changeset(attrs)
    |>Repo.insert()
  end

end
