
-- Netflix data analysis
 -------------------------			

-- 1. For each director, count the no of movies and tv shows created by them in separate columns and the directors should
--		have created both tv shows and movies.

select * from netflixdf
where director LIKE 'A%'

----------
select distinct nd.director,
		count(case when n.type = 'Movie' then 1 end) as movie_count,
		count(case when n.type = 'TV Show' then 1 end) as tvshow_count
from netflix_directors nd
inner join netflix n
on nd.show_id = n.show_id
group by nd.director
having COUNT(distinct n.type) >1
----------
select * from directors_count
 
 select * from netflixdf
 where director = 'Priyadarshan'

 -- 2. Which country has the highest number of comedy movies

 ----------
 select top 1 nc.country, 
		COUNT(distinct nc.show_id) as comedy_count
 from netflix_countries nc
 inner join netflix_genres ng
 on nc.show_id = ng.show_id
 inner join netflix n
 on n.show_id = ng.show_id
 where n.type = 'Movie' and ng.genre = 'Comedies'
 group by country
 order by comedy_count desc
 ----------
 
 select * from netflix;
 

 -- 3. For each year (as per date added to netflix), which director has the maximum number of movies

 ----------

 WITH CTE AS (
    SELECT 
        nd.director,
		YEAR(date_added) AS date_released,
        count(n.show_id) as movie_count
    FROM netflix_directors nd
    INNER JOIN netflix n ON nd.show_id = n.show_id
	where type = 'Movie'
	GROUP BY nd.director, YEAR(date_added)
)
, CTE2 as (
SELECT *,
		ROW_NUMBER() over (partition by date_released order by movie_count desc, director) as rn
FROM CTE
)
select * from CTE2
where rn = 1

----------

-- 4.what is the average duration of movies in each genre

select AVG(duration)
from netflix
where type = 'Movie'

----------

select ng.genre, AVG(cast(REPLACE(duration, ' min', '') as int)) as Avg_Duration
from netflix n
inner join netflix_genres ng
on n.show_id = ng.show_id
where type = 'Movie'
group by ng.genre

-- OR

SELECT ng.genre, avg(CAST(SUBSTRING(duration, 1, PATINDEX('%[^0-9]%', duration) - 1) AS INT)) AS avg_duration
FROM netflix n
inner join netflix_genres ng
on n.show_id = ng.show_id
where type = 'Movie'
group by ng.genre


----------

-- 5. Find the list of directors who have created horror and comedy both.
-- display director names along with number of comedy and horror movies directed by them

----------

select nd.director,
		COUNT(case when ng.genre = 'Comedies' then 1 end) as comedy_count,
		COUNT(case when ng.genre = 'Horror Movies' then 1 end) as horror_count
from netflix_directors nd
inner join netflix_genres ng
on nd.show_id = ng.show_id
inner join netflix n
on n.show_id = ng.show_id
where type = 'Movie' and ng.genre IN ('Horror Movies', 'Comedies')
group by nd.director
having count(distinct ng.genre) = 2

----------
select count(*)
from netflix_genres
where genre = 'comedies'

select distinct genre from netflix_genres order by genre






