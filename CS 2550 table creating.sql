DROP TABLE ARTIST;
DROP TABLE ALBUM;
DROP TABLE Genre;
DROP TABLE MediaType;
DROP TABLE Track;




/* Create Tables */
CREATE TABLE ARTIST
(
    ArtistID Number(3) NOT NULL,
    Name varchar2(120) NOT NULL
);

CREATE TABLE ALBUM
(
    AlbumID Number(3) NOT NULL,
    Title varchar2(160) NOT NULL,
    ArtistID Number(3) NOT NULL
);

CREATE TABLE Genre
(
    GenreID Number(3) NOT NULL,
    Name varchar2(120) NOT NULL
);

CREATE TABLE MediaType
(
    MediaTypeID Number(3) NOT NULL,
    Name varchar2(120)
);

CREATE TABLE Track
(
    TrackID Number(4) NOT NULL,
    Name varchar2(200) NOT NULL,
    AlbumID Number(3) NOT NULL,
    MediaTypeID Number(3) NOT NULL,
    GenreID Number(3) NOT NULL,
    Composer varchar2(220),
    Milliseconds Number(10) NOT NULL,
    Bytes Number(10) NOT NULL,
    UnitPrice Number(10, 2) NOT NULL
);

/* Add Primary Keys */

ALTER TABLE ARTIST
ADD CONSTRAINT PK_ARTIST_ArtistID
PRIMARY KEY (ArtistID);

ALTER TABLE ALBUM
ADD CONSTRAINT PK_ALBUM_AlbumID
PRIMARY KEY (AlbumID);

ALTER TABLE Genre
ADD CONSTRAINT PK_Genre_GenreID
PRIMARY KEY (GenreID);

ALTER TABLE MediaType
ADD CONSTRAINT PK_MediaType_MediaTypeID
PRIMARY KEY (MediaTypeID);

ALTER TABLE Track
ADD CONSTRAINT PK_Track_TrackID
PRIMARY KEY (TrackID);

/* Add Foreign Keys */

ALTER TABLE ALBUM
ADD CONSTRAINT FK_ALBUM_ArtistID
FOREIGN KEY (ArtistID) REFERENCES ARTIST(ArtistID);

ALTER TABLE TRACK
ADD CONSTRAINT FK_ALBUM_AlbumID
FOREIGN KEY (AlbumID) REFERENCES ALBUM(AlbumID);

ALTER TABLE TRACK
ADD CONSTRAINT FK_Genre_GenreID
FOREIGN KEY (GenreID) REFERENCES Genre(GenreID);

/* Add Data */

/* Insert Genre Data */

INSERT INTO Genre
(GenreID, name)
VALUES
(1, 'Rock');

INSERT INTO Genre
(GenreID, name)
VALUES
(2, 'Jazz');

INSERT INTO Genre
(GenreID, name)
VALUES
(3, 'Metal');

INSERT INTO Genre
(GenreID, name)
VALUES
(4, 'Alternative Punk');

INSERT INTO Genre
(GenreID, name)
VALUES
(5, 'Rock And Roll');

INSERT INTO Genre
(GenreID, name)
VALUES
(6, 'Blues');

INSERT INTO Genre
(GenreID, name)
VALUES
(7, 'Latin');

INSERT INTO Genre
(GenreID, name)
VALUES
(8, 'Reggae');

INSERT INTO Genre
(GenreID, name)
VALUES
(9, 'Pop');

INSERT INTO Genre
(GenreID, name)
VALUES
(10, 'Soundtrack');

INSERT INTO Genre
(GenreID, name)
VALUES
(11, 'Bossa Nova');

INSERT INTO Genre
(GenreID, name)
VALUES
(12, 'Easy Listening');

INSERT INTO Genre
(GenreID, name)
VALUES
(13, 'Heavy Metal');

INSERT INTO Genre
(GenreID, name)
VALUES
(14, 'R '||chr(38)||' B Soul');

INSERT INTO Genre
(GenreID, name)
VALUES
(15, 'Electronica Dance');

INSERT INTO Genre
(GenreID, name)
VALUES
(16, 'World');

INSERT INTO Genre
(GenreID, name)
VALUES
(17, 'Hip Hop Rap');

INSERT INTO Genre
(GenreID, name)
VALUES
(18, 'Science Fiction');

INSERT INTO Genre
(GenreID, name)
VALUES
(19, 'TV Shows');

INSERT INTO Genre
(GenreID, name)
VALUES
(20, 'Sci Fi and Fantasy');

INSERT INTO Genre
(GenreID, name)
VALUES
(21, 'Drama');

INSERT INTO Genre
(GenreID, name)
VALUES
(22, 'Comedy');

INSERT INTO Genre
(GenreID, name)
VALUES
(23, 'Alternative');

INSERT INTO Genre
(GenreID, name)
VALUES
(24, 'Classical');

INSERT INTO Genre
(GenreID, name)
VALUES
(25, 'Opera');

/* Insert MediaType Data */

INSERT INTO MediaType
(MediaTypeID, Name)
VALUES
(1, 'MPEG audio file');

INSERT INTO MediaType
(MediaTypeID, Name)
VALUES
(2, 'Protected AAC audio file');

INSERT INTO MediaType
(MediaTypeID, Name)
VALUES
(3, 'Protected MPEG4 video file');

INSERT INTO MediaType
(MediaTypeID, Name)
VALUES
(4, 'Purchased AAC audio file');

INSERT INTO MediaType
(MediaTypeID, Name)
VALUES
(5, 'AAC audio file');

/* Insert Artist Data */

INSERT INTO ARTIST
(ArtistID, Name)
VALUES
(1, 'AC DC');

INSERT INTO ARTIST
(ArtistID, Name)
VALUES
(2, 'Accept');

INSERT INTO ARTIST
(ArtistID, Name)
VALUES
(3, 'Aerosmith');

INSERT INTO ARTIST
(ArtistID, Name)
VALUES
(4, 'Alanis Morissette');

INSERT INTO ARTIST
(ArtistID, Name)
VALUES
(5, 'Alice In Chains');

INSERT INTO ARTIST
(ArtistID, Name)
VALUES
(6, 'Antonio Carlos Jobim');

INSERT INTO ARTIST
(ArtistID, Name)
VALUES
(7, 'Apocalyptica');

INSERT INTO ARTIST
(ArtistID, Name)
VALUES
(8, 'Audioslave');

INSERT INTO ARTIST
(ArtistID, Name)
VALUES
(9, 'BackBeat');

INSERT INTO ARTIST
(ArtistID, Name)
VALUES
(10, 'Billy Cobham');

INSERT INTO ARTIST
(ArtistID, Name)
VALUES
(11, 'Black Label Society');

INSERT INTO ARTIST
(ArtistID, Name)
VALUES
(12, 'Black Sabbath');

/* Insert Album Data */

INSERT INTO ALBUM
(AlbumID, Title, ArtistID)
VALUES
(1, 'For Those About To Rock We Salute You', 1);

INSERT INTO ALBUM
(AlbumID, Title, ArtistID)
VALUES
(2, 'Balls to the Wall', 2);

INSERT INTO ALBUM
(AlbumID, Title, ArtistID)
VALUES
(3, 'Restless and Wild', 2);

INSERT INTO ALBUM
(AlbumID, Title, ArtistID)
VALUES
(4, 'Let There Be Rock', 1);

INSERT INTO ALBUM
(AlbumID, Title, ArtistID)
VALUES
(5, 'Big Ones', 3);

INSERT INTO ALBUM
(AlbumID, Title, ArtistID)
VALUES
(6, 'Jagged Little Pill', 4);

INSERT INTO ALBUM
(AlbumID, Title, ArtistID)
VALUES
(7, 'Facelift', 5);

INSERT INTO ALBUM
(AlbumID, Title, ArtistID)
VALUES
(8, 'Warner 25 Anos', 6);

INSERT INTO ALBUM
(AlbumID, Title, ArtistID)
VALUES
(9, 'Plays Metallica By Four Cellos', 7);

INSERT INTO ALBUM
(AlbumID, Title, ArtistID)
VALUES
(10, 'Audioslave', 8);

INSERT INTO ALBUM
(AlbumID, Title, ArtistID)
VALUES
(11, 'Out Of Exile', 8);

INSERT INTO ALBUM
(AlbumID, Title, ArtistID)
VALUES
(12, 'BackBeat Soundtrack', 9);

INSERT INTO ALBUM
(AlbumID, Title, ArtistID)
VALUES
(13, 'The Best Of Billy Cobham', 10);

INSERT INTO ALBUM
(AlbumID, Title, ArtistID)
VALUES
(14, 'Alcohol Fueled Brewtality Live! '||chr(91)||'Disc 1'||chr(93)||'', 11);

INSERT INTO ALBUM
(AlbumID, Title, ArtistID)
VALUES
(15, 'Alcohol Fueled Brewtality Live! '||chr(91)||'Disc 2'||chr(93)||'', 11);

INSERT INTO ALBUM
(AlbumID, Title, ArtistID)
VALUES
(16, 'Black Sabbath', 12);

INSERT INTO ALBUM
(AlbumID, Title, ArtistID)
VALUES
(17, 'Black Sabbath Vol. 4 '||chr(40)||'Remaster'||chr(41)||'', 12);

INSERT INTO ALBUM
(AlbumID, Title, ArtistID)
VALUES
(34, 'Chill'||chr(58)||' Brazil '||chr(40)||'Disc 2'||chr(41)||'', 6);

INSERT INTO ALBUM
(AlbumID, Title, ArtistID)
VALUES
(271, 'Revelations', 8);

/* Insert Track Data */

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(1, 'For Those About To Rock (We Salute You)', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 343719, 11170334, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(6, 'Put The Finger On You', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 205662, 6713451, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(2, 'Balls to the Wall', 2, 2, 1, NULL, 230619, 3990994, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(3, 'Fast As a Shark', 3, 2, 1, 'F. Baltes, S. Kaufman, U. Dirkscneider and W. Hoffman', 230619, 3990994, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(4, 'Restless and Wild', 3, 2, 1, 'F. Baltes, R.A. Smith-Diesel, S. Kaufman, U. Dirkscneider and W. Hoffman', 252051, 4331779, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(16, 'Dog Eat Dog', 4, 1, 1, 'AC DC', 215196, 7032162, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(17, 'Let There Be Rock', 4, 1, 1, 'AC DC', 366654, 12021261, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(23, 'Walk On Water', 5, 1, 1, 'Steven Tyler, Joe Perry, Jack Blades, Tommy Shaw', 295680, 9719579, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(24, 'Love In An Elevator', 5, 1, 1, 'Steven Tyler, Joe Perry', 321828, 10552051, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(38, 'All I Really Want', 6, 1, 1, 'Alanis Morissette and Glenn Ballard', 284891, 9375567, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(39, 'You Oughta Know', 6, 1, 1, 'Alanis Morissette and Glenn Ballard', 249234, 8196916, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(40, 'Perfect', 6, 1, 1, 'Alanis Morissette and Glenn Ballard', 188133, 6145404, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(51, 'We Die Young', 7, 1, 1, 'Jerry Cantrell', 152084, 4925362, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(52, 'Man In The Box', 7, 1, 1, 'Jerry Cantrell, Layne Staley', 286641, 9310272, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(63, 'Desafinado', 8, 1, 2, NULL, 185338, 5990473, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(64, 'Garota De Ipanema', 8, 1, 2, NULL, 285048, 9348428, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(77, 'Enter Sandman', 9, 1, 3, 'Apocalyptica', 221701, 7286305, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(78, 'Master Of Puppets', 9, 1, 3, 'Apocalyptica', 436453, 14375310, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(85, 'Cochise', 10, 1, 1, 'Audioslave Chris Cornell', 222380, 5339931, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(86, 'Show Me How to Live', 10, 1, 1, 'Audioslave Chris Cornell', 277890, 6672176, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(99, 'Your Time Has Come', 11, 1, 4, 'Cornell, Commerford, Morello, Wilk', 255529, 8273592, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(100, 'Out Of Exile', 11, 1, 4, 'Cornell, Commerford, Morello, Wilk', 291291, 9506571, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(111, 'Money', 12, 1, 5, 'Berry Gordy, Jr. Janie Bradford', 147591, 2365897, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(112, 'Long Tall Sally', 12, 1, 5, 'Enotris Johnson Little Richard Robert "Bumps" Blackwell', 106396, 1707084, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(123, 'Quadrant', 13, 1, 2, 'Billy Cobham', 261851, 8538199, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(124, 'Snoopy''s search-Red baron', 13, 1, 2, 'Billy Cobham', 456071, 15075616, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(131, 'Intro/ Low Down', 14, 1, 3, NULL, 323683, 10642901, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(132, '13 Years Of Grief', 14, 1, 3, NULL, 246987, 8137421, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(144, 'Heart Of Gold', 15, 1, 3, NULL, 194873, 6417460, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(145, 'Snowblind', 15, 1, 3, NULL, 420022, 13842549, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(149, 'Black Sabbath', 16, 1, 3, NULL, 382066, 12440200, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(150, 'The Wizard', 16, 1, 3, NULL, 264829, 8646737, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(156, 'Wheels Of Confusion   The Straightener', 17, 1, 3, 'Tony Iommi, Bill Ward, Geezer Butler, Ozzy Osbourne', 494524, 16065830, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(157, 'Tomorrow''s Dream', 17, 1, 3, 'Tony Iommi, Bill Ward, Geezer Butler, Ozzy Osbourne', 192496, 6252071, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(403, 'Bumbo Da Mangueira', 34, 1, 7, 'Varius', 270158, 9073350, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(404, 'Mr Funk Samba', 34, 1, 7, 'Varius', 213890, 7102545, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(3389, 'Revelations', 271, 2, 23, NULL, 252376, 252376, 0.99);

INSERT INTO Track
(TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
(3390, 'One and the Same', 271, 2, 23, NULL, 217732, 3559040, 0.99);













