json.array! @comments.each do |comment|
  json.partial! "comment.json.jbuilder", comment: comment
end