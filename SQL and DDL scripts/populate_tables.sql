-- Populating the database
INSERT INTO packages (PACKAGE_ID, PACKAGE_NAME, TOTAL_DAYS, START_DATE, END_DATE, DIFFICULTY) 
    WITH names AS ( 
        SELECT 'GAND8', 'Ghandruk', 4, '01-JAN-2020',   '04-JAN-2020', 'Moderate' FROM dual UNION ALL 
        SELECT 'ABC21', 'Annapurna BC', 6, '12-FEB-2020',   '17-FEB-2020', 'Hard' FROM dual UNION ALL 
        SELECT 'PUNH1', 'Poon-Hill', 5, '01-JAN-2020',   '05-JAN-2020', 'Hard' FROM dual UNION ALL 
        SELECT 'EBC77', 'Everest BC', 8, '01-JAN-2020',   '08-JAN-2020', 'Hard' FROM dual UNION ALL 
        SELECT 'LUKL1', 'Lukla', 3, '01-MAR-2020',   '03-MAR-2020', 'Moderate' FROM dual 
    ) 
    SELECT * FROM names;


INSERT INTO destination (PACKAGE_ID, DESTINATION) 
    WITH names AS ( 
        SELECT 'GAND8', 'Pokhara' FROM dual UNION ALL
        SELECT 'GAND8', 'Ghandruk' FROM dual UNION ALL
        SELECT 'ABC21', 'Pokhara' FROM dual UNION ALL
        SELECT 'ABC21', 'Ghandruk' FROM dual UNION ALL
        SELECT 'ABC21', 'ABC' FROM dual UNION ALL
        SELECT 'PUNH1', 'Pokhara' FROM dual UNION ALL
        SELECT 'PUNH1', 'Ghorepani' FROM dual UNION ALL
        SELECT 'PUNH1', 'PoonHill' FROM dual UNION ALL
        SELECT 'PUNH1', 'Ghandruk' FROM dual UNION ALL
        SELECT 'LUKL1', 'Lukla' FROM dual UNION ALL
        SELECT 'EBC77', 'Lukla' FROM dual UNION ALL
        SELECT 'EBC77', 'Namche-Bazzar' FROM dual UNION ALL
        SELECT 'EBC77', 'Dingboche' FROM dual UNION ALL
        SELECT 'EBC77', 'EBC' FROM dual
        ) 
    SELECT * FROM names;


INSERT INTO itinerary (PACKAGE_ID, DAY, TRAVEL_DETAILS, DIFFICULTY_LEVEL) 
    WITH names AS ( 
        SELECT 'GAND8', 'day-1', 'Kathmandu-Pokhara', 'Easy' FROM dual UNION ALL
        SELECT 'GAND8', 'day-2', 'Pokhara-Ghandruk', 'Hard' FROM dual UNION ALL
        SELECT 'GAND8', 'day-3', 'Ghandruk-Pokhara', 'Hard' FROM dual UNION ALL
        SELECT 'GAND8', 'day-4', 'Pokhara-Kathmandu', 'Easy' FROM dual UNION ALL
        --
        SELECT 'ABC21', 'day-1', 'Kathmandu-Pokhara', 'Easy' FROM dual UNION ALL
        SELECT 'ABC21', 'day-2', 'Pokhara-Ghandruk', 'Hard' FROM dual UNION ALL
        SELECT 'ABC21', 'day-3', 'Ghandruk-ABC', 'Hard' FROM dual UNION ALL
        SELECT 'ABC21', 'day-4', 'ABC-Ghandruk', 'Hard' FROM dual UNION ALL
        SELECT 'ABC21', 'day-5', 'Ghandruk-Pokhara', 'Hard' FROM dual UNION ALL
        SELECT 'ABC21', 'day-6', 'Pokhara-Kathmandu', 'Easy' FROM dual UNION ALL
        --
        SELECT 'PUNH1', 'day-1', 'Kathmandu-Pokhara', 'Easy' FROM dual UNION ALL
        SELECT 'PUNH1', 'day-2', 'Pokhara-Ghorepani', 'Hard' FROM dual UNION ALL
        SELECT 'PUNH1', 'day-3', 'Gorepani-Ghandruk', 'Hard' FROM dual UNION ALL
        SELECT 'PUNH1', 'day-4', 'Ghandruk-Pokhara', 'Hard' FROM dual UNION ALL
        SELECT 'PUNH1', 'day-5', 'Pokhara-Kathmandu', 'Easy' FROM dual UNION ALL
        --
        SELECT 'LUKL1', 'day-1', 'Kathmandu-Lukla', 'Easy' FROM dual UNION ALL
        SELECT 'LUKL1', 'day-2', 'Lukla', 'Easy' FROM dual UNION ALL
        SELECT 'LUKL1', 'day-3', 'Lukla-Kathmandu', 'Easy' FROM dual UNION ALL
        --
        SELECT 'EBC77', 'day-1', 'Kathmandu-Lukla', 'Easy' FROM dual UNION ALL
        SELECT 'EBC77', 'day-2', 'Lukla-Namche Bazzar', 'Hard' FROM dual UNION ALL
        SELECT 'EBC77', 'day-3', 'Namche Bazzar-Dingboche', 'Hard' FROM dual UNION ALL
        SELECT 'EBC77', 'day-4', 'Dingboche-EBC', 'Hard' FROM dual UNION ALL
        SELECT 'EBC77', 'day-5', 'EBC-Dingboche', 'Hard' FROM dual UNION ALL
        SELECT 'EBC77', 'day-6', 'Dingboche-Namche Bazzar', 'Hard' FROM dual UNION ALL
        SELECT 'EBC77', 'day-7', 'Namche Bazzar-Lukla', 'Easy' FROM dual UNION ALL
        SELECT 'EBC77', 'day-8', 'Lukla-Kathmandu', 'Easy' FROM dual
    )
    SELECT * FROM names; 


INSERT INTO activity (ACTIVITY_ID, ACTIVITY_NAME, TRAVEL_MODE) 
    WITH names AS ( 
        SELECT 'A1', 'Driving from KTM to Pokhara', 'bus' FROM dual UNION ALL
        SELECT 'A2', 'Overnight stay in Hotel', 'stay' FROM dual UNION ALL
        SELECT 'A3', 'Trek to Ghandruk', 'walk' FROM dual UNION ALL
        SELECT 'A4', 'Explore the Ghandruk Village', 'walk' FROM dual UNION ALL
        SELECT 'A5', 'View the sunrise and Himalayas', 'walk' FROM dual UNION ALL
        SELECT 'A6', 'Trek Down to Pokhara', 'walk' FROM dual UNION ALL
        SELECT 'A7', 'Drive back to Kathmandu', 'walk' FROM dual UNION ALL
        --
        SELECT 'A8', 'Trek to ABC from Ghandruk', 'walk' FROM dual UNION ALL
        SELECT 'A9', 'Explore ABC', 'walk' FROM dual UNION ALL
        SELECT 'A10', 'Trek back to Ghandruk from ABC', 'walk' FROM dual UNION ALL
        --
        SELECT 'A11', 'Bus to halfway for ghorepani', 'walk' FROM dual UNION ALL
        SELECT 'A12', 'Trek to Ghorepani', 'walk' FROM dual UNION ALL
        SELECT 'A13', 'Hike to Poonhill', 'walk' FROM dual UNION ALL
        SELECT 'A14', 'Viewing Sunrise', 'walk' FROM dual UNION ALL
        --
        SELECT 'A15', 'Flight to Lukla', 'plane' FROM dual UNION ALL
        SELECT 'A16', 'Explore Lukla', 'walk' FROM dual UNION ALL
        SELECT 'A17', 'Overnight stay in Lukla', 'stay' FROM dual UNION ALL
        SELECT 'A18', 'Flight From Lukla to kathmandu', 'plane' FROM dual UNION ALL
        SELECT 'A19', 'Hike from Lukla to Namche bazzar', 'walk' FROM dual UNION ALL
        --
        SELECT 'A20', 'Trek from Namche bazzar to Dingboche', 'walk' FROM dual UNION ALL
        SELECT 'A21', 'Trek from Dingboche to EBC', 'walk' FROM dual UNION ALL
        SELECT 'A22', 'Explore EBC', 'walk' FROM dual UNION ALL
        SELECT 'A23', 'Trek from EBC to Dingboche', 'walk' FROM dual UNION ALL
        SELECT 'A24', 'Trek from Dingboche to Namche bazzar', 'walk' FROM dual UNION ALL
        SELECT 'A25', 'Trek from Namche bazzar to Lukla', 'walk' FROM dual
    ) 
    SELECT * FROM names; 


INSERT INTO day_activities (PACKAGE_ID, DAY, ACTIVITY_ID, STATUS) 
    WITH names AS ( 
        SELECT 'GAND8', 'day-1', 'A1', 'Incomplete' FROM dual UNION ALL
        SELECT 'GAND8', 'day-1', 'A2', 'Incomplete' FROM dual UNION ALL
        SELECT 'GAND8', 'day-2', 'A3', 'Incomplete' FROM dual UNION ALL
        SELECT 'GAND8', 'day-2', 'A4', 'Incomplete' FROM dual UNION ALL
        SELECT 'GAND8', 'day-3', 'A5', 'Incomplete' FROM dual UNION ALL
        SELECT 'GAND8', 'day-4', 'A6', 'Incomplete' FROM dual UNION ALL
        --
        SELECT 'ABC21', 'day-1', 'A1', 'Incomplete' FROM dual UNION ALL
        SELECT 'ABC21', 'day-1', 'A2', 'Incomplete' FROM dual UNION ALL
        SELECT 'ABC21', 'day-2', 'A3', 'Incomplete' FROM dual UNION ALL
        SELECT 'ABC21', 'day-2', 'A4', 'Incomplete' FROM dual UNION ALL
        SELECT 'ABC21', 'day-3', 'A8', 'Incomplete' FROM dual UNION ALL
        SELECT 'ABC21', 'day-3', 'A9', 'Incomplete' FROM dual UNION ALL
        SELECT 'ABC21', 'day-4', 'A10', 'Incomplete' FROM dual UNION ALL
        SELECT 'ABC21', 'day-5', 'A5', 'Incomplete' FROM dual UNION ALL
        SELECT 'ABC21', 'day-6', 'A6', 'Incomplete' FROM dual UNION ALL
        --
        SELECT 'PUNH1', 'day-1', 'A1', 'Incomplete' FROM dual UNION ALL
        SELECT 'PUNH1', 'day-1', 'A2', 'Incomplete' FROM dual UNION ALL
        SELECT 'PUNH1', 'day-2', 'A11', 'Incomplete' FROM dual UNION ALL
        SELECT 'PUNH1', 'day-2', 'A12', 'Incomplete' FROM dual UNION ALL
        SELECT 'PUNH1', 'day-3', 'A13', 'Incomplete' FROM dual UNION ALL
        SELECT 'PUNH1', 'day-3', 'A14', 'Incomplete' FROM dual UNION ALL
        SELECT 'PUNH1', 'day-3', 'A3', 'Incomplete' FROM dual UNION ALL
        SELECT 'PUNH1', 'day-4', 'A5', 'Incomplete' FROM dual UNION ALL
        SELECT 'PUNH1', 'day-5', 'A6', 'Incomplete' FROM dual UNION ALL
        --
        SELECT 'LUKL1', 'day-1' , 'A15', 'Incomplete' FROM dual UNION ALL
        SELECT 'LUKL1', 'day-1' , 'A16', 'Incomplete' FROM dual UNION ALL
        SELECT 'LUKL1', 'day-1' , 'A17', 'Incomplete' FROM dual UNION ALL
        SELECT 'LUKL1', 'day-2' , 'A16', 'Incomplete' FROM dual UNION ALL
        SELECT 'LUKL1', 'day-2' , 'A17', 'Incomplete' FROM dual UNION ALL
        SELECT 'LUKL1', 'day-3' , 'A18', 'Incomplete' FROM dual UNION ALL
        --
        SELECT 'EBC77', 'day-1' , 'A15', 'Incomplete' FROM dual UNION ALL
        SELECT 'EBC77', 'day-1' , 'A16', 'Incomplete' FROM dual UNION ALL
        SELECT 'EBC77', 'day-1' , 'A17', 'Incomplete' FROM dual UNION ALL
        SELECT 'EBC77', 'day-2' , 'A19', 'Incomplete' FROM dual UNION ALL
        SELECT 'EBC77', 'day-3' , 'A20', 'Incomplete' FROM dual UNION ALL
        SELECT 'EBC77', 'day-4' , 'A21', 'Incomplete' FROM dual UNION ALL
        SELECT 'EBC77', 'day-4' , 'A22', 'Incomplete' FROM dual UNION ALL
        SELECT 'EBC77', 'day-5' , 'A23', 'Incomplete' FROM dual UNION ALL
        SELECT 'EBC77', 'day-6' , 'A24', 'Incomplete' FROM dual UNION ALL
        SELECT 'EBC77', 'day-7' , 'A25', 'Incomplete' FROM dual UNION ALL
        SELECT 'EBC77', 'day-8' , 'A18', 'Incomplete' FROM dual
    ) 
    SELECT * FROM names;


INSERT INTO role (ROLE_ID, DESCRIPTION) 
    WITH names AS (
        SELECT 'TA', 'Tour Agent, stays in reception to help customer' FROM dual UNION ALL
        SELECT 'G', 'Guide, goes to tours' FROM dual UNION ALL
        SELECT 'MA', 'Manager, the main manager of the office' FROM dual UNION ALL
        SELECT 'DV', 'Driver, driver for the company' FROM dual UNION ALL
        SELECT 'IN', 'Intern, agent intern in the company' FROM dual
    ) 
    SELECT * FROM names;


INSERT INTO staff (STAFF_ID, FIRST_NAME, LAST_NAME, ADDRESS, PHONE_NO, ROLE_ID) 
    WITH names AS (
        SELECT 'S001', 'Rajat', 'Shrestha', 'Samakhushi, TownPlanning', '9182934234', 'G' FROM dual UNION ALL
        SELECT 'S002', 'Ashley', 'Green', 'Baluwatar', '9182343123', 'TA' FROM dual UNION ALL
        SELECT 'S003', 'Shia', 'Miton', 'patan', '9182323423', 'TA' FROM dual UNION ALL
        SELECT 'S004', 'Ramendra', 'Sharma', 'Gongabu', '9184322123', 'G' FROM dual UNION ALL
        SELECT 'S005', 'Silas', 'BK', 'Butwal', '9182931112', 'G' FROM dual UNION ALL
        SELECT 'S006', 'Rabin', 'Tamang', 'Sankhamul', '91323934234', 'G' FROM dual UNION ALL
        SELECT 'S007', 'Prabin', 'Maskey', 'Baluwatar', '9182343123', 'G' FROM dual UNION ALL
        SELECT 'S008', 'Pranish', 'Chettri', 'baneshwor', '9132323423', 'IN' FROM dual UNION ALL
        SELECT 'S009', 'Ramu', 'Sharma', 'Gongabu', '9184322123', 'G' FROM dual UNION ALL
        SELECT 'S010', 'Ganesh', 'KC', 'Birendranagar', '9182931112', 'MA' FROM dual
    ) 
    SELECT * FROM names;


INSERT INTO customer (CUSTOMER_ID, FIRST_NAME, LAST_NAME, ADDRESS, PHONE_NO) 
    WITH names AS (
        SELECT 'C001', 'Ramesh', 'Nakarmi', 'Samakhushi, TownPlanning', '9182934234' FROM dual UNION ALL
        SELECT 'C002', 'John', 'LeBron', 'Baluwatar', '9182343423'  FROM dual UNION ALL
        SELECT 'C003', 'Saran', 'Manandar', 'patan', '9182323433'  FROM dual UNION ALL
        SELECT 'C004', 'Susma', 'Shakya', 'Gongabu', '9184422123' FROM dual UNION ALL
        SELECT 'C005', 'Siliya', 'Malla', 'Butwal', '9182931111'  FROM dual UNION ALL
        SELECT 'C006', 'Shreyash', 'Subedi', 'Sankhamul', '91223934234' FROM dual UNION ALL
        SELECT 'C007', 'Bhuwan', 'Khanal', 'Baluwatar', '9382343123' FROM dual UNION ALL
        SELECT 'C008', 'Prashant', 'Budha', 'baneshwor', '9332323423' FROM dual UNION ALL
        SELECT 'C009', 'Gopal', 'KC', 'Gongabu', '9184323223' FROM dual UNION ALL
        SELECT 'C010', 'Naren', 'Bajracharya', 'Birendranagar', '9123931112'  FROM dual
    ) 
    SELECT * FROM names;

INSERT INTO customer_package (CUSTOMER_ID, PACKAGE_ID) 
    WITH names AS (
        SELECT 'C001', 'GAND8' FROM dual UNION ALL
        SELECT 'C002', 'EBC77' FROM dual UNION ALL
        SELECT 'C003', 'EBC77' FROM dual UNION ALL
        SELECT 'C004', 'EBC77' FROM dual UNION ALL
        SELECT 'C005', 'PUNH1' FROM dual UNION ALL
        SELECT 'C006', 'ABC21' FROM dual UNION ALL
        SELECT 'C007', 'PUNH1' FROM dual UNION ALL
        SELECT 'C008', 'ABC21' FROM dual UNION ALL
        SELECT 'C009', 'LUKL1' FROM dual UNION ALL
        SELECT 'C010', 'GAND8' FROM dual
    ) 
    SELECT * FROM names;

INSERT INTO package_guide (PACKAGE_ID, STAFF_ID) 
    WITH names AS (
        SELECT 'GAND8', 'S001' FROM dual UNION ALL
        SELECT 'ABC21', 'S004' FROM dual UNION ALL
        SELECT 'ABC21', 'S005' FROM dual UNION ALL
        SELECT 'PUNH1', 'S006' FROM dual UNION ALL
        SELECT 'EBC77', 'S007' FROM dual UNION ALL
        SELECT 'EBC77', 'S009' FROM dual
    ) 
    SELECT * FROM names;