drop table netflix;
create table netflix
(
show_id varchar(6),
type varchar(10),
title varchar(150),
director varchar(250),
casts varchar(800),
country	varchar(150),
date_added varchar(50),
release_year int,	
rating varchar(10),
duration varchar(15),
listed_in varchar(100),
description varchar(300)
);


-- 15 business problems 

-- count the number of movies vs tv shows

select type, count(*) total from netflix group by type;

-- find the most common rating for movies and TV SHOW

select type , rating from 
(select type , rating, count(*),rank()over(partition by  type order by count(*)desc ) as rnk from netflix group by 1,2 ) as t1
where rnk=1;


-- list all the movies released in a specific year (e.g., 2020)
select title from netflix where release_year = 2020 and type='Movie';

-- find top 5 countries with the most content on netflix
select unnest(string_to_array(country,',')) as new_country, count(*) as number_of_content
from netflix  group by new_country order by count(*) desc  limit 5 ;

-- Identify the longest movie
select title,duration
from netflix
where type='Movie' and
cast(split_part (duration,' ',1) as integer)=(select max(cast(split_part(duration,' ',1) as integer))
from netflix where type='Movie') ;

-- Fint content added in last 5 years

SELECT * FROM NETFLIX WHERE 
    CASE 
        WHEN TRIM(date_added) LIKE '%,%' 
            THEN TO_DATE(TRIM(date_added), 'Month DD, YYYY')
        ELSE 
            TO_DATE(TRIM(date_added), 'DD-Mon-YY')
    END>= CURRENT_DATE - INTERVAL '5 years' 


-- Find all the movies/TV shows by director 'Rajiv Chilaka'\

select * , unnest(string_to_array(director,',')) as directors_1 from netflix where director = 'Rajiv Chilaka';

select * from netflix
where director Ilike '%Rajiv Chilaka%'  --Ilike is used to make it case insensitive


-- List all the TV shows with more than 5 seasons

select * from netflix
where type='TV Show'
and cast(split_part(duration,' ',1) as integer) > 5 ;


-- count the number of content items in each genre 

select * from netflix;
 
select trim(unnest(string_to_array(listed_in , ','))) as genre , count(*) as no_of_content from netflix group by genre order by no_of_content desc;


-- Find each year and avg numbers of content release by India on netflix. return top 5 year with highest avg content release!


select case 
when(date_added) like '%,%'
then extract(year from to_date(trim(date_added),'Month DD, YYYY')) 
ELSE 
EXTRACT(YEAR FROM to_date(TRIM(date_added), 'DD-Mon-YY'))
end as year, count(*),round(count(*)::numeric/(select count(*) from netflix where country ILike '%India'):: numeric* 100,2) as avg_content
from netflix 
where country ILike '%India%' group by 1 order by avg_content desc limit 5;


-- List all the movies that are documentaries

select * from netflix
where listed_in Ilike '%documentaries%' 
and type='Movie';


-- Find all content without a director

select * from netflix where director is null;

-- Find how many movies actor 'Salman Khan ' appeared in last 10 years!

select * from netflix Where
casts Ilike '%Salman Khan%'
and 
release_year>=extract(year from current_date)-10

-- Find the top 10 actors who have appeared in the highest number of movies produced in India.

select unnest(string_to_array(casts,',')) 
as actors, count(*)from netflix
where country ilike '%india' 
group by actors 
order by count(*) desc limit 10;

-- Categorize the content based on the presence of the keywords 'kill' and 'violence' in the description field. Label content containing these keywords as 'Bad' and all other content as 'Good'

select case when description Ilike '%kill%' or description Ilike '%violence%' then 'Bad' 
else 'Good' end as category , count(*) from netflix group by category;