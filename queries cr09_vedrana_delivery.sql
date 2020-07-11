use cr09_vedrana_delivery;


-- show info about the packages delivered by employee "Gordon" and weight more than 2kg
SELECT 
    cs.first_name AS 'Sender Name',
    cs.last_name AS 'Sender Surname',
    zs.zip_code AS 'Sender ZIP Code',
    cps.city_place AS 'Sender City',
    cr.first_name AS 'Receiver Name',
    cr.last_name AS 'Receiver Surname',
    zr.zip_code AS 'Reciever ZIP Code',
    cpr.city_place AS 'Reciever City',
    pa.package_weight_kg AS 'Package Weight',
    d.delivery_status AS 'Delivery Status'
FROM
    deliveries d
        INNER JOIN
    employees e ON e.id = d.employee_delivering_ID
        INNER JOIN
    package_entries pe ON d.package_entry_ID = pe.id
        INNER JOIN
    packages p ON p.id = pe.package_ID
        INNER JOIN
    customers cr ON cr.id = p.package_reciever
        INNER JOIN
    customers cs ON cs.id = p.package_sender
        INNER JOIN
    addresses ar ON ar.id = cr.address_ID
        INNER JOIN
    zip_codes zr ON zr.id = ar.zip_code_ID
        INNER JOIN
    addresses ase ON ase.id = cs.address_ID
        INNER JOIN
    zip_codes zs ON zs.id = ase.zip_code_ID
        INNER JOIN
    cities_places cps ON cps.id = zs.city_place_ID
        INNER JOIN
    cities_places cpr ON cpr.id = zr.city_place_ID
        INNER JOIN
    package_attributes pa ON pa.id = p.package_attributes_ID
WHERE
    e.first_name = 'Gordon'
        AND pa.package_weight_kg > 2




-- show all successfully completed deliveries
SELECT 
    cs.last_name AS 'Sender Surname',
    zs.zip_code AS 'Sender ZIP Code',
    cr.last_name AS 'Receiver Surname',
    zr.zip_code AS 'Reciever ZIP Code',
    e.last_name as 'Delivered by',
    d.ID as "Delivery ID",
    p.ID as "Package ID"
FROM
    deliveries d
        INNER JOIN
    employees e ON e.id = d.employee_delivering_ID
        INNER JOIN
    package_entries pe ON d.package_entry_ID = pe.id
        INNER JOIN
    packages p ON p.id = pe.package_ID
        INNER JOIN
    customers cr ON cr.id = p.package_reciever
        INNER JOIN
    customers cs ON cs.id = p.package_sender
        INNER JOIN
    addresses ar ON ar.id = cr.address_ID
        INNER JOIN
    zip_codes zr ON zr.id = ar.zip_code_ID
        INNER JOIN
    addresses ase ON ase.id = cs.address_ID
        INNER JOIN
    zip_codes zs ON zs.id = ase.zip_code_ID
WHERE
   d.delivery_status = 'delivered'




-- show number of packages recieved by entry address
SELECT 
    pl.id AS 'Location ID',
    a.street_name_and_number AS 'Package entry address',
    z.zip_code AS 'Zip code',
    cp.city_place AS 'City',
    COUNT(pe.package_ID) AS 'Number of packages processed'
FROM
    pickup_locations pl
        LEFT JOIN
    package_entries pe ON pe.pickup_location_ID = pl.id
        INNER JOIN
    addresses a ON a.ID = pl.address_ID
        INNER JOIN
    zip_codes z ON z.ID = a.zip_code_ID
        INNER JOIN
    cities_places cp ON cp.ID = z.city_place_ID
GROUP BY pl.id;




-- show packages with dimensions bigger than x
SELECT 
    p.id AS 'Package id',
    pa.height_mm AS 'height [mm]',
    pa.width_mm AS 'width [mm]',
    pa.length_mm AS 'lenght [mm]',
    pa.package_weight_kg AS 'weight [kg]'
FROM
    packages p
        INNER JOIN
    package_attributes pa ON pa.id = p.package_attributes_ID
WHERE
    pa.height_mm >= 60 AND pa.width_mm > 60
        AND pa.length_mm > 100
        AND pa.package_weight_kg >= 6; 




-- show packages sent from specific city
SELECT 
    p.id AS 'package id',
    c.last_name AS 'sender surname',
    c.first_name AS 'sender name'
FROM
    packages p
        INNER JOIN
    customers c ON c.id = p.package_sender
        INNER JOIN
    addresses a ON a.id = c.address_ID
        INNER JOIN
    zip_codes z ON z.id = a.zip_code_ID
        INNER JOIN
    cities_places cp ON cp.id = z.city_place_ID
WHERE
    cp.city_place = 'Vienna';




-- show packages with sender surname initial of "H"
SELECT 
    p.id AS 'Package ID',
    c.id AS 'Customer ID',
    c.last_name AS 'Sender Surname',
    c.first_name AS 'Sender Name'
FROM
    packages p
        INNER JOIN
    customers c ON c.id = p.package_sender
WHERE
    c.last_name LIKE 'H%';




--show packages with specific entry date
SELECT 
    pe.package_ID AS 'Package ID',
    cs.last_name AS 'Sender Surname',
    cr.last_name AS 'Receiver Surname',
    pe.entry_date AS 'Entry date'
FROM
    package_entries pe
        INNER JOIN
    packages p ON p.id = pe.package_ID
        INNER JOIN
    customers cr ON cr.id = p.package_reciever
        INNER JOIN
    customers cs ON cs.id = p.package_sender
WHERE
    pe.entry_date BETWEEN '2020-07-01' AND '2020-07-05';




-- show all packages that need to be picked up and their address
SELECT 
    c.first_name,
    c.last_name,
    a.street_name_and_number,
    zc.zip_code,
    pr.request_recieved
FROM
    pickup_requests pr
        INNER JOIN
    customers c ON c.ID = pr.customer_ID
        INNER JOIN
    pickup_locations pl ON pl.ID = pr.pickup_location_ID
        INNER JOIN
    addresses a ON pl.address_ID = a.id
        INNER JOIN
    zip_codes zc ON zc.ID = a.zip_code_ID
WHERE
    pickup_status = 'requested'



-- show all offices with special funciton and no send and recieve service
SELECT 
    po.office_name,
    po.office_type,
    a.street_name_and_number,
    z.zip_code,
    cp.city_place
FROM
    post_offices po
        INNER JOIN
    addresses a ON a.id = po.address_ID
        INNER JOIN
    zip_codes z ON z.id = a.zip_code_ID
    inner join
    cities_places cp on cp.id = z.city_place_ID
WHERE
    po.office_type <> 'Post office'




-- show how many rows are in the whole database
SELECT SUM(TABLE_ROWS)
   FROM INFORMATION_SCHEMA.TABLES
   WHERE TABLE_SCHEMA = 'cr09_vedrana_delivery';