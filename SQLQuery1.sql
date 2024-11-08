
create table [dbo].[netflixdf](
[show_id] varchar(10) primary key,
[type] varchar(10) NULL,
[title] [nvarchar](200) NULL,
[director] varchar(250) NULL,
[cast] varchar(1000) NULL,
[country] varchar(150) NULL,
[date_added] varchar(20) NULL,
[release_year] int NULL,
[rating] varchar(10) NULL,
[duration] varchar(10) NULL,
[listed_in] varchar(255) NULL,
[description] varchar(500) NULL
)
select * from netflixdf
where show_id = 's5023'
DELETE FROM netflixdf
WHERE title LIKE '?%';

drop table netflixdf

select * from netflixdf
order by title

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'netflixdf';

ALTER TABLE netflixdf
ALTER COLUMN title NVARCHAR(200);





