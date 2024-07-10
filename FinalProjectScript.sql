CREATE TABLE [Sports] (
  [SportID] Int PRIMARY KEY,
  [Sport] nvarchar(50),
  [Game] nvarchar(50)
);

CREATE TABLE [MovieActor] (
  [ActorID] Int PRIMARY KEY,
  [FirstName] nvarchar(50),
  [LastName] nvarchar(50)
);

CREATE TABLE [Genre] (
  [GenreID] Int PRIMARY KEY,
  [GenreName] nvarchar(50)
);

CREATE TABLE [Movie] (
  [MovieID] Int PRIMARY KEY,
  [MovieName] nvarchar(50),
  [ActorID] Int,
  [GenreID] Int,
  [Duration] Int,
  FOREIGN KEY ([ActorID]) REFERENCES [MovieActor]([ActorID]),
  FOREIGN KEY ([GenreID]) REFERENCES [Genre]([GenreID])
);

CREATE TABLE [TVActor] (
  [ActorID] Int PRIMARY KEY,
  [FirstName] nvarchar(50),
  [LastName] nvarchar(50)
);

CREATE TABLE [TV] (
  [TVID] Int PRIMARY KEY,
  [TVName] nvarchar(50),
  [GenreID] Int,
  [ActorID] Int,
  [Seasons] Int,
  [Episodes] Int,
  [EpisodeName] nvarchar(50),
  FOREIGN KEY ([GenreID]) REFERENCES [Genre]([GenreID]),
  FOREIGN KEY ([ActorID]) REFERENCES [TVActor]([ActorID])
);

CREATE TABLE [News] (
  [NewsID] Int PRIMARY KEY,
  [NewsStation] nvarchar(50),
  [Title] nvarchar(50),
  [Topics] nvarchar(50)
);

CREATE TABLE [Media] (
  [MediaID] Int PRIMARY KEY,
  [MovieID] Int,
  [TVID] Int,
  [SportID] Int,
  [NewsID] Int,
  FOREIGN KEY ([SportID]) REFERENCES [Sports]([SportID]),
  FOREIGN KEY ([MovieID]) REFERENCES [Movie]([MovieID]),
  FOREIGN KEY ([TVID]) REFERENCES [TV]([TVID]),
  FOREIGN KEY ([NewsID]) REFERENCES [News]([NewsID])
);

CREATE TABLE [MediaType] (
  [MediaID] Int PRIMARY KEY,
  [Type] nvarchar(50),
  FOREIGN KEY ([MediaID]) REFERENCES [Media]([MediaID])
);

-- Sample data for Sports table
INSERT INTO Sports (SportID, Sport, Game)
VALUES 
  (1, 'Football', 'Chiefs vs Eagles'),
  (2, 'Basketball', 'Pacers vs Knicks'),
  (3, 'Tennis', 'Williams vs Gauff'),
  (4, 'Basketball', 'Timberwolves vs Nuggets'),
  (5, 'Football', 'Lions vs 49ers');

-- Sample data for MovieActor table
INSERT INTO MovieActor (ActorID, FirstName, LastName)
VALUES 
  (1, 'Tom', 'Hanks'),
  (2, 'Leonardo', 'DiCaprio'),
  (3, 'Brad', 'Pitt'),
  (4, 'Ryan', 'Reynolds'),
  (5, 'Adam', 'Sandler');

-- Sample data for Genre table
INSERT INTO Genre (GenreID, GenreName)
VALUES 
  (1, 'Action'),
  (2, 'Drama'),
  (3, 'Comedy'),
  (4, 'Horror'),
  (5, 'Family');

-- Sample data for Movie table
INSERT INTO Movie (MovieID, MovieName, ActorID, GenreID, Duration)
VALUES 
  (1, 'Inception', 2, 1, 148),
  (2, 'Forrest Gump', 1, 2, 142),
  (3, 'Fight Club', 3, 1, 139),
  (4, 'Deadpool', 4, 3, 108),
  (5, 'Titanic', 2, 2, 195);

-- Sample data for TVActor table
INSERT INTO TVActor (ActorID, FirstName, LastName)
VALUES 
  (6, 'Jennifer', 'Aniston'),
  (7, 'Kit', 'Harington'),
  (8, 'Emilia', 'Clarke'),
  (9, 'Jerry', 'Seinfeld'),
  (10, 'Bryan', 'Cranston');

-- Sample data for TV table
INSERT INTO TV (TVID, TVName, GenreID, ActorID, Seasons, Episodes, EpisodeName)
VALUES 
  (1, 'Friends', 3, 6, 10, 236, 'The One Where It All Began'),
  (2, 'Game of Thrones', 1, 8, 8, 73, 'Winter Is Coming'),
  (3, 'Breaking Bad', 2, 6, 10, 62, 'Pilot'),
  (4, 'Seinfeld', 3, 9, 9, 180, 'The Seinfeld Chronicles'),
  (5, 'Malcolm in the Middle', 5, 10, 7, 151, 'Pilot');

-- Sample data for News table
INSERT INTO News (NewsID, NewsStation, Title, Topics)
VALUES 
  (1, 'CNN', 'Breaking News', 'Politics'),
  (2, 'BBC', 'World News', 'International Affairs'),
  (3, 'Fox News', 'Local News', 'Current Events'),
  (4, 'Al Jazeera', 'Middle East Update', 'International Affairs'),
  (5, 'NBC', 'Tech News', 'Science and Technology');

-- Sample data for Media table
INSERT INTO Media (MediaID, MovieID, TVID, SportID, NewsID)
VALUES 
  (1, 1, NULL, NULL, NULL),
  (2, NULL, 2, NULL, NULL),
  (3, NULL, NULL, 1, NULL),
  (4, NULL, NULL, NULL, 1),
  (5, NULL, NULL, 2, NULL);


-- Sample data for MediaType table
INSERT INTO MediaType (MediaID, Type)
VALUES 
  (1, 'Movie'),
  (2, 'TV'),
  (3, 'Sport'),
  (4, 'News');

-- Select all rows from the Sports table
SELECT * FROM Sports;

-- Select all rows from the MovieActor table
SELECT * FROM MovieActor;

-- Select all rows from the Genre table
SELECT * FROM Genre;

-- Select all rows from the Movie table
SELECT * FROM Movie;

-- Select all rows from the TVActor table
SELECT * FROM TVActor;

-- Select all rows from the TV table
SELECT * FROM TV;

-- Select all rows from the News table
SELECT * FROM News;

-- Select all rows from the Media table
SELECT * FROM Media;

-- Select all rows from the MediaType table
SELECT * FROM MediaType;

