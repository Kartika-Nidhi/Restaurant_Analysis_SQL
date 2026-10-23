CREATE TABLE countries (
    country_code INT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL
);

CREATE TABLE cities (
    city_id INT AUTO_INCREMENT PRIMARY KEY,
    city_name VARCHAR(100) NOT NULL,
    country_code INT NOT NULL,
    FOREIGN KEY (country_code) REFERENCES countries(country_code)
);

--Core Entity Table
CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(255) NOT NULL,
    address TEXT,
    locality VARCHAR(255),
    locality_verbose TEXT,
    city_id INT NOT NULL,
    longitude DECIMAL(10, 7),
    latitude DECIMAL(10, 7),
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

CREATE TABLE cuisines (
    cuisine_id INT AUTO_INCREMENT PRIMARY KEY,
    cuisine_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE restaurant_cuisines (
    restaurant_id INT NOT NULL,
    cuisine_id INT NOT NULL,
    PRIMARY KEY (restaurant_id, cuisine_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id) ON DELETE CASCADE,
    FOREIGN KEY (cuisine_id) REFERENCES cuisines(cuisine_id) ON DELETE CASCADE
);


CREATE TABLE restaurant_metrics (
    restaurant_id INT PRIMARY KEY,
    currency VARCHAR(20),
    average_cost_for_two DECIMAL(10, 2),
    price_range INT CHECK (price_range BETWEEN 1 AND 4),
    has_table_booking VARCHAR(4),
    has_online_delivery VARCHAR(4),
    is_delivering_now VARCHAR(4),
    switch_to_order_menu VARCHAR(4),
    aggregate_rating DECIMAL(3, 1),
    rating_color VARCHAR(30),
    rating_text VARCHAR(50),
    votes INT,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id) ON DELETE CASCADE
);

