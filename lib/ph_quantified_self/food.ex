defmodule PhQuantifiedSelf.Food do
  use Ecto.Schema
  import Ecto.Changeset

  import Ecto.Query, warn: false
  alias PhQuantifiedSelf.Repo


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
end
