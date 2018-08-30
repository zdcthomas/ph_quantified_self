
Setup

```
mix deps.get
mix ecto.migrate
mix run priv/repo/seeds.exs
(in preffered environemnt using MIX_ENV=<your env>
mix test
mix phx.server
```
 
# Elixir version:
 ```
 1.4
 ```
# Phoenix Version

```
1.3.2
```

* Current deployed address: https://fast-meadow-36413.herokuapp.com/

* Waffle Board https://waffle.io/zdcthomas/quantified_self

# Food Endpoints:

* GET /api/v1/foods


Returns all foods currently in the database

Each individual food will be returned in the following format:

```
{
    "id": 1,
    "name": "Banana",
    "calories": 150
}
```


* GET /api/v1/foods/:id


Returns the food object with the specific :id you’ve passed in or 404 if the food is not found


* POST /api/v1/foods


Allows creating a new food with the parameters:

```
{ "food": { "name": "Name of food here", "calories": "Calories here"} }
```

If food is successfully created, the food item will be returned. If the food is not successfully created, a 400 status code will be returned. Both name and calories are required fields.

* PATCH /api/v1/foods/:id

Allows one to update an existing food with the parameters:

```
{ "food": { "name": "Mint", "calories": "14"} }
```

If food is successfully updated (name and calories are required fields), the food item will be returned. If the food is not successfully updated, a 400 status code will be returned.


* DELETE /api/v1/foods/:id


Will delete the food with the id passed in and return a 204 status code. If the food can’t be found, a 404 will be returned.

# Meal Endpoints:

```
GET /api/v1/meals
```

Returns all the meals in the database along with their associated foods

If successful, this request will return a response in the following format:
```
[
    {
        "id": 1,
        "name": "Breakfast",
        "foods": [
            {
                "id": 1,
                "name": "Banana",
                "calories": 150
            },
            {
                "id": 6,
                "name": "Yogurt",
                "calories": 550
            },
            {
                "id": 12,
                "name": "Apple",
                "calories": 220
            }
        ]
    },
    {
        "id": 2,
        "name": "Snack",
        "foods": [
            {
                "id": 1,
                "name": "Banana",
                "calories": 150
            },
            {
                "id": 9,
                "name": "Gum",
                "calories": 50
            },
            {
                "id": 10,
                "name": "Cheese",
                "calories": 400
            }
        ]
    },
    {
        "id": 3,
        "name": "Lunch",
        "foods": [
            {
                "id": 2,
                "name": "Bagel Bites - Four Cheese",
                "calories": 650
            },
            {
                "id": 3,
                "name": "Chicken Burrito",
                "calories": 800
            },
            {
                "id": 12,
                "name": "Apple",
                "calories": 220
            }
        ]
    },
    {
        "id": 4,
        "name": "Dinner",
        "foods": [
            {
                "id": 1,
                "name": "Banana",
                "calories": 150
            },
            {
                "id": 2,
                "name": "Bagel Bites - Four Cheese",
                "calories": 650
            },
            {
                "id": 3,
                "name": "Chicken Burrito",
                "calories": 800
            }
        ]
    }
]
```

* GET /api/v1/meals/:meal_id/foods

Returns all the foods associated with the meal with an id specified by :meal_id or a 404 if the meal is not found

If successful, this request will return a response in the following format:

```
{
    "id": 1,
    "name": "Breakfast",
    "foods": [
        {
            "id": 1,
            "name": "Banana",
            "calories": 150
        },
        {
            "id": 6,
            "name": "Yogurt",
            "calories": 550
        },
        {
            "id": 12,
            "name": "Apple",
            "calories": 220
        }
    ]
}
```

* POST /api/v1/meals/:meal_id/foods/:id

Adds the food with :id to the meal with :meal_id

This creates a new record in the MealFoods table to establish the relationship between this food and meal. If the meal/food cannot be found, a 404 will be returned.

If successful, this request will return a status code of 201 with the following body:

```
{
    "message": "Successfully added FOODNAME to MEALNAME"
}
```

* DELETE /api/v1/meals/:meal_id/foods/:id
Removes the food with :id from the meal with :meal_id

This deletes the existing record in the MealFoods table that creates the relationship between this food and meal. If the meal/food cannot be found, a 404 will be returned.

If successful, this request will return:

```
{
    "message": "Successfully removed FOODNAME to MEALNAME"
}
```
