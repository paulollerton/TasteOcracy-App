json.array! @suggestions.each do |suggestion|
  json.partial! "suggestion.json.jbuilder", suggestion: suggestion
end