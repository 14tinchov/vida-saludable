json.extract! recipe, :id, :name, :description, :preparation, :total_calories, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
