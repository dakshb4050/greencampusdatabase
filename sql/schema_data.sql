INSERT INTO Sensor (SensorID, Type, DataType, LastReading, Status) VALUES
(1, 'Temperature', 'Celsius', 32.5, 'Active'),
(2, 'Soil Moisture', 'Percentage', 45.0, 'Active'),
(3, 'Light', 'Lux', 1200.5, 'Faulty'),
(4, 'pH', 'Scale', 6.5, 'Active'),
(5, 'Humidity', 'Percentage', 60.2, 'Active'),
(6, 'Temperature', 'Celsius', 31.0, 'Active'),
(7, 'Soil Moisture', 'Percentage', 38.5, 'Inactive'),
(8, 'Light', 'Lux', 950.0, 'Active');

INSERT INTO Species (SpeciesID, SpeciesName, GrowthStage, Health_Status) VALUES
(1, 'Azadirachta indica (Neem)', 'Mature', 'Healthy'),
(2, 'Ocimum tenuiflorum (Tulsi)', 'Vegetative', 'Healthy'),
(3, 'Ficus religiosa (Peepal)', 'Seedling', 'Diseased'),
(4, 'Mangifera indica (Mango)', 'Flowering', 'Healthy'),
(5, 'Rosa (Rose)', 'Harvest', 'Diseased');

INSERT INTO Area (AreaID, AreaSize, Coordinates) VALUES
(1, 150.50, '23.2156° N, 72.6369° E'),
(2, 200.00, '23.2160° N, 72.6375° E'),
(3, 120.75, '23.2145° N, 72.6350° E'),
(4, 300.00, '23.2170° N, 72.6380° E'),
(5, 50.00, '23.2185° N, 72.6395° E');

INSERT INTO Staff_Add (Zip, City, State) VALUES
('382007', 'Gandhinagar', 'Gujarat'),
('395007', 'Surat', 'Gujarat'),
('380009', 'Ahmedabad', 'Gujarat'),
('390001', 'Vadodara', 'Gujarat'),
('360005', 'Rajkot', 'Gujarat');

INSERT INTO Equipment_Type (EquipmentType, Cost, Warranty) VALUES
('Lawn Mower', 15000.00, 24),
('Sprinkler System', 5000.00, 12),
('Pruning Shears', 1200.00, 6),
('Wheelbarrow', 3500.00, 12),
('Trowel', 500.00, 0);

INSERT INTO Task_Priority (Type, Priority) VALUES
('Routine', 5),
('Urgent', 9),
('Low', 2),
('Critical', 10),
('Medium', 7);

INSERT INTO Category (CategoryID, CategoryName, Storage_Location) VALUES
(1, 'Seeds', 'Warehouse A'),
(2, 'Fertilizers', 'Shed B'),
(3, 'Pesticides', 'Secure Cabinet 1'),
(4, 'Tools', 'Shed A'),
(5, 'Pots', 'Open Yard');

INSERT INTO Medicine (MedicineID, MedicineUsed, TreatmentCost) VALUES
(1, 'Neem Oil Extract', 450.00),
(2, 'Copper Fungicide', 850.00),
(3, 'Insecticidal Soap', 300.00),
(4, 'Root Hormone', 600.00),
(5, 'Organic Compost', 150.00);

INSERT INTO Supplier (SupplierID, Name, ContactInfo, ReliabilityRating, GSTNumber) VALUES
(1, 'AgriCorp Gujarat', '9876543210', 8.5, '24AAAAA1234A1Z1'),
(2, 'GreenCampus Solutions', '9988776655', 9.2, '24BBBBB5678B2Z2'),
(3, 'Surat Seed Vault', '9123123123', 7.5, '24CCCCC9012C3Z3'),
(4, 'EcoTools India', '9988998899', 9.5, '24DDDDD3456D4Z4'),
(5, 'BotanicCare Providers', '9765432109', 6.8, '24EEEEE7890E5Z5');

INSERT INTO EventType (EventType, ManagementCost) VALUES
('Rabi Crop Fest', 50000.00),
('Tree Plantation Drive', 15000.00),
('Organic Farming Workshop', 25000.00),
('Flora Exhibition', 75000.00),
('Campus Cleanup', 5000.00);

INSERT INTO EnergySource (SourceType, MaintenanceCost) VALUES
('Solar', 2500.00),
('Grid', 500.00),
('Wind', 3500.00),
('Biomass', 1500.00);

INSERT INTO WaterType (WaterTypeID, Source, Method) VALUES
(1, 'Borewell', 'Drip Irrigation'),
(2, 'Rainwater Harvesting', 'Sprinkler'),
(3, 'Municipal Supply', 'Hose'),
(4, 'Recycled Water', 'Drip Irrigation');

-- 2.2 First-Level Dependent Tables
INSERT INTO Plant (PlantID, SensorID, SpeciesID, PlantGPS, QRCode, Age, Height) VALUES
(1, 1, 1, '23.2157° N, 72.6370° E', 'QR-NEEM-001', 36, 450.50),
(2, 2, 2, '23.2158° N, 72.6371° E', 'QR-TULSI-002', 6, 45.00),
(3, 3, 3, '23.2159° N, 72.6372° E', 'QR-PEEPAL-003', 2, 15.50),
(4, 4, 4, '23.2161° N, 72.6373° E', 'QR-MANGO-004', 48, 520.00),
(5, 5, 5, '23.2162° N, 72.6374° E', 'QR-ROSE-005', 12, 60.00),
(6, 6, 1, '23.2146° N, 72.6351° E', 'QR-NEEM-006', 40, 500.00),
(7, 7, 2, '23.2171° N, 72.6381° E', 'QR-TULSI-007', 8, 55.00),
(8, 8, 4, '23.2186° N, 72.6396° E', 'QR-MANGO-008', 24, 310.00);

INSERT INTO Staff (StaffID, AreaID, FirstName, LastName, Role, Shift, EmailID, Street, Zip, Salary, DateOfJoining, Experience, Active, PerformanceRating) VALUES
(1, 1, 'Daksh', 'Kalathiya', 'Database Admin', 'Morning', '202403063@dau.ac.in', 'Campus Quarters', '382007', 35000.00, '2024-08-01', 2, TRUE, 9.5),
(2, 2, 'Ved', 'Patel', 'Gardener', 'Morning', 'ved.p@dau.ac.in', 'Sector 8', '382007', 25000.00, '2024-06-15', 3, TRUE, 8.5),
(3, 3, 'Amit', 'Sharma', 'Supervisor', 'Evening', 'amit.s@dau.ac.in', 'University Road', '395007', 45000.00, '2023-01-10', 6, TRUE, 9.1),
(4, 4, 'Rahul', 'Desai', 'Technician', 'Night', 'rahul.d@dau.ac.in', 'Ring Road', '380009', 30000.00, '2025-03-20', 4, TRUE, 7.8),
(5, 5, 'Priya', 'Singh', 'Botanist', 'Morning', 'priya.s@dau.ac.in', 'Green Avenue', '390001', 55000.00, '2022-11-05', 8, FALSE, 9.8);

INSERT INTO Soil (SoilID, AreaID, SensorID) VALUES
(1, 1, 2),
(2, 2, 7),
(3, 3, 4),
(4, 4, 2),
(5, 5, 7);

INSERT INTO Weather (WeatherID, SensorID, ReadingDate, Temperature, Humidity, Rainfall, Windspeed, AirQuality) VALUES
(1, 1, '2026-08-18', 32.5, 65.0, 0.0, 12.5, 45.0),
(2, 6, '2026-08-18', 31.0, 60.0, 5.2, 15.0, 50.0),
(3, 1, '2026-08-19', 33.2, 62.5, 0.0, 10.0, 42.5),
(4, 6, '2026-08-19', 30.5, 58.0, 12.4, 18.2, 35.0),
(5, 5, '2026-08-19', 29.0, 75.0, 25.0, 8.5, 30.0);

-- 2.3 Second-Level Dependent Tables
INSERT INTO Plant_Area (AreaID, PlantID) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(5, 8);

INSERT INTO Staff_Phone (StaffID, Phone_No) VALUES
(1, '9123456780'),
(2, '9876543211'),
(3, '9988776655'),
(4, '9765432100'),
(5, '9456123789');

INSERT INTO SoilProperty (SoilID, SoilType, PHLevel, NutrientContent, MoistureLevel, AVG_Temperature) VALUES
(1, 'Clay', 6.5, 'High Nitrogen, Medium Phosphorus', 45.0, 28.5),
(2, 'Loamy', 7.2, 'Balanced', 35.5, 30.0),
(3, 'Sandy', 5.8, 'Low Nitrogen', 15.0, 32.5),
(4, 'Silty', 6.8, 'High Potassium', 40.2, 27.0),
(5, 'Peaty', 5.5, 'High Organic Matter', 60.0, 25.5);

INSERT INTO Equipment (EquipmentID, StaffID, EquipmentType, Availability, EquipmentCondition, PurchaseDate) VALUES
(1, 2, 'Lawn Mower', 'Available', 'Good', '2025-05-20'),
(2, 3, 'Sprinkler System', 'Unavailable', 'Damaged', '2024-11-10'),
(3, 4, 'Pruning Shears', 'Available', 'New', '2026-01-15'),
(4, 2, 'Wheelbarrow', 'Available', 'Good', '2023-08-22'),
(5, 1, 'Trowel', 'Available', 'New', '2026-06-10');

INSERT INTO Inventory (InventoryID, StaffID, CategoryID, Stock, AddDate, ExpiryDate, TotalPrice, AvailabilityStatus) VALUES
(1, 2, 1, 500, '2026-01-15', '2027-01-15', 2500.00, 'Available'),
(2, 3, 2, 0, '2025-12-01', '2026-06-01', 4000.00, 'OutOfStock'),
(3, 4, 3, 150, '2026-05-10', '2028-05-10', 8500.00, 'Available'),
(4, 2, 4, 25, '2024-02-20', NULL, 12500.00, 'Available'),
(5, 1, 5, 10, '2026-07-01', NULL, 1000.00, 'Available');

INSERT INTO Disease (DiseaseID, PlantID, MedicineID, Type, Intensity, DetectionDate, Status) VALUES
(1, 1, 1, 'Fungal', 'Low', '2026-08-01', 'Treated'),
(2, 3, 2, 'Bacterial', 'High', '2026-08-15', 'Untreated'),
(3, 5, 3, 'Pest', 'Medium', '2026-08-10', 'Untreated'),
(4, 2, 1, 'Fungal', 'Low', '2026-07-20', 'Treated'),
(5, 8, 4, 'Root Rot', 'High', '2026-08-18', 'Untreated');

INSERT INTO Event (EventID, AreaID, EventType, Title, Date, Mode) VALUES
(1, 1, 'Rabi Crop Fest', 'Winter Harvest Celebration', '2026-11-20', 'Offline'),
(2, 2, 'Tree Plantation Drive', 'Green Campus Initiative', '2026-09-05', 'Offline'),
(3, 3, 'Organic Farming Workshop', 'Sustainable Methods', '2026-10-15', 'Online'),
(4, 4, 'Flora Exhibition', 'Rare Species Showcase', '2027-01-10', 'Offline'),
(5, 5, 'Campus Cleanup', 'Monsoon Maintenance', '2026-08-25', 'Offline');

INSERT INTO Energy (EnergyID, StaffID) VALUES
(1, 4),
(2, 3),
(3, 2),
(4, 1),
(5, 4);

-- 2.4 Third-Level Dependent Tables
INSERT INTO Task (TaskID, StaffID, EquipmentID, Type, DueDate, Status, Description) VALUES
(1, 2, 1, 'Routine', '2026-08-20', 'Pending', 'Mow Area 1 main lawn'),
(2, 3, 2, 'Urgent', '2026-08-19', 'Delayed', 'Fix broken sprinkler system in Area 2'),
(3, 4, 3, 'Medium', '2026-08-22', 'Pending', 'Prune overgrown bushes in Area 3'),
(4, 2, 4, 'Routine', '2026-08-18', 'Completed', 'Transport soil to Area 4'),
(5, 1, 5, 'Low', '2026-08-25', 'Pending', 'Database audit and sensor check');

INSERT INTO Supplier_Inventory (SupplierID, InventoryID, EquipmentID, Type, PaymentMode) VALUES
(1, 1, NULL, 'Inventory', 'Online'),
(2, NULL, 1, 'Equipment', 'Credit'),
(3, 2, NULL, 'Inventory', 'Cash'),
(4, NULL, 3, 'Equipment', 'Online'),
(5, 3, NULL, 'Inventory', 'Credit');

INSERT INTO Event_Staff (EventID, StaffID) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 4),
(4, 1),
(4, 5),
(5, 1),
(5, 2),
(5, 3);

INSERT INTO EnergyDetails (EnergyID, AreaID, SensorID, SourceType, Consumption, EnergyGeneration, Efficiency) VALUES
(1, 1, 3, 'Solar', 150.50, 450.00, 85.5),
(2, 2, 1, 'Grid', 300.00, 0.00, 95.0),
(3, 3, 8, 'Solar', 120.00, 380.00, 82.0),
(4, 4, 6, 'Wind', 200.00, 600.00, 75.5),
(5, 5, 2, 'Biomass', 50.00, 100.00, 60.0);

INSERT INTO WaterEvent (WEventID, AreaID, StaffID, SensorID, WaterTypeID, Volume) VALUES
(1, 1, 2, 2, 1, 1500.00),
(2, 2, 3, 1, 2, 2000.00),
(3, 3, 4, 4, 3, 500.00),
(4, 4, 2, 2, 1, 3000.00);
