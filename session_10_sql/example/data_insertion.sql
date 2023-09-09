-- Insert data into Property Table
INSERT INTO Property (address, square_feet, num_bedrooms, num_bathrooms, year_built)
VALUES
    ('123 Main St, City A', 2000, 3, 2, 2005),
    ('456 Elm St, City B', 1800, 4, 3, 2010),
    ('789 Oak St, City C', 2200, 5, 3.5, 2008);

-- Insert data into Agent Table
INSERT INTO Agent (name, email, phone)
VALUES
    ('John Doe', 'john.doe@example.com', '(123) 456-7890'),
    ('Jane Smith', 'jane.smith@example.com', '(987) 654-3210'),
    ('Mark Johnson', 'mark.j@example.com', '(555) 123-4567');

-- Insert data into Listing Table
INSERT INTO Listing (property_id, agent_id, list_price, list_date)
VALUES
    (1, 1, 250000, '2023-01-15'),
    (2, 2, 320000, '2023-02-10'),
    (3, 3, 400000, '2023-03-05'),
    (1, 2, 260000, '2023-03-10');

-- Insert data into Buyer Table
INSERT INTO Buyer (name, email, phone)
VALUES
    ('Sarah Johnson', 'sarah.j@example.com', '(555) 987-6543'),
    ('Michael Brown', 'michael.b@example.com', '(111) 222-3333'),
    ('Emily Davis', 'emily.d@example.com', '(999) 888-7777');

-- Insert data into Sale Table
INSERT INTO Sale (listing_id, buyer_id, sale_price, sale_date)
VALUES
    (1, 1, 245000, '2023-04-01'),
    (2, 3, 315000, '2023-04-15'),
    (3, 2, 395000, '2023-05-02');
