use cr09_vedrana_delivery;

insert into countries
values
(null, "Austria", "AT"),
(null, "Bosnia and Herzegowina", "BA"),
(null, "Croatia", "HR"),
(null, "Denmark", "DK"),
(null, "Estonia", "EE"),
(null, "France", "FR"),
(null, "Germany", "DE"),
(null, "Hungary", "HU"),
(null, "Irland", "IE"),
(null, "Japan", "JP"),
(null, "Korea", "KR"),
(null, "Latvia", "LV"),
(null, "Madagascar", "MG"),
(null, "Nepal", "NP"),
(null, "Oman", "OM"),
(null, "Portugal", "PT"),
(null, "Qatar", "QA"),
(null, "Russia", "RU"),
(null, "Serbia", "RS"),
(null, "Thailand", "TH"),
(null, "Ukraine", "UA"),
(null, "Vatican", "VA"),
(null, "Wallis and Futuna", "WF"),
(null, "Yemen", "YE"),
(null, "Zimbabwe", "ZW")
;

insert into cities_places
values
(null, "Vienna", 1),
(null, "Sankt Pölten", 1),
(null, "Linz", 1),
(null, "Salzburg", 1),
(null, "Innsbruck", 1),
(null, "Eisenstadt", 1),
(null, "Graz", 1),
(null, "Klagenfurt", 1),
(null, "Sarajevo", 2),
(null, "Zagreb", 3),
(null, "Copenhagen", 4),
(null, "Tallinn", 5),
(null, "Paris", 6),
(null, "Berlin", 7)
;

insert into zip_codes
values
(null, 1010, 1),
(null, 1020, 1),
(null, 1030, 1),
(null, 1040, 1),
(null, 1050, 1),
(null, 1060, 1),
(null, 1070, 1),
(null, 1080, 1),
(null, 1090, 1),
(null, 1100, 1),
(null, 1110, 1),
(null, 1120, 1),
(null, 1130, 1),
(null, 1140, 1),
(null, 1150, 1),
(null, 1160, 1),
(null, 1170, 1),
(null, 1180, 1),
(null, 1190, 1),
(null, 1200, 1),
(null, 1210, 1),
(null, 1220, 1),
(null, 1230, 1),
(null, 3100, 2),
(null, 3104, 2),
(null, 3105, 2),
(null, 3140, 2),
(null, 4020, 3),
(null, 4024, 3),
(null, 4030, 3),
(null, 5020, 4),
(null, 5026, 4),
(null, 5071, 4),
(null, 6020, 5),
(null, 6063, 5),
(null, 6072, 5),
(null, 7000, 6),
(null, 7051, 6),
(null, 8010, 7),
(null, 8036, 7),
(null, 8042, 7),
(null, 9010, 8),
(null, 9020, 8),
(null, 9061, 8),
(null, 71000, 9),
(null, 75000, 13),
(null, 10115, 14)
;

insert into addresses
values
(null, "Kärntner Straße 10", 1),
(null, "Praterstraße 115", 2),
(null, "Landstraßer Hauptstraße 35", 3),
(null, "Baumgasse 12", 3),
(null, "Neulinggasse 84", 3),
(null, "Ungargasse 9", 3),
(null, "Himmelpfortgasse 24", 1),
(null, "Wassergasse 11", 3),
(null, "Rochusgasse 50", 3),
(null, "Sechskrügelgasse 82", 3),
(null, "Berliner Straße 20", 47),
(null, "Pariser Straße 100", 46),
(null, "Obala Kulina Bana 50", 45)
;

insert into post_offices
values
(null, 1),
(null, 2),
(null, 3)
;

insert into pickup_locations
values
(null, 4, 3),
(null, 5, 3),
(null, 6, 3),
(null, 7, 1),
(null, 1, 1),
(null, 2, 2),
(null, 3, 3)
;

insert into employees_positions
values
(null, "Customer service"),
(null, "Package processing and sorting"),
(null, "Delivery")
;

insert into employees
values
(null, "Henry", "Chinaski", 1),
(null, "Jamie", "Hope", 2),
(null, "Gordon", "Krantz", 3),
(null, "Schmordon", "Schmrantz", 3)
;

insert into customers
values
(null, "Willie", "Lumpkin", 8),
(null, "Mary", "Hope", 9),
(null, "Carl", "Smith", 10),
(null, "Max", "Mustermann", 11),
(null, "Andre", "Martin", 12),
(null, "Osman", "Osmanovic", 13),
(null, "Max", "Hueber", 7),
(null, "Moritz", "Grueber", 6)
;

insert into package_attributes
values
(null, 5, 162, 235, 0.01),
(null, 600, 600, 1000, 6),
(null, 100, 600, 1000, 60.3),
(null, 30, 250, 353, 3.2),
(null, 35, 162, 235, 2),
(null, 60, 800, 400, 4)
;

insert into packages 
values
(null, 1, 1, 4, 1.5),
(null, 2, 2, 5, 24.3),
(null, 3, 3, 6, 542.8),
(null, 4, 7, 8, 1.8),
(null, 5, 7, 6, 2.4),
(null, 6, 7, 5, 1.2)
;

insert into package_entries
values
(null, "2020-07-10", 1, 1, 2),
(null, "2020-07-05", 2, 2, 2),
(null, "2020-07-05", 3, 3, 2),
(null, "2020-07-04", 4, 3, 2),
(null, "2020-07-01", 5, 4, 2),
(null, "2020-07-01", 6, 2, 2)
;

insert into deliveries
values
(null, "2020-07-10 08:00", null, "in progress", 1, 3),
(null, "2020-07-06 08:00", "2020-07-06 16:35", "delivered", 2, 3),
(null, "2020-07-06 08:00", null, "delivery failed, return to sender", 3, 3),
(null, "2020-07-05 08:00", "2020-07-05 10:00", "delivered", 4, 4),
(null, "2020-07-02 08:00", "2020-07-02 14:00", "in progress", 5, 3),
(null, "2020-07-01 08:00", "2020-07-01 13:00", "delivered", 6, 4)
;



