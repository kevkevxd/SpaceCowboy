require 'rest-client'
require 'json'
Anime.destroy_all
Tracked.destroy_all
User.destroy_all
Review.destroy_all

res = RestClient.get("https://kitsu.io/api/edge/anime?page[limit]=20&page[offset]=0")
res1 = RestClient.get("https://kitsu.io/api/edge/anime?page[limit]=20&page[offset]=21")
res2 = RestClient.get("https://kitsu.io/api/edge/anime?page[limit]=20&page[offset]=41")
res3 = RestClient.get("https://kitsu.io/api/edge/anime?page[limit]=20&page[offset]=61")
res4 = RestClient.get("https://kitsu.io/api/edge/anime?page[limit]=20&page[offset]=81")
res5 = RestClient.get("https://kitsu.io/api/edge/anime?page[limit]=20&page[offset]=101")

res_body = res.body
res_body1 = res1.body
res_body2 = res2.body
res_body3= res3.body
res_body4 = res4.body
animes = JSON.parse(res_body)
animes1 = JSON.parse(res_body1)
animes2 = JSON.parse(res_body2)
animes3 = JSON.parse(res_body3)
animes4 = JSON.parse(res_body4)
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

# all_animes = (animes, animes1, animes2, animes3, animes4)
# all_animes.each do |anime|
#   animes["data"].each do |anime|
#this code can be way dryer i know
  
animes["data"].each do |anime|
  Anime.create(
    title: anime["attributes"]["titles"]["en_jp"], 
    start_date: anime["attributes"]["createdAt"], 
    end_date: anime["attributes"]["updatedAt"],
    average_rating: anime["attributes"]["averageRating"], 
    poster_image: anime["attributes"]["posterImage"]["medium"], 
    synopsis: anime["attributes"]["synopsis"]
  )
  end

  
animes1["data"].each do |anime|
  Anime.create(
    title: anime["attributes"]["titles"]["en_jp"], 
    start_date: anime["attributes"]["createdAt"], 
    end_date: anime["attributes"]["updatedAt"],
    average_rating: anime["attributes"]["averageRating"], 
    poster_image: anime["attributes"]["posterImage"]["medium"], 
    synopsis: anime["attributes"]["synopsis"]
  )
  end

  
animes2["data"].each do |anime|
  Anime.create(
    title: anime["attributes"]["titles"]["en_jp"], 
    start_date: anime["attributes"]["createdAt"], 
    end_date: anime["attributes"]["updatedAt"],
    average_rating: anime["attributes"]["averageRating"], 
    poster_image: anime["attributes"]["posterImage"]["medium"], 
    synopsis: anime["attributes"]["synopsis"]
  )
  end
animes3["data"].each do |anime|
  Anime.create(
    title: anime["attributes"]["titles"]["en_jp"], 
    start_date: anime["attributes"]["createdAt"], 
    end_date: anime["attributes"]["updatedAt"],
    average_rating: anime["attributes"]["averageRating"], 
    poster_image: anime["attributes"]["posterImage"]["medium"], 
    synopsis: anime["attributes"]["synopsis"]
  )
  end 
animes4["data"].each do |anime|
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
