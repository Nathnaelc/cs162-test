-- Create Property Table
CREATE TABLE Property (
    property_id INTEGER PRIMARY KEY,
    address TEXT NOT NULL,
    square_feet REAL,
    num_bedrooms INTEGER,
    num_bathrooms REAL,
    year_built INTEGER
);

-- Create Agent Table
CREATE TABLE Agent (
    agent_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT,
    phone TEXT
);

-- Create Listing Table
CREATE TABLE Listing (
    listing_id INTEGER PRIMARY KEY,
    property_id INTEGER,
    agent_id INTEGER,
    list_price REAL,
    list_date DATE,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (agent_id) REFERENCES Agent(agent_id)
);

-- Create Buyer Table
CREATE TABLE Buyer (
    buyer_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT,
    phone TEXT
);

-- Create Sale Table
CREATE TABLE Sale (
    sale_id INTEGER PRIMARY KEY,
    listing_id INTEGER,
    buyer_id INTEGER,
    sale_price REAL,
    sale_date DATE,
    FOREIGN KEY (listing_id) REFERENCES Listing(listing_id),
    FOREIGN KEY (buyer_id) REFERENCES Buyer(buyer_id)
);
