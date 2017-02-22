--
-- Baza danych: spoldzielnia
--

----------------------------------------------------------


INSERT INTO userrole (id, role) VALUES (1, 'ROLE_ADMIN'), (2, 'ROLE_USER');

--
-- Zrzut danych tabeli building
--

INSERT INTO building (id, number, street) VALUES (nextval('serialBuildingSequence'), 2, 'Sienkiewicza'),(nextval('serialBuildingSequence'),  6, 'Kiliñskiego'), (nextval('serialBuildingSequence'),  12, '¯eromskiego');

--
-- Zrzut danych tabeli apartment
--

INSERT INTO apartment (id, apartmentnumber, building_id) VALUES (nextval('serialApartmentSequence'), '1', 1), (nextval('serialApartmentSequence'),  '2', 1), (nextval('serialApartmentSequence'),  '3', 1), (nextval('serialApartmentSequence'),  '4', 1), (nextval('serialApartmentSequence'),  '5', 1), (nextval('serialApartmentSequence'),  '6', 1), (nextval('serialApartmentSequence'),  '7', 1), (nextval('serialApartmentSequence'),  '8', 1), (nextval('serialApartmentSequence'),  '9', 1), (nextval('serialApartmentSequence'),  '10', 1);
INSERT INTO apartment (id, apartmentnumber, building_id) VALUES (nextval('serialApartmentSequence'), '31', 2), (nextval('serialApartmentSequence'),  '32', 2), (nextval('serialApartmentSequence'),  '33', 2), (nextval('serialApartmentSequence'),  '34', 2), (nextval('serialApartmentSequence'),  '35', 2), (nextval('serialApartmentSequence'),  '36', 2), (nextval('serialApartmentSequence'),  '37', 2), (nextval('serialApartmentSequence'),  '38', 2), (nextval('serialApartmentSequence'),  '39', 2), (nextval('serialApartmentSequence'),  '40', 2);
INSERT INTO apartment (id, apartmentnumber, building_id) VALUES (nextval('serialApartmentSequence'), '71', 3), (nextval('serialApartmentSequence'),  '72', 3), (nextval('serialApartmentSequence'),  '73', 3), (nextval('serialApartmentSequence'),  '74', 3), (nextval('serialApartmentSequence'),  '75', 3), (nextval('serialApartmentSequence'),  '76', 3), (nextval('serialApartmentSequence'),  '77', 3), (nextval('serialApartmentSequence'),  '78', 3), (nextval('serialApartmentSequence'),  '79', 3), (nextval('serialApartmentSequence'),  '80', 3);

--
-- Zrzut danych tabeli chargesamount
--

INSERT INTO chargesamount (id, electricityAmount, hotWaterAmount, coldWaterAmount, gasAmount) VALUES (nextval('serialChargesAmountSequence'), 1, 1, 1, 1),(nextval('serialChargesAmountSequence'), 2, 2, 2, 2),(nextval('serialChargesAmountSequence'), 3, 3, 3, 3),(nextval('serialChargesAmountSequence'), 4, 4, 4, 4),(nextval('serialChargesAmountSequence'), 5, 5, 5, 5);

--
-- Zrzut danych tabeli user
--

INSERT INTO "user" (id, email, firstname, lastname, login, password, telephone, amountOfLocators, enabled, apartment_id, building_id) VALUES (nextval('serialUserSequence'), 'admin@o2.pl', '£ukasz', 'Franczyk', 'admin', '$2a$10$WDp4M8Btv1ufVovLIj5fxuotehJlYAGdkk6rTO4fqALdvSXn4MFui', '530-605-150',1,TRUE, 1, 1); 
INSERT INTO "user" (id, email, firstname, lastname, login, password, telephone, amountOfLocators, enabled, apartment_id, building_id, chargesamount_id) VALUES (nextval('serialUserSequence'), 'uzytkownik1@o2.pl', 'Adam', 'Kwiatkowski', 'user', '$2a$10$QSyb1nMkEtMiLqfgjJCy8.SJ3TZlKBiN.yCjFbRDsRBo5Z5rfCh46', '530-605-151',1,TRUE, 8, 1, 2); 
INSERT INTO "user" (id, email, firstname, lastname, login, password, telephone, amountOfLocators, enabled, apartment_id, building_id, chargesamount_id) VALUES (nextval('serialUserSequence'), 'uzytkownik2@o2.pl', 'Pawe³', '£ukasiewicz', 'user1', '$2a$10$QSyb1nMkEtMiLqfgjJCy8.SJ3TZlKBiN.yCjFbRDsRBo5Z5rfCh46', '530-605-152',2,TRUE, 12, 2, 3);
INSERT INTO "user" (id, email, firstname, lastname, login, password, telephone, amountOfLocators, enabled, apartment_id, building_id, chargesamount_id) VALUES (nextval('serialUserSequence'), 'uzytkownik3@o2.pl', 'Izabela', 'Stawowczyk', 'user2', '$2a$10$QSyb1nMkEtMiLqfgjJCy8.SJ3TZlKBiN.yCjFbRDsRBo5Z5rfCh46', '530-605-153',3,TRUE, 16, 2, 4);
INSERT INTO "user" (id, email, firstname, lastname, login, password, telephone, amountOfLocators, enabled, apartment_id, building_id, chargesamount_id) VALUES (nextval('serialUserSequence'), 'uzytkownik4@o2.pl', 'Micha³', 'W¹s', 'user3', '$2a$10$QSyb1nMkEtMiLqfgjJCy8.SJ3TZlKBiN.yCjFbRDsRBo5Z5rfCh46', '530-605-154',4,TRUE, 24, 3, 5);

--
-- Zrzut danych tabeli user_userrole
--

INSERT INTO user_userrole (user_id, userRole_id) VALUES (1, 1), (2, 2), (3, 2), (4, 2), (5, 2);

--
-- Zrzut danych tabeli chargesprice
--

INSERT INTO chargesprice (id, electricityPrice, hotWaterPrice, coldWaterPrice, gasPrice, garbagePrice, heatingPrice, sewagePrice, repairFundPrice) VALUES (1, 1, 1, 1, 1, 1, 1, 1, 1);





