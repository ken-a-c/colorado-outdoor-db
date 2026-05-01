USE colorado_outdoor_caution;

INSERT INTO death_type (type_name, description) VALUES
('Predatory Attack', 'Fatal animal encounter'),
('Impact Injury', 'Falls or collisions'),
('Environmental Exposure', 'Hypothermia or exposure to weather'),
('Drowning', 'Water-related fatality'),
('Avalanche', 'Snow slide incident'),
('Natural Causes', 'Medical emergency outdoors'),
('Hypothermia', 'Extreme cold exposure'),
('Heat Stroke', 'Extreme heat exposure'),
('Rockfall', 'Falling rocks in mountain areas'),
('Lightning Strike', 'Storm-related fatality');

INSERT INTO season (season_name, months_covered) VALUES
('Spring', 'March-May'),
('Summer', 'June-August'),
('Fall', 'September-November'),
('Winter', 'December-February'),
('Early Spring', 'March'),
('Late Spring', 'May'),
('Early Summer', 'June'),
('Late Summer', 'August'),
('Early Winter', 'December'),
('Late Winter', 'February');

INSERT INTO activity (activity_name, risk_level, required_gear) VALUES
('Hiking', 'Moderate', 'Boots, water, map'),
('Mountain Climbing', 'Extreme', 'Rope, helmet, harness'),
('Camping', 'Low', 'Tent, sleeping bag'),
('Whitewater Rafting', 'High', 'Life jacket, helmet'),
('Paddle Boarding', 'Moderate', 'Life jacket, paddle'),
('Backpacking', 'High', 'Food, navigation tools'),
('Trail Running', 'Moderate', 'Running shoes, water'),
('Skiing', 'High', 'Skis, helmet'),
('Snowshoeing', 'Moderate', 'Snowshoes, warm clothing'),
('Rock Climbing', 'Extreme', 'Rope, chalk, harness');

INSERT INTO location (location_name, region_type, county, wilderness_area, elevation_ft, nearest_trailhead) VALUES
('Emerald Lake Trail', 'Alpine Tundra', 'Larimer', 'Rocky Mountain National Park', 10110, 'Bear Lake Trailhead'),
('Sky Pond via Glacier Gorge Trail', 'Alpine Tundra', 'Larimer', 'Rocky Mountain National Park', 10900, 'Glacier Gorge Trailhead'),
('Maroon Bells Scenic Loop Trail', 'Coniferous Forest', 'Pitkin', 'Maroon Bells-Snowmass Wilderness', 9580, 'Maroon Lake Trailhead'),
('Ice Lake Basin Trail', 'Alpine Tundra', 'San Juan', 'San Juan National Forest', 12257, 'South Mineral Campground Trailhead'),
('Mount Bierstadt Trail', 'Alpine Tundra', 'Clear Creek', 'Mount Evans Wilderness', 14060, 'Guanella Pass Trailhead'),
('Hanging Lake Trail', 'Arid Canyon', 'Garfield', 'White River National Forest', 7200, 'Hanging Lake Trailhead'),
('Chasm Lake Trail', 'Coniferous Forest', 'Larimer', 'Rocky Mountain National Park', 11760, 'Longs Peak Trailhead'),
('The Manitou Incline', 'Foothills', 'El Paso', 'Pike National Forest', 8600, 'Manitou Incline Trailhead'),
('Saint Marys Glacier', 'Foothills', 'Clear Creek', 'Arapaho National Forest', 10400, 'Saint Marys Glacier Trailhead'),
('Royal Arch Trail', 'Shrublands', 'Boulder', 'Chautauqua Park', 6850, 'Chautauqua Trailhead');

INSERT INTO enthusiast (first_name, last_name, age, experience_level, state_of_residence) VALUES
('Trenton', 'Patterson', 28, 'Intermediate', 'Colorado'),
('Kenny', 'Chiv', 22, 'Beginner', 'Colorado'),
('Eric', 'Garcia', 35, 'Expert', 'Colorado'),
('Khangphuc', 'Nguyen', 31, 'Intermediate', 'Texas'),
('Anphuc', 'Nguyen', 29, 'Beginner', 'California'),
('Presley', 'Garcia-Bidwell', 24, 'Beginner', 'Colorado'),
('Zkay', 'Reyes', 26, 'Intermediate', 'Colorado'),
('Xander', 'Pham', 33, 'Expert', 'Wyoming'),
('Daniel', 'Cantu', 41, 'Expert', 'Colorado'),
('Dusty', 'Tomlinson', 19, 'Beginner', 'Kansas');

INSERT INTO enthusiast_activity (enthusiast_id, activity_id, proficiency_level) VALUES
(1, 1, 'Intermediate'),
(2, 2, 'Beginner'),
(3, 3, 'Expert'),
(4, 4, 'Intermediate'),
(5, 5, 'Beginner'),
(6, 6, 'Beginner'),
(7, 7, 'Intermediate'),
(8, 8, 'Expert'),
(9, 9, 'Expert'),
(10, 10, 'Beginner');

INSERT INTO fatality (
incident_date,
location_id,
death_type_id,
season_id,
enthusiast_id,
age_of_victim,
weather_conditions,
group_or_solo,
notes
) VALUES
('2024-01-14', 5, 5, 4, 1, 28, 'Snowstorm', 'Group', 'Avalanche incident'),
('2024-02-10', 7, 2, 4, 2, 22, 'Icy conditions', 'Solo', 'Fall on steep terrain'),
('2024-03-18', 6, 3, 1, 3, 35, 'Cold rain', 'Group', 'Exposure overnight'),
('2024-04-05', 10, 2, 1, 4, 31, 'Wet rocks', 'Solo', 'Slip and fall'),
('2024-05-22', 9, 1, 1, 5, 29, 'Foggy', 'Group', 'Wildlife encounter'),
('2024-06-14', 3, 6, 2, 6, 24, 'Hot weather', 'Solo', 'Medical emergency'),
('2024-07-11', 1, 10, 2, 7, 26, 'Thunderstorm', 'Group', 'Lightning strike'),
('2024-08-03', 4, 2, 2, 8, 33, 'Loose rock', 'Solo', 'Climbing accident'),
('2024-09-15', 8, 6, 3, 9, 41, 'Clear weather', 'Group', 'Heart failure'),
('2024-10-09', 2, 4, 3, 10, 19, 'Fast river flow', 'Solo', 'Drowning incident');
