-- Q1: Find all staff members who are active.
SELECT FirstName, LastName, EmailID 
FROM Staff 
WHERE Active = TRUE;

-- Q2: Find all sensors that are currently Faulty.
SELECT SensorID, Type 
FROM Sensor 
WHERE Status = 'Faulty';

-- Q3: List all Pending tasks and their due dates.
SELECT Type, Description, DueDate 
FROM Task 
WHERE Status = 'Pending' 
ORDER BY DueDate ASC;

-- Q4: Find the 20 youngest plants in the garden.
SELECT Age, PlantID, SpeciesID, Height, PlantGPS 
FROM Plant 
ORDER BY Age ASC 
LIMIT 20;

-- Q5: List all equipment that is Available and in New condition.
SELECT EquipmentID, EquipmentType 
FROM Equipment 
WHERE Availability = 'Available' AND EquipmentCondition = 'New';

-- Q6: Find all Fungal diseases that have been detected.
SELECT DiseaseID, PlantID, Intensity, DetectionDate 
FROM Disease 
WHERE Type = 'Fungal';

-- Q7: List all inventory items that are OutOfStock.
SELECT InventoryID, CategoryID, AddDate 
FROM Inventory 
WHERE AvailabilityStatus = 'OutOfStock';

-- Q8: Count the number of plants for each species.
SELECT s.SpeciesName, COUNT(p.PlantID) AS PlantCount 
FROM Species s 
JOIN Plant p ON s.SpeciesID = p.SpeciesID 
GROUP BY s.SpeciesName 
ORDER BY PlantCount DESC;

-- Q9: Extract the average salary for each staff role.
SELECT Role, AVG(Salary) AS AverageSalary 
FROM Staff 
GROUP BY Role;

-- Q10: Extract no. of sensors of each type.
SELECT Type, COUNT(SensorID) AS SensorCount 
FROM Sensor 
GROUP BY Type;

-- Q11: Calculate the total value of all Available inventory items.
SELECT SUM(TotalPrice) AS TotalAvailableValue 
FROM Inventory 
WHERE AvailabilityStatus = 'Available';

-- Q12: Calculate no. of plants there are in each area.
SELECT AreaID, COUNT(PlantID) AS NumberOfPlants 
FROM Plant_Area 
GROUP BY AreaID 
ORDER BY NumberOfPlants DESC;

-- Q13: Find the average temperature reading from all Temperature sensors which are in working condition.
SELECT AVG(LastReading) AS AverageTemperature 
FROM Sensor 
WHERE Type = 'Temperature' AND Status != 'Faulty';

-- Q14: Find the total rainfall recorded by each sensor.
SELECT SensorID, SUM(Rainfall) AS TotalRainfall 
FROM Weather 
GROUP BY SensorID 
ORDER BY TotalRainfall DESC;

-- Q15: List the names of staff members who are assigned more than 2 Pending tasks.
SELECT s.StaffID, s.FirstName, s.LastName, COUNT(t.TaskID) AS PendingTaskCount 
FROM Staff s 
JOIN Task t ON s.StaffID = t.StaffID 
WHERE t.Status = 'Pending' 
GROUP BY s.StaffID, s.FirstName, s.LastName 
HAVING COUNT(t.TaskID) > 2;

-- Q16: List all plants (PlantID) and their species name with Health Status.
SELECT p.PlantID, s.SpeciesName, s.Health_Status 
FROM Plant p 
JOIN Species s ON p.SpeciesID = s.SpeciesID;

-- Q17: Get the full name of all staff and the coordinates of the area they manage.
SELECT s.FirstName, s.LastName, s.Role, a.Coordinates 
FROM Staff s 
JOIN Area a ON s.AreaID = a.AreaID;

-- Q18: Find all tasks and the full name of the staff member assigned to them.
SELECT s.FirstName || ' ' || s.LastName, t.Description, t.Status 
FROM Task t 
JOIN Staff s ON t.StaffID = s.StaffID;

-- Q19: List all 'Damaged' equipment and its warranty information.
SELECT e.EquipmentID, e.EquipmentType, et.Warranty 
FROM Equipment e 
JOIN Equipment_Type et ON e.EquipmentType = et.EquipmentType 
WHERE e.EquipmentCondition = 'Damaged';

-- Q20: Find all plants that are currently 'Diseased' and show their species name.
SELECT p.PlantID, s.SpeciesName, p.Age 
FROM Plant p 
JOIN Species s ON p.SpeciesID = s.SpeciesID 
WHERE s.Health_Status = 'Diseased' 
ORDER BY p.Age DESC;

-- Q21: Get a list of all suppliers and their reliability rating, ordered by reliability.
SELECT Name, ContactInfo, ReliabilityRating, GSTNumber 
FROM Supplier 
ORDER BY ReliabilityRating DESC;

-- Q22: Fetch the soil type and pH level for Area 15.
SELECT sp.SoilType, sp.PHLevel, sp.NutrientContent, sp.MoistureLevel 
FROM Soil s 
JOIN SoilProperty sp ON s.SoilID = sp.SoilID 
WHERE s.AreaID = 15;

-- Q23: List all events, their type, and the management cost.
SELECT e.Title, e.Date, et.EventType, et.ManagementCost 
FROM Event e 
JOIN EventType et ON e.EventType = et.EventType 
ORDER BY e.Date DESC;

-- Q24: Find all staff members who have a 'Gardener' role and list their phone numbers.
SELECT s.FirstName, s.LastName, sp.Phone_No 
FROM Staff s 
JOIN Staff_Phone sp ON s.StaffID = sp.StaffID 
WHERE s.Role = 'Gardener';

-- Q25: Find total energy generation for each source type.
SELECT ed.SourceType, SUM(ed.EnergyGeneration) AS TotalGeneration 
FROM EnergyDetails ed 
GROUP BY ed.SourceType;

-- Q26: Find names and species of plants located in Area 20.
SELECT p.PlantID, s.SpeciesName, p.PlantGPS 
FROM Plant p 
JOIN Species s ON p.SpeciesID = s.SpeciesID 
JOIN Plant_Area pa ON p.PlantID = pa.PlantID 
WHERE pa.AreaID = 20;

-- Q27: List all Pending tasks, the equipment needed (and its type), and the staff member assigned.
SELECT t.Description AS Task, s.FirstName || ' ' || s.LastName AS StaffMember, e.EquipmentType, e.EquipmentCondition 
FROM Task t 
JOIN Staff s ON t.StaffID = s.StaffID 
JOIN Equipment e ON t.EquipmentID = e.EquipmentID 
WHERE t.Status = 'Pending';

-- Q28: Find all plants that are 'Untreated' for a disease, the disease type, and the recommended medicine.
SELECT p.PlantID, sp.SpeciesName, d.Type AS DiseaseType, d.Intensity, m.MedicineUsed, m.TreatmentCost 
FROM Disease d 
JOIN Plant p ON d.PlantID = p.PlantID 
JOIN Species sp ON p.SpeciesID = sp.SpeciesID 
JOIN Medicine m ON d.MedicineID = m.MedicineID 
WHERE d.Status = 'Untreated';

-- Q29: Show all staff members working in 'Gandhinagar'.
SELECT s.FirstName || ' ' || s.LastName as Full_Name, s.Role, s.Street, z.City, z.State 
FROM Staff s 
JOIN Staff_Add z ON s.Zip = z.Zip 
WHERE z.City = 'Gandhinagar';

-- Q30: Find all suppliers for 'Seeds' inventory items.
SELECT su.Name, su.ContactInfo 
FROM Supplier su 
JOIN Supplier_Inventory si ON su.SupplierID = si.SupplierID 
JOIN Inventory i ON si.InventoryID = i.InventoryID 
JOIN Category c ON i.CategoryID = c.CategoryID 
WHERE c.CategoryName = 'Seeds';

-- Q31: List all staff who attended the 'Rabi Crop Fest' event.
SELECT s.FirstName, s.LastName, s.Role, e.EventType 
FROM Staff s 
JOIN Event_Staff es ON s.StaffID = es.StaffID 
JOIN Event e ON es.EventID = e.EventID 
WHERE e.Title = 'Rabi Crop Fest';

-- Q32: What is the average energy efficiency of Solar panels in areas with Clay soil?
SELECT AVG(ed.Efficiency) AS AvgSolarEfficiency 
FROM EnergyDetails ed 
JOIN Area a ON ed.AreaID = a.AreaID 
JOIN Soil s ON a.AreaID = s.AreaID 
JOIN SoilProperty sp ON s.SoilID = sp.SoilID 
WHERE ed.SourceType = 'Solar' AND sp.SoilType = 'Clay';

-- Q33: Get a complete report of all watering events: Staff name, Area coordinates, Water Source, and Volume.
SELECT we.WEventID, s.FirstName || ' ' || s.LastName AS Staff_Member, a.Coordinates, wt.Source AS Water_Source, wt.Method AS IrrigationMethod, we.Volume 
FROM WaterEvent we 
JOIN Staff s ON we.StaffID = s.StaffID 
JOIN Area a ON we.AreaID = a.AreaID 
JOIN WaterType wt ON we.WaterTypeID = wt.WaterTypeID;

-- Q34: Find all staff members who are not assigned to any task.
SELECT FirstName, LastName, Role 
FROM Staff 
WHERE StaffID NOT IN (SELECT StaffID FROM Task);

-- Q35: List the plants (and their species) that have a 'Faulty' sensor.
SELECT p.PlantID, s.SpeciesName 
FROM Plant p 
JOIN Species s ON p.SpeciesID = s.SpeciesID 
WHERE p.SensorID IN (SELECT SensorID FROM Sensor WHERE Status = 'Faulty');

-- Q36: Find the staff members with the highest salary.
SELECT FirstName, LastName, Role, Salary 
FROM Staff 
WHERE Salary = (SELECT MAX(Salary) FROM Staff);

-- Q37: List all species that are at Harvest stage AND have at least one plant in the garden.
SELECT SpeciesName 
FROM Species 
WHERE GrowthStage = 'Harvest' AND SpeciesID IN (SELECT DISTINCT SpeciesID FROM Plant);

-- Q38: Find all equipment that has never been used in a task.
SELECT EquipmentID, EquipmentType 
FROM Equipment 
WHERE EquipmentID NOT IN (SELECT EquipmentID FROM Task);

-- Q39: List all areas that have more than 3 plants associated with them.
SELECT a.AreaID, a.Coordinates, p.PlantCount 
FROM Area a 
JOIN (SELECT AreaID, COUNT(PlantID) AS PlantCount FROM Plant_Area GROUP BY AreaID) p ON a.AreaID = p.AreaID 
WHERE p.PlantCount > 3;

-- Q40: Find all plants whose Light sensor reading is below the average Light reading of all Active light sensors.
SELECT p.PlantID, s.SpeciesName, sen.LastReading AS CurrentLight 
FROM Plant p 
JOIN Species s ON p.SpeciesID = s.SpeciesID 
JOIN Sensor sen ON p.SensorID = sen.SensorID 
WHERE sen.Type = 'Light' AND sen.LastReading < (SELECT AVG(LastReading) FROM Sensor WHERE Type = 'Light' AND Status = 'Active');