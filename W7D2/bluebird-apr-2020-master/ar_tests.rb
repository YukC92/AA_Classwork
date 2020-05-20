names = ['Harry Potter', 'Hermione Granger']
User.where(username: names)

User.where(username: 'Hermione Granger') #starting with User gets us a user 

Chirp.joins(:author).where(username: 'Hermione Granger') #didn't work, no column Chirp.username

Chirp.joins(:author).where(users: { username: 'Hermione Granger'} ) 
#pull username from the users table = users.username in the where statement 

#return chirps liked by people politically affilitated with Gryffindor
Chirp.joins(:likers).where(users: { political_affiliation: "Gryffindor"} )

#find all chirps written by someone age 11 and liked by someone age 11
Chirp
  .joins(:likers, :author)
  .where(users: { age: 11 })
  .where(authors_chirps: { age: 11 }) 
  #ActiveRecord alias: pluralized association name_pluralized model name 
  #Aliases the second join

#find all chirps Hermione likes 
Chirp.joins(:likers).where(users: { username: 'Hermione Granger' })

#find chirps without likes 
Chirp.left_outer_joins(:likes).where(likes: { id: nil })

Chirp
  .select(:body)
  .joins(:author)
  .where(users: {username: 'Hermione Granger' })


#this will not work 
Chirp
  .pluck(:body)
  .joins(:author)
  .where(users: {username: 'Hermione Granger' })

#this will work: pluck goes at the end 
Chirp
  .joins(:author)
  .where(users: {username: 'Hermione Granger' })
  .pluck(:body)

#find likes per chirp 
Chirp.select(:id, :body, "COUNT(*) AS num_likes").joins(:likes).group(:id)

#chirps with at least 3 likes 
Chirp.joins(:likes).group(:id).having("COUNT(*) >= 3").select(:body,"COUNT(*) AS num_likes" )

#find user who likes nimubus' chirps the most 
#return info in an array 
Chirp
  .joins(:likers, :author) #both users
  .where("authors_chirps.username = 'Nimbus'") #activerecord alias .where(authors_chirps: { username: 'Nimbus'})
  .group("users.username") 
  .order("COUNT(*) desc")
  .limit(1)
  .pluck("users.username, COUNT(*) AS num_likes")
  
