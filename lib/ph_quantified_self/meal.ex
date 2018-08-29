defmodule PhQuantifiedSelf.Meal do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false
  @derive {Poison.Encoder, except: [:__meta__]}



  schema "meals" do
    field :name, :string

    many_to_many :foods, PhQuantifiedSelf.Food, join_through: "meal_foods"
    timestamps()
  end

  def changeset(meal, attrs) do
    meal
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
