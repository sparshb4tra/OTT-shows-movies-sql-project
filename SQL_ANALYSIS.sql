Q1. Which countries produce the most high-rated (IMDb score >= 8) shows and movies?


SELECT production_countries, 
       COUNT(*) AS high_rated_count
FROM titles
WHERE imdb_score >= 8
GROUP BY production_countries
ORDER BY high_rated_count DESC;




Q2. What is the average runtime of movies and shows, and how does it correlate with IMDb scores?


SELECT type, 
       AVG(runtime) AS avg_runtime,
       AVG(imdb_score) AS avg_imdb_score
FROM titles
GROUP BY type
ORDER BY avg_runtime DESC;




Q3. What are the trends in the release of shows and movies over the past decade?


SELECT release_year, 
       type,
       COUNT(*) AS release_count
FROM titles
WHERE release_year >= EXTRACT(YEAR FROM SYSDATE) - 10
GROUP BY release_year, type
ORDER BY release_year;




Q4. Which genres are the most common? 


  
SELECT genres, 
COUNT(*) AS title_count
FROM shows_movies.titles 
WHERE type = 'Movie'
GROUP BY genres
ORDER BY title_count DESC
LIMIT 10;




- Top 10 most common genres for SHOWS

SELECT genres, 
COUNT(*) AS title_count
FROM shows_movies.titles 
WHERE type = 'Show'
GROUP BY genres
ORDER BY title_count DESC
LIMIT 10;




- Top 3 most common genres OVERALL

SELECT t.genres, 
COUNT(*) AS genre_count
FROM shows_movies.titles AS t
WHERE t.type = 'Movie' or t.type = 'Show'
GROUP BY t.genres
ORDER BY genre_count DESC
LIMIT 3;




