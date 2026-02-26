# Netflix Movies and TV Shows Data Analysis using SQL
![Netflix_Logo](https://github.com/reachsg13/netflix_sql_project/blob/main/images.png)
## Project Overview
This project involves a comprehensive analysis of Netflix's movies and TV shows data using SQL. The goal is to extract valuable insights and answer 15 specific business problems based on the dataset. Through this analysis, I explored content distribution, ratings, release trends, and categorized content based on specific keywords and criteria.

Dataset
The data for this project is sourced from the Kaggle dataset:

Dataset Link: Netflix Movies and TV Shows

Business Problems Solved
Content Count: Count the total number of Movies vs TV Shows.

Common Ratings: Find the most common rating for movies and TV shows.

Yearly Releases: List all movies released in a specific year (e.g., 2020).

Top Countries: Find the top 5 countries with the most content on Netflix.

Longest Movie: Identify the longest movie duration.

Recent Content: Find content added in the last 5 years.

Director Analysis: Find all the movies/TV shows directed by 'Director Name'.

TV Show Seasons: List all TV shows with more than 5 seasons.

Genre Count: Count the number of content items in each genre.

Yearly Average: Find each year and the average numbers of content release in India.

Documentary Listing: List all movies that are documentaries.

Missing Director: Find all content without a director.

Actor Search: Find how many movies actor 'Salman Khan' appeared in the last 10 years.

Top Actors: Find the top 10 actors who have appeared in the highest number of movies produced in India.

Content Categorization: Categorize the content based on the presence of the keywords 'kill' and 'violence' in the description column. Label content containing these keywords as 'Bad' and all other content as 'Good'.

Key Findings
Content Volume: The dataset reveals a significantly higher number of movies compared to TV shows.

Target Audience: The most common ratings indicate that a large portion of Netflix's library is tailored for mature audiences.

Global Presence: The United States and India are among the top contributors to the content library.

Project Structure
Netflix_Analysis_Queries.sql: Contains all SQL queries used for the analysis.

Netflix_Dataset.csv: The raw data used for the project.

README.md: Project documentation.

Technical Skills Demonstrated
SQL Fundamentals: SELECT, FROM, WHERE, GROUP BY, ORDER BY.

Joins & Aggregations: Complex data retrieval and summary statistics.

Data Cleaning: Handling null values and formatting strings.

Case Statements: Used for advanced content categorization.

How to Use
Clone this repository.

Import the netflix_titles.csv into your SQL database (PostgreSQL, MySQL, etc.).

Run the queries provided in the .sql file to see the results.
