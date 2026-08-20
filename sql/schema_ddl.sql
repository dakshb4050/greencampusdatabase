CREATE TABLE Sensor (
    SensorID INT PRIMARY KEY,
    Type VARCHAR(50) NOT NULL CHECK (Type IN ('Temperature', 'Humidity', 'Soil Moisture', 'Light', 'pH')),
    DataType VARCHAR(50) NOT NULL,
    LastReading DECIMAL(6,2),
    Status VARCHAR(20) CHECK (Status IN ('Active', 'Inactive', 'Faulty'))
);

CREATE TABLE Species (
    SpeciesID INT PRIMARY KEY,
    SpeciesName VARCHAR(100) NOT NULL,
    GrowthStage VARCHAR(50) CHECK (GrowthStage IN ('Seedling', 'Vegetative', 'Flowering', 'Mature', 'Harvest')),
    Health_Status VARCHAR(50) CHECK (Health_Status IN ('Healthy', 'Diseased'))
);

CREATE TABLE Plant (
    PlantID INT PRIMARY KEY,
    SensorID INT,
    SpeciesID INT NOT NULL,
    PlantGPS VARCHAR(50) NOT NULL,
    QRCode VARCHAR(100) UNIQUE,
    Age INT CHECK (Age >= 0),
    Height DECIMAL(5,2) CHECK (Height >= 0),
    FOREIGN KEY (SpeciesID) REFERENCES Species (SpeciesID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (SensorID) REFERENCES Sensor (SensorID) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE Area (
    AreaID INT PRIMARY KEY,
    AreaSize DECIMAL(7,2) NOT NULL CHECK (AreaSize > 0),
    Coordinates VARCHAR(100) NOT NULL
);

CREATE TABLE Plant_Area (
    AreaID INT NOT NULL,
    PlantID INT NOT NULL,
    PRIMARY KEY (AreaID, PlantID),
    FOREIGN KEY (AreaID) REFERENCES Area (AreaID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (PlantID) REFERENCES Plant (PlantID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Staff_Add (
    Zip CHAR(6) PRIMARY KEY,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL
);

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    AreaID INT NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Role VARCHAR(50) NOT NULL,
    Shift VARCHAR(20) NOT NULL CHECK (Shift IN ('Morning', 'Evening', 'Night')),
    EmailID VARCHAR(100) UNIQUE NOT NULL,
    Street VARCHAR(100) NOT NULL,
    Zip CHAR(6) NOT NULL,
    Salary DECIMAL(10,2) CHECK (Salary >= 0),
    DateOfJoining DATE NOT NULL,
    Experience INT CHECK (Experience >= 0),
    Active BOOLEAN DEFAULT TRUE,
    PerformanceRating DECIMAL(3,2) CHECK (PerformanceRating >= 0 AND PerformanceRating <= 10),
    FOREIGN KEY (AreaID) REFERENCES Area (AreaID) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (Zip) REFERENCES Staff_Add (Zip) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Staff_Phone (
    StaffID INT NOT NULL,
    Phone_No VARCHAR(15) NOT NULL,
    PRIMARY KEY (StaffID, Phone_No),
    FOREIGN KEY (StaffID) REFERENCES Staff (StaffID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Soil (
    SoilID INT PRIMARY KEY,
    AreaID INT NOT NULL,
    SensorID INT NOT NULL,
    FOREIGN KEY (AreaID) REFERENCES Area (AreaID) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (SensorID) REFERENCES Sensor (SensorID) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE SoilProperty (
    SoilID INT PRIMARY KEY,
    SoilType VARCHAR(50) NOT NULL CHECK (SoilType IN ('Clay', 'Sandy', 'Silty', 'Peaty', 'Chalky', 'Loamy')),
    PHLevel DECIMAL(3,2) CHECK (PHLevel >= 0 AND PHLevel <= 14),
    NutrientContent VARCHAR(100),
    MoistureLevel DECIMAL(5,2) CHECK (MoistureLevel >= 0),
    AVG_Temperature DECIMAL(5,2),
    FOREIGN KEY (SoilID) REFERENCES Soil (SoilID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Weather (
    WeatherID INT PRIMARY KEY,
    SensorID INT NOT NULL,
    ReadingDate DATE NOT NULL,
    Temperature DECIMAL(5,2),
    Humidity DECIMAL(5,2),
    Rainfall DECIMAL(5,2) CHECK (Rainfall >= 0),
    Windspeed DECIMAL(5,2) CHECK (Windspeed >= 0),
    AirQuality DECIMAL(5,2) CHECK (AirQuality >= 0),
    FOREIGN KEY (SensorID) REFERENCES Sensor (SensorID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Equipment_Type (
    EquipmentType VARCHAR(50) PRIMARY KEY,
    Cost DECIMAL(10,2) CHECK (Cost >= 0),
    Warranty INT CHECK (Warranty >= 0)
);

CREATE TABLE Equipment (
    EquipmentID INT PRIMARY KEY,
    StaffID INT NOT NULL,
    EquipmentType VARCHAR(50) NOT NULL,
    Availability VARCHAR(20) NOT NULL CHECK (Availability IN ('Available', 'Unavailable')),
    EquipmentCondition VARCHAR(20) NOT NULL CHECK (EquipmentCondition IN ('New', 'Good', 'Damaged')),
    PurchaseDate DATE NOT NULL,
    FOREIGN KEY (StaffID) REFERENCES Staff (StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (EquipmentType) REFERENCES Equipment_Type (EquipmentType) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Task_Priority (
    Type VARCHAR(50) PRIMARY KEY,
    Priority INT NOT NULL CHECK (Priority BETWEEN 1 AND 10)
);

CREATE TABLE Task (
    TaskID INT PRIMARY KEY,
    StaffID INT NOT NULL,
    EquipmentID INT NOT NULL,
    Type VARCHAR(50) NOT NULL,
    DueDate DATE NOT NULL,
    Status VARCHAR(20) NOT NULL CHECK (Status IN ('Pending', 'Completed', 'Delayed')),
    Description VARCHAR(255),
    FOREIGN KEY (StaffID) REFERENCES Staff (StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (EquipmentID) REFERENCES Equipment (EquipmentID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Type) REFERENCES Task_Priority (Type) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL,
    Storage_Location VARCHAR(100) NOT NULL
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    StaffID INT NOT NULL,
    CategoryID INT NOT NULL,
    Stock INT NOT NULL CHECK (Stock >= 0),
    AddDate DATE NOT NULL,
    ExpiryDate DATE,
    TotalPrice DECIMAL(10,2) NOT NULL CHECK (TotalPrice >= 0),
    AvailabilityStatus VARCHAR(20) NOT NULL CHECK (AvailabilityStatus IN ('Available', 'OutOfStock')),
    FOREIGN KEY (StaffID) REFERENCES Staff (StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (CategoryID) REFERENCES Category (CategoryID) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Medicine (
    MedicineID INT PRIMARY KEY,
    MedicineUsed VARCHAR(100) NOT NULL,
    TreatmentCost DECIMAL(10,2) NOT NULL CHECK (TreatmentCost >= 0)
);

CREATE TABLE Disease (
    DiseaseID INT PRIMARY KEY,
    PlantID INT NOT NULL,
    MedicineID INT NOT NULL,
    Type VARCHAR(50) NOT NULL,
    Intensity VARCHAR(20),
    DetectionDate DATE NOT NULL,
    Status VARCHAR(20) NOT NULL CHECK (Status IN ('Treated', 'Untreated')),
    FOREIGN KEY (PlantID) REFERENCES Plant (PlantID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (MedicineID) REFERENCES Medicine (MedicineID) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(100),
    ReliabilityRating DECIMAL(2,1) CHECK (ReliabilityRating BETWEEN 1 AND 10),
    GSTNumber VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE Supplier_Inventory (
    SupplyTransactionID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    SupplierID INT NOT NULL,
    InventoryID INT,
    EquipmentID INT,
    Type VARCHAR(20) NOT NULL CHECK (Type IN ('Inventory', 'Equipment')),
    PaymentMode VARCHAR(20) NOT NULL CHECK (PaymentMode IN ('Cash', 'Credit', 'Online')),
    FOREIGN KEY (SupplierID) REFERENCES Supplier (SupplierID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (InventoryID) REFERENCES Inventory (InventoryID) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (EquipmentID) REFERENCES Equipment (EquipmentID) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE EventType (
    EventType VARCHAR(50) PRIMARY KEY,
    ManagementCost DECIMAL(10,2) NOT NULL CHECK (ManagementCost >= 0)
);

CREATE TABLE Event (
    EventID INT PRIMARY KEY,
    AreaID INT NOT NULL,
    EventType VARCHAR(50) NOT NULL,
    Title VARCHAR(100) NOT NULL,
    Date DATE NOT NULL,
    Mode VARCHAR(50) CHECK (Mode IN ('Online', 'Offline')),
    FOREIGN KEY (AreaID) REFERENCES Area (AreaID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (EventType) REFERENCES EventType (EventType) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Event_Staff (
    EventID INT NOT NULL,
    StaffID INT NOT NULL,
    PRIMARY KEY (EventID, StaffID),
    FOREIGN KEY (EventID) REFERENCES Event (EventID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (StaffID) REFERENCES Staff (StaffID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE EnergySource (
    SourceType VARCHAR(50) PRIMARY KEY,
    MaintenanceCost DECIMAL(10,2) NOT NULL CHECK (MaintenanceCost >= 0)
);

CREATE TABLE Energy (
    EnergyID INT PRIMARY KEY,
    StaffID INT NOT NULL,
    FOREIGN KEY (StaffID) REFERENCES Staff (StaffID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE EnergyDetails (
    EnergyID INT NOT NULL,
    AreaID INT NOT NULL,
    SensorID INT NOT NULL,
    SourceType VARCHAR(50) NOT NULL,
    Consumption DECIMAL(10,2) NOT NULL CHECK (Consumption >= 0),
    EnergyGeneration DECIMAL(10,2) NOT NULL CHECK (EnergyGeneration >= 0),
    Efficiency DECIMAL(5,2) NOT NULL CHECK (Efficiency >= 0 AND Efficiency <= 100),
    PRIMARY KEY (EnergyID, AreaID, SensorID),
    FOREIGN KEY (EnergyID) REFERENCES Energy (EnergyID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (AreaID) REFERENCES Area (AreaID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (SensorID) REFERENCES Sensor (SensorID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (SourceType) REFERENCES EnergySource (SourceType) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE WaterType (
    WaterTypeID INT PRIMARY KEY,
    Source VARCHAR(50) NOT NULL,
    Method VARCHAR(50) NOT NULL
);

CREATE TABLE WaterEvent (
    WEventID INT PRIMARY KEY,
    AreaID INT NOT NULL,
    StaffID INT NOT NULL,
    SensorID INT NOT NULL,
    WaterTypeID INT NOT NULL,
    Volume DECIMAL(10,2) NOT NULL CHECK (Volume >= 0),
    FOREIGN KEY (AreaID) REFERENCES Area (AreaID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (StaffID) REFERENCES Staff (StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (SensorID) REFERENCES Sensor (SensorID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (WaterTypeID) REFERENCES WaterType (WaterTypeID) ON UPDATE CASCADE ON DELETE RESTRICT
);