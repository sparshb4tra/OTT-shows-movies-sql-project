# <p align="center">OTT-shows-movies-sql-project</p>
# <p align="center">![Pic](https://github.com/sparshb4tra/OTT-shows-movies-sql-project/blob/42b382e387c91d357bc90ac128d52a5d7bd0c1cb/group-friends-watching-tv-sport-match-together-emotional-fans-cheering-favourite-team-watching-exciting-football-concept-friendship-leisure-activity-emotions.jpg)</p>


## **Tools Used:** Excel, Tableau, Oracle Apex

- [SQL Analysis (Code)](url)

- [Datasets Used](https://www.kaggle.com/datasets/victorsoeiro/netflix-tv-shows-and-movies?select=titles.csv)

- [Netflix Dashboard - Tableau](https://public.tableau.com/app/profile/sparsh.batra/viz/NETFLIXDASHBOARD_17219918222970/NETFLIX)



## **Problem Faced:** 
Netflix has a mountain of data about its shows and movies, but they're feeling lost in the information jungle. With over 82,000 pieces of data to sort through, they're struggling to figure out what their subscribers really like and what kind of content they should create next. They need a smart system to help them dig through all this data and find the hidden treasures - the patterns and trends that will help them make better decisions.

## **My solution:** 
In helping Netflix gather valuable insights from their extensive movies and shows dataset, I will be utilizing SQL and a data visualization tool like Tableau to extract relevant information, and conduct insightful analyses. By leveraging SQL's functions, I can uncover key metrics such as viewer ratings, popularity trends, genre preferences, and viewership patterns. Once the data has been extracted and prepared, I will leverage Tableau to present the findings. This will allow for interactive exploration of the data, enabling stakeholders at Netflix to gain actionable insights through visually appealing charts, graphs, and interactive visualizations. I plan on creating a dynamic dashboard in Tableau that enables users to delve into specific movie genres, viewer demographics, or geographical regions.




## TOP QUESTIONS FROM THE DATASET

## Q1. Which countries produce the most high-rated (IMDb score >= 8) shows and movies?

- LIST SCORE WISE
```mysql
SELECT production_countries, 
       COUNT(*) AS high_rated_count
FROM titles
WHERE imdb_score >= 8
GROUP BY production_countries
ORDER BY high_rated_count DESC;

```

Output:

![Q1](https://github.com/sparshb4tra/OTT-shows-movies-sql-project/blob/bd5f2d41c62c6c53d468c1ff36442baa71cd0245/ott%20table%20ss/1.png)

This query identifies the countries that produce the most high-rated shows and movies. Netflix can use this information to strengthen partnerships and acquire more content from these countries. It also helps in understanding regional preferences and quality standards, potentially expanding their content library with high-quality productions.




## Q2. What is the average runtime of movies and shows, and how does it correlate with IMDb scores?

- AVG RUNTIME
```mysql
SELECT type, 
       AVG(runtime) AS avg_runtime,
       AVG(imdb_score) AS avg_imdb_score
FROM titles
GROUP BY type
ORDER BY avg_runtime DESC;

```

Output:

![Q2](https://github.com/sparshb4tra/OTT-shows-movies-sql-project/blob/bd5f2d41c62c6c53d468c1ff36442baa71cd0245/ott%20table%20ss/2.png)


This query calculates the average runtime and IMDb scores for movies and shows. By analyzing this data, Netflix can determine if longer runtimes correlate with higher or lower IMDb scores, providing insights into viewer preferences. This information can inform decisions on content length for future productions to enhance viewer satisfaction.



## Q3. What are the trends in the release of shows and movies over the past decade?

- TRENDS
```mysql
SELECT release_year, 
       type,
       COUNT(*) AS release_count
FROM titles
WHERE release_year >= EXTRACT(YEAR FROM SYSDATE) - 10
GROUP BY release_year, type
ORDER BY release_year;


```

Output:

![Q3](https://github.com/sparshb4tra/OTT-shows-movies-sql-project/blob/bd5f2d41c62c6c53d468c1ff36442baa71cd0245/ott%20table%20ss/3.png)


This query calculates the average runtime and IMDb scores for movies and shows. By analyzing this data, Netflix can determine if longer runtimes correlate with higher or lower IMDb scores, providing insights into viewer preferences. This information can inform decisions on content length for future productions to enhance viewer satisfaction.


## Q4. Which genres are the most common? 
- Top 10 most common genres for MOVIES
```mysql
SELECT genres, 
COUNT(*) AS title_count
FROM shows_movies.titles 
WHERE type = 'Movie'
GROUP BY genres
ORDER BY title_count DESC
LIMIT 10;
```
Result:

![Q8](https://i.ibb.co/VWrgd8m/Screen-Shot-2023-07-10-at-12-25-40-PM.png)

- Top 10 most common genres for SHOWS
```mysql
SELECT genres, 
COUNT(*) AS title_count
FROM shows_movies.titles 
WHERE type = 'Show'
GROUP BY genres
ORDER BY title_count DESC
LIMIT 10;
```
Result: 

![Q9](https://i.ibb.co/P59s4X7/Screen-Shot-2023-07-10-at-12-27-41-PM.png)

- Top 3 most common genres OVERALL
```mysql
SELECT t.genres, 
COUNT(*) AS genre_count
FROM shows_movies.titles AS t
WHERE t.type = 'Movie' or t.type = 'Show'
GROUP BY t.genres
ORDER BY genre_count DESC
LIMIT 3;
```
Result: 

![Q10](https://i.ibb.co/qMvMBGf/Screen-Shot-2023-07-10-at-12-30-04-PM.png)








## Conclusion: 
By exploring various aspects of the dataset, a comprehensive understanding of Netflix's content landscape was gained. The analysis revealed the top 10 and bottom 10 movies and shows based on their IMDB scores, which highlighted the titles that garnered high praise and those that received lower ratings. This information can assist viewers in making informed choices and highlight areas for potential improvement in content quality. The examination of movies and shows distributed across different decades showed significant shifts in content availability over time. Notably, the dataset showcased a substantial increase in offerings from the 2000s onwards, emphasizing Netflix's commitment to featuring newer content that resonates with current trends and audience preferences.

Age certifications played a crucial role in the dataset, impacting both the average IMDB scores and the distribution of movies and shows. The analysis revealed audience preferences for specific age certifications, with TV-14 garnering the highest average score, suggesting its high popularity among viewers. Furthermore, the different age certifications also showed the diverse range of content available on Netflix. Finally, the exploration of the most common genres in Netflix's library provided insights into viewer preferences and content distribution. Comedy emerged as the dominant genre across both movies and shows, followed by documentation and drama. Combinations of genres were also frequent, highlighting the audience's appreciation for multi-genre content.
