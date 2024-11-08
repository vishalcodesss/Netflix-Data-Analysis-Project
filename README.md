Netflix Data Analysis and Visualization Project
Overview
This project focuses on analyzing and visualizing Netflix's extensive content library by leveraging a combination of Python, SQL Server, and Power BI. The project is divided into two phases: the first phase involves data cleaning, exploration, and visualization using Python, while the second phase focuses on advanced data management in SQL Server and interactive dashboard creation in Power BI.
Dataset
The dataset used for this project was sourced from Kaggle and contains detailed information about Netflix's movie and TV show titles. The dataset includes attributes such as title, director, cast, country, date added to Netflix, release year, rating, duration, genre (listed_in), and description.
Source: Netflix Titles Dataset on Kaggle
File: netflix_titles.csv
Tools & Technologies Used
Python: For data cleaning, manipulation, and visualization.
Libraries: Pandas, NumPy, Plotly, TextBlob
SQL Server (SSMS): For advanced data cleaning, creating relational tables, and solving business problems.
Power BI: For creating interactive dashboards that provide business insights.
Phase 1: Data Cleaning & Visualization with Python
1. Data Import & Cleaning
The dataset was first imported into a Jupyter Notebook using Python. The primary libraries used were Pandas and NumPy for data manipulation. The data cleaning process involved handling missing values, correcting data types, and removing duplicates. Some key steps included:
Filling missing values in columns like director and country.
Standardizing the format of the duration column.
Removing duplicates based on unique identifiers (show_id).
2. Exploratory Data Analysis (EDA)
After cleaning the dataset, I conducted an exploratory analysis to better understand the distribution of content across various categories such as genre, rating, and country. This helped in identifying patterns in the Netflix content library.
3. Interactive Visualizations Using Plotly
To visualize the cleaned data interactively, I used Plotly, a powerful Python library for creating dynamic visualizations. Some of the key visualizations created include:
Pie Charts: To visualize the distribution of content types (Movies vs TV Shows).
Bar Charts: To display the count of titles by rating or genre.
Line Charts: To show trends in content release over time.
4. Sentiment Analysis Using TextBlob
I also performed sentiment analysis on the content descriptions using the TextBlob library. This provided insights into whether the descriptions of Netflix titles had positive or negative sentiment.
Phase 2: Data Management & Business Insights with SQL Server and Power BI
1. Importing Data into SQL Server
The original uncleaned dataset was imported into SQL Server (SSMS) for further analysis. In this phase, I performed additional data cleaning using SQL queries to handle missing values and normalize data fields. The cleaned data was then structured into multiple relational tables such as:
Genre Table
Directors Table
Country Table
This relational structure allowed for more efficient querying and analysis.
2. Solving Business Problems with SQL Queries
Several business questions were addressed using SQL queries:
Identifying top directors based on the number of titles they have worked on.
Analyzing content availability by country.
Finding trends in content release over time.
These insights helped in understanding how Netflix's content is distributed across different regions and genres.
3. Creating Interactive Dashboards with Power BI
After cleaning and structuring the data in SQL Server, I imported it into Power BI to create interactive dashboards that provide actionable insights for end-users. The dashboards include:
A dashboard showing content distribution by genre and country.
A time-series analysis dashboard displaying trends in Netflix releases over time.
A dashboard highlighting top-rated movies and TV shows based on user ratings.
Some key visualizations include:
Bar Charts for top genres by country.
Slicers to filter data by year or rating.
Maps to visualize content availability across different regions.
Conclusion
This project demonstrates how Python can be effectively used for initial data cleaning and visualization tasks while leveraging SQL Server for advanced data management and Power BI for creating interactive dashboards that provide valuable business insights. By combining these tools, I was able to extract meaningful insights from Netflix's vast collection of titles.
Future Improvements
In future iterations of this project:
I plan to implement machine learning models to predict user ratings based on title metadata.
I will explore advanced sentiment analysis techniques using NLP libraries like SpaCy or NLTK for deeper insights into user reviews.
Repository Contents
Jupyter Notebooks:
Data Cleaning & Visualization with Python.
Sentiment Analysis with TextBlob.
SQL Scripts:
Data Cleaning & Querying in SQL Server.
Power BI Dashboard File (.pbix):
Interactive dashboards created in Power BI.
