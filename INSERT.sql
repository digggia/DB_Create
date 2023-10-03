INSERT INTO Genre (genre_name)
VALUES
    ('Rock'),
    ('Pop'),
    ('Hip Hop'),
    ('Electronic'),
    ('Jazz'),
    ('Country'),
    ('R&B'),
    ('Reggae')
ON CONFLICT DO NOTHING;
   
INSERT INTO Singer (singer_name)
VALUES
    ('Beyoncé'),
    ('Ed Sheeran'),
    ('Taylor Swift'),
    ('Drake'),
    ('Adele'),
    ('Justin Bieber'),
    ('Rihanna'),
    ('Eminem')
ON CONFLICT DO NOTHING;
    
INSERT INTO Album (album_name, release_year)
VALUES
    ('Lemonade', '2020-01-01'),
    ('Lovers Rock', '2020-05-10'),
    ('Red', '2019-09-15'),
    ('Nothing Was the Same', '2017-11-25'),
    ('Adele: The Story So Far', '2016-04-02'),
    ('Under the Mistletoe', '2018-08-20'),
    ('Good Girl Gone Bad', '2020-03-12'),
    ('The Slim Shady LP', '2020-12-05')
ON CONFLICT DO NOTHING;

INSERT INTO Track (album_id, track_name, duration)
VALUES
    (1, 'Single Ladies my own', 180),
    (1, 'Irreplaceable', 240),
    (1, 'premyne', 210),
    (2, 'Shape of own my You', 215),
    (2, 'Thinking Out Loud', 190),
    (3, 'by myself by', 225),
    (3, 'You Belong with Me', 205),
    (4, 'One Dance', 220),
    (4, 'In My Feelings', 195),
    (4, 'myself', 230),
    (5, 'Rolling in the Deep', 210),
    (5, 'Skyfall', 235),
    (5, 'myself by', 185),
    (6, 'by myself', 245),
    (6, 'Yummy', 225),
    (7, 'Umbrella', 215),
    (7, 'bemy self', 195),
    (7, 'We Found my Love', 220),
    (7, 'beemy', 230),
    (7, 'Only Girl', 210),
    (8, 'Love the Way You Lie', 235),
    (8, 'Not oh my god Afraid', 185)
ON CONFLICT DO NOTHING;
    
INSERT INTO Collection (collection_name, release_year)
VALUES
('Hip-Hop Legends: Drake, Eminem, Rihanna', 2022),
('Ultimate Collection: Adele, Eminem, Taylor Swift', 2020),
('Pop Divas: Beyoncé, Rihanna, Adele', 2019),
('Best of Pop: Beyoncé, Ed Sheeran, Taylor Swift', 2017),
('The Icons: Beyoncé, Rihanna, Eminem', 2020),
('Acoustic Sessions: Ed Sheeran, Taylor Swift, Justin Bieber', 2018),
('Chart-Topping Hits: Drake, Justin Bieber, Rihanna', 2021),
('Greatest Hits: Ed Sheeran, Justin Bieber, Taylor Swift', 2015)
ON CONFLICT DO NOTHING;

INSERT INTO Genre_Singer (genre_id, singer_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 2),
    (2, 3),
    (3, 3),
    (3, 4),
    (4, 4),
    (4, 5),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 7),
    (7, 7),
    (7, 8),
    (8, 8),
    (8, 1)
ON CONFLICT DO NOTHING;
    
INSERT INTO Collection_Track (collection_id, track_id)
VALUES
	(1, 1),
	(1, 3),
	(1, 5),
	(2, 2),
	(2, 4),
	(2, 6),
	(3, 7),
	(3, 9),
	(3, 11),
	(4, 8),
	(4, 10),
	(4, 12),
	(5, 13),
	(5, 15),
	(6, 14),
	(6, 16),
	(7, 1),
	(7, 3),
	(7, 5),
	(8, 2),
	(8, 4),
	(8, 6)
ON CONFLICT DO NOTHING;

INSERT INTO Singer_Album (album_id, singer_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8)
ON CONFLICT DO NOTHING;