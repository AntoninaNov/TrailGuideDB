CREATE TABLE locations (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(255) NOT NULL,
    region VARCHAR(255) NOT NULL,
    coordinates GEOMETRY NOT NULL
);

CREATE TABLE difficulties (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE trails (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    length DOUBLE(8, 2) NOT NULL,
    elevation INT NOT NULL,
    description TEXT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    location_id INT NOT NULL,
    difficulties_id INT NOT NULL,
    FOREIGN KEY (location_id) REFERENCES locations(id),
    FOREIGN KEY (difficulties_id) REFERENCES difficulties(id)
);

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    user_password VARCHAR(100) NOT NULL,
    profile_type ENUM('noob', 'regular', 'pro') NOT NULL
);

CREATE TABLE ratings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    trail_id INT NOT NULL,
    score INT CHECK (score BETWEEN 1 AND 5) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (trail_id) REFERENCES trails(id)
);

CREATE TABLE reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    trail_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    content TEXT,
    review_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (trail_id) REFERENCES trails(id)
);

INSERT INTO locations (name, country, region, coordinates) VALUES
('Carpathian Mountains', 'Ukraine', 'Ivano-Frankivsk Oblast', ST_GeomFromText('POINT(24.5556 48.5556)')),
('Shatsk National Natural Park', 'Ukraine', 'Volyn Oblast', ST_GeomFromText('POINT(23.8500 51.5000)')),
('Hoverla', 'Ukraine', 'Carpathians', ST_GeomFromText('POINT(24.5997 48.1598)')),
('Chernihiv Historical Park', 'Ukraine', 'Chernihiv Oblast', ST_GeomFromText('POINT(31.2893 51.4982)')),
('Askania-Nova Biosphere Reserve', 'Ukraine', 'Kherson Oblast', ST_GeomFromText('POINT(33.8704 46.4650)')),
('Dniester Canyon', 'Ukraine', 'Ternopil Oblast', ST_GeomFromText('POINT(25.5736 48.5231)'));

INSERT INTO difficulties (name, description) VALUES
('Easy', 'Suitable for all skill levels'),
('Moderate', 'May require some level of fitness and experience'),
('Hard', 'Challenging for most hikers, suitable for experienced individuals');

INSERT INTO trails (name, length, elevation, description, image_url, location_id, difficulties_id) VALUES
('Marmarosy Ridge Trail', 20500.00, 1950, 'Scenic views across the Marmarosy massif, part of the Carpathian range.', 'image_url', 1, 3),
('Shatsk Lakes Circuit', 15000.00, 150, 'A beautiful loop around the Shatsk Lakes, perfect for wildlife spotting.', 'image_url', 2, 1),
('Hoverla Ascent', 6000.00, 2061, 'The highest point of Ukraine. A challenging ascent with rewarding views.', 'image_url', 3, 3),
('Ancient Chernihiv Trail', 5000.00, 30, 'Explore the historical landscapes of Chernihiv, featuring ancient churches and green parks.', 'image_url', 4, 1),
('Askania-Nova Safari', 12000.00, 10, 'A unique experience through the famous biosphere reserve with a chance to see rare species.', 'image_url', 5, 1),
('Dniester River Kayak Route', 40000.00, 0, 'A thrilling kayak adventure along the Dniester Canyon, showcasing breathtaking views.', 'image_url', 6, 2),
('Hoverla Ascent', 7000.00, 2050, 'The less traveled path to Hoverla, offering unique views.', 'image_url', 3, 3);

INSERT INTO users (name, email, user_password, profile_type) VALUES
('Olena Hikerska', 'olena@example.com', 'hashed_password', 'regular'),
('Andriy Mountainlover', 'andriy@example.com', 'hashed_password', 'pro'),
('Ivan Trailseeker', 'ivan@example.com', 'hashed_password', 'noob'),
('Kateryna Greenfoot', 'kateryna@example.com', 'hashed_password', 'regular'),
('Oleksandr Pathfinder', 'oleksandr@example.com', 'hashed_password', 'pro');

INSERT INTO ratings (user_id, trail_id, score) VALUES
(1, 1, 5),
(2, 2, 4),
(3, 3, 5),
(4, 4, 4),
(5, 5, 5),
(1, 6, 4),
(4, 5, 5),
(5, 6, 5),
(1, 6, 4),
(2, 1, 3),
(3, 2, 4),
(4, 3, 2),
(5, 4, 3),
(1, 5, 4),
(2, 6, 5),
(3, 1, 5),
(4, 2, 4),
(5, 3, 5);

INSERT INTO reviews (user_id, trail_id, title, content, review_date) VALUES
(1, 1, 'Breathtaking', 'An unforgettable journey through the Marmarosy Ridge. Highly recommend!', '2023-08-15'),
(2, 2, 'Peaceful and beautiful', 'A perfect getaway. Shatsk Lakes are serene and full of life.', '2023-09-01'),
(3, 3, 'Challenging but rewarding', 'Hoverla was tough but the views from the top are worth every step.', '2023-10-05'),
(4, 4, 'Historic walk', 'A lovely walk through Chernihiv’s past. So much to learn and see.', '2023-11-12'),
(5, 5, 'Wildlife wonders', 'Askania-Nova is a must-visit for nature lovers. The safari tour was exceptional.', '2023-12-08'),
(1, 6, 'Kayaking adventure', 'Kayaking down the Dniester was exhilarating. The canyons are magnificent.', '2024-01-20'),
(2, 3, 'Top of Ukraine', 'The climb was challenging but the panorama from Hoverla is unparalleled.', '2024-02-01'),
(3, 5, 'Safari like no other', 'Askania-Nova offers a glimpse into the vast diversity of wildlife. Truly a unique experience.', '2024-02-03'),
(4, 6, 'Dniester Adventure', 'Paddling through the canyon was peaceful and thrilling at the same time. Must try!', '2024-02-05'),
(5, 1, 'Marmarosy Magic', 'The Marmarosy trail exceeded all expectations. The landscapes are stunning.', '2024-02-07'),
(1, 4, 'A walk through history', 'Exploring Chernihiv’s ancient sites was both educational and enjoyable. Great for families.', '2024-02-09'),
(2, 7, 'Alternative Hoverla Path', '', '2024-02-14');