# Colorado Outdoor Caution Database

## Project Description
This project is a Python and MySQL database application that tracks the outdoor environments across Colorado. It stores information on locations, activities, seasons, death types, and enthusiasts to analyze risks with the outdoors.

The system uses a relational database design and a Python command line interface to perform CRUD. 

---

## Features
- View fatality records from the database
- Add new enthusiasts
- Update weather conditions for incidents
- Delete fatality records 
- Connect Python application to MySQL database
- Implements of CRUD 

---

## Database Tables
- **enthusiast** → stores information about outdoor users
- **activity** → types of outdoor activities
- **location** → locations where incidents happened
- **season** → seasonal climate
- **death_type** → categories of fatal incidents
- **enthusiast_activity** → many-to-many relationship between enthusiasts and activities
- **fatality** → main table storing incident records

---

## Setup Instructions

### 1. Start MySQL
```bash
docker run --name final-project-db \
-e MYSQL_ROOT_PASSWORD=password \
-p 3306:3306 \
-d mysql:latest

```

### 2. start main.py
```bash
python3 main.py
```
