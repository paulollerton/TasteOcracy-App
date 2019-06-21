json.array! @recipes.each do |recipe|
  json.partial! "recipe.json.jbuilder", recipe: recipe
end