require 'rest-client'
require 'json'
Anime.destroy_all
Tracked.destroy_all
User.destroy_all
Review.destroy_all

res = RestClient.get("https://kitsu.io/api/edge/anime?page[limit]=20&page[offset]=0")
res_body = res.body
animes = JSON.parse(res_body)

# users = RestClient.get("https://kitsu.io/api/edge/users")
# all_users = users.body
# users = JSON.parse(all_users)

comment_attributes = RestClient.get("https://kitsu.io/api/edge/comments")
all_comment_attributes = comment_attributes.body
reviews = JSON.parse(all_comment_attributes)


file = File.read("storage/users.txt")
users = JSON.parse(file)

users["data"].each do |user|
    User.create(
    name: user["attributes"]["name"],
    bio: user["attributes"]["about"],
    birthday: user["attributes"]["birthday"],
    post_count: user["attributes"]["postsCount"],
    life_spent_on_anime: user["attributes"]["lifeSpentOnAnime"],
    password: "password"
  )
end


animes["data"].each do |anime|
  Anime.create(
    title: anime["attributes"]["titles"]["en_jp"], 
    start_date: anime["attributes"]["createdAt"], 
    end_date: anime["attributes"]["updatedAt"],
    average_rating: anime["attributes"]["averageRating"], 
    poster_image: anime["attributes"]["posterImage"]["medium"], 
    synopsis: anime["attributes"]["synopsis"]
  )

  reviews["data"].each do |comment|
    Review.create(
      user_id: User.all.sample.id,
      anime_id: Anime.all.sample.id,
      rating: rand(0..10),
      comment: comment["attributes"]["content"],
      comment_likes: comment["attributes"]["likesCount"]
    )
  end

    20.times do 
    Tracked.create(
    user_id: User.all.sample.id,
    anime_id: Anime.all.sample.id,
    rating: rand(0..10)
    )
end

end 

puts "seeded"