# json.array! @users,  :id, :email, :address, :full_name
json.array! @users do |user|
  json.(user,  :id, :email, :address, :full_name)
  json.posts user.posts do |post|
    json.id post.id
    json.title post.title
  end
end
