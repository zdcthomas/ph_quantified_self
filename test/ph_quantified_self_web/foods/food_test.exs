defmodule PhQuantifiedSelfWeb.FoodTest do
  use PhQuantifiedSelf.DataCase
  alias PhQuantifiedSelf.Food

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


end
