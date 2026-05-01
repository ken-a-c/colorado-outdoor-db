CREATE DATABASE IF NOT EXISTS colorado_outdoor_caution;
USE colorado_outdoor_caution;

-- death types 
CREATE TABLE death_type (
    death_type_id INT NOT NULL AUTO_INCREMENT,
    type_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    PRIMARY KEY (death_type_id)
);

-- the four different seasons
CREATE TABLE season (
    season_id INT NOT NULL AUTO_INCREMENT,
    season_name VARCHAR(20) NOT NULL UNIQUE,
    months_covered VARCHAR(50) NOT NULL,
    PRIMARY KEY (season_id)
);

-- where the incident happened
CREATE TABLE location (
    location_id INT NOT NULL AUTO_INCREMENT,
    location_name VARCHAR(150) NOT NULL,
    region_type ENUM('Alpine Tundra', 'Coniferous Forest', 'Foothills', 'Shrublands', 'Arid Canyon', 'Waterway') NOT NULL,
    county VARCHAR(100) NOT NULL,
    wilderness_area VARCHAR(150),
    elevation_ft INT,
    nearest_trailhead VARCHAR(150),
    PRIMARY KEY (location_id),
    CONSTRAINT chk_elevation CHECK (elevation_ft >= 0 AND elevation_ft <= 15000)
);

CREATE TABLE activity (
    activity_id INT NOT NULL AUTO_INCREMENT,
    activity_name VARCHAR(100) NOT NULL UNIQUE,
    risk_level ENUM('Low', 'Moderate', 'High', 'Extreme') NOT NULL DEFAULT 'Moderate',
    required_gear TEXT,
    PRIMARY KEY (activity_id)
);

CREATE TABLE enthusiast (
    enthusiast_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(75) NOT NULL,
    last_name VARCHAR(75) NOT NULL,
    age INT NOT NULL,
    experience_level ENUM('Beginner', 'Intermediate', 'Expert') NOT NULL DEFAULT 'Beginner',
    state_of_residence VARCHAR(50) NOT NULL DEFAULT 'Colorado',
    PRIMARY KEY (enthusiast_id),
    CONSTRAINT chk_age CHECK (age >= 1 AND age <= 120)
);

-- table for enthusiast and activity
CREATE TABLE enthusiast_activity (
    id INT NOT NULL AUTO_INCREMENT,
    enthusiast_id INT NOT NULL,
    activity_id INT NOT NULL,
    proficiency_level ENUM('Beginner', 'Intermediate', 'Expert') NOT NULL DEFAULT 'Beginner',
    PRIMARY KEY (id),
    UNIQUE KEY uq_enthusiast_activity (enthusiast_id, activity_id),
    FOREIGN KEY (enthusiast_id) REFERENCES enthusiast(enthusiast_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (activity_id) REFERENCES activity(activity_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- the main table
CREATE TABLE fatality (
    fatality_id INT NOT NULL AUTO_INCREMENT,
    incident_date DATE NOT NULL,
    location_id INT NOT NULL,
    death_type_id INT NOT NULL,
    season_id INT NOT NULL,
    enthusiast_id INT NOT NULL,
    age_of_victim INT NOT NULL,
    weather_conditions VARCHAR(150) NOT NULL DEFAULT 'Unknown',
    group_or_solo ENUM('Solo', 'Group') NOT NULL DEFAULT 'Solo',
    notes TEXT,
    PRIMARY KEY (fatality_id),
    CONSTRAINT chk_victim_age CHECK (age_of_victim >= 1 AND age_of_victim <= 120),
    FOREIGN KEY (location_id) REFERENCES location(location_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (death_type_id) REFERENCES death_type(death_type_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (season_id) REFERENCES season(season_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (enthusiast_id) REFERENCES enthusiast(enthusiast_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);
