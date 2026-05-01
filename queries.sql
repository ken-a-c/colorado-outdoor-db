USE colorado_outdoor_caution;

-- 1.
SELECT * FROM fatality;

-- 2. 
SELECT
    fatality.fatality_id,
    fatality.incident_date,
    location.location_name,
    death_type.type_name,
    season.season_name,
    fatality.weather_conditions
FROM fatality
JOIN location ON fatality.location_id = location.location_id
JOIN death_type ON fatality.death_type_id = death_type.death_type_id
JOIN season ON fatality.season_id = season.season_id;

-- 3. count fatalities by season
SELECT
    season.season_name,
    COUNT(*) as total_fatalities
FROM fatality
JOIN season ON fatality.season_id = season.season_id
GROUP BY season.season_name;

-- 4. 
SELECT
    death_type.type_name,
    COUNT(*) as total
FROM fatality
JOIN death_type ON fatality.death_type_id = death_type.death_type_id
GROUP BY death_type.type_name;

-- 5.
SELECT
    location.location_name,
    COUNT(*) as total_fatalities
FROM fatality
JOIN location ON fatality.location_id = location.location_id
GROUP BY location.location_name;

-- 6. 
SELECT AVG(age_of_victim) as average_age
FROM fatality;

-- 7. 
SELECT
    fatality_id,
    incident_date,
    group_or_solo
FROM fatality
WHERE group_or_solo = 'Solo';

-- 8. 
SELECT
    fatality.fatality_id,
    location.location_name,
    location.elevation_ft
FROM fatality
JOIN location ON fatality.location_id = location.location_id
WHERE location.elevation_ft > 10000;

-- 9. 
SELECT
    enthusiast.first_name,
    enthusiast.last_name,
    enthusiast.experience_level
FROM fatality
JOIN enthusiast ON fatality.enthusiast_id = enthusiast.enthusiast_id
WHERE enthusiast.experience_level = 'Expert';