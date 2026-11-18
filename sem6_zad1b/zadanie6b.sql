CREATE TABLE dim_customer (
    customer_key INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    country VARCHAR(40),
    city VARCHAR(40),
    email VARCHAR(60)
);

CREATE TABLE dim_artist (
    artist_key INT AUTO_INCREMENT PRIMARY KEY,
    artist_id INT NOT NULL,
    artist_name VARCHAR(120)
);

CREATE TABLE dim_genre (
    genre_key INT AUTO_INCREMENT PRIMARY KEY,
    genre_id INT NOT NULL,
    genre_name VARCHAR(120)
);

CREATE TABLE dim_track (
    track_key INT AUTO_INCREMENT PRIMARY KEY,
    track_id INT NOT NULL,
    track_name VARCHAR(200),
    composer VARCHAR(220),
    milliseconds INT
);

CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day_of_week VARCHAR(15),
    month_number INT,
    month_name VARCHAR(20),
    quarter INT,
    year INT
);

CREATE TABLE fact_sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_key INT NOT NULL,
    track_key INT NOT NULL,
    artist_key INT NOT NULL,
    genre_key INT NOT NULL,
    date_key INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_sales_customer FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key),
    CONSTRAINT fk_sales_track FOREIGN KEY (track_key) REFERENCES dim_track(track_key),
    CONSTRAINT fk_sales_artist FOREIGN KEY (artist_key) REFERENCES dim_artist(artist_key),
    CONSTRAINT fk_sales_genre FOREIGN KEY (genre_key) REFERENCES dim_genre(genre_key),
    CONSTRAINT fk_sales_date FOREIGN KEY (date_key) REFERENCES dim_date(date_key)
);