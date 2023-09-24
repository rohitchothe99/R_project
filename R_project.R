install.packages('RMySQL')
library(RMySQL)

# Create a database connection
con <- dbConnect(MySQL(), user = 'root', password = '',
                 dbname = 'rohit', host = 'localhost')
print('Connection to database is successful')

result1=dbGetQuery(con,'select * from movies')
print(result1)

# Create (INSERT) a new movie
query <- "INSERT INTO movies (movie_id,title, industry, release_year, imdb_rating, studio) 
          VALUES (107,'The Matrix', 'Hollywood', 1999, 8.7, 'Warner Bros.')"
dbSendQuery(con, query)

# Read (SELECT) all movies
query <- "SELECT * FROM movies"
movies <- dbGetQuery(con, query)
print(movies)

# Update (UPDATE) a movie's rating
query <- "UPDATE movies SET imdb_rating = 8.9 WHERE title = 'The Matrix'"
dbSendQuery(con, query)

# Read (SELECT) the updated movie
query <- "SELECT * FROM movies WHERE title = 'The Matrix'"
updated_movie <- dbGetQuery(con, query)
print(updated_movie)

# Delete (DELETE) a movie
query <- "DELETE FROM movies WHERE title = 'The Matrix'"
dbSendQuery(con, query)

query <- "SELECT * FROM movies"
movies <- dbGetQuery(con, query)
print(movies)
# Close the database connection
dbDisconnect(con)
print("Connection close successfully")