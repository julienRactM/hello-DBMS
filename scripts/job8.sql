-- 1. Créez la base de données SomeCompany à l’aide d’une requête, ajoutez une condition sur l'existence de SomeCompany.
CREATE DATABASE SomeCompanyIF NOT EXISTS SomeCompany


-- 2. Créez la table Employees.

-- Idéalement on crée dans un premier temps la table Departments pour pouvoir insérer dans la table Employees
-- la notion de foreign key sur department_id.
CREATE TABLE Employees(employee_id INT PRIMARY KEY, first_name VARCHAR(50), last_name VARCHAR(50), birthdate TEXT, position VARCHAR(100), department_id INT)


-- 3. Créez la table Departments.
CREATE TABLE Departments (department_id INT PRIMARY KEY, department_name VARCHAR(255), department_head INT, location VARCHAR(255)


-- 4. Insérez 6 à 9 nouveaux employés dans la table Employees.

-- Pour 9 employés en d’assurant de récupérer les individus à la tête de départements.
INSERT INTO Employees VALUES(9, 'Emilia', 'Clark', '1986-01-12', 'HR Manager', 3)


-- 5. Récupérez le nom et le poste de tous les employés.
CREATE TABLE Employees(employee_id, first_name, last_name, birthdate, position, department_id)


-- 6. Mettez à jour le poste d’un employé dans la table Employees.
SELECT (first_name || ' ' || last_name) AS name, position
FROM Employees;


-- 7. Supprimez un employé de la table Employees.
DELETE FROM Employees WHERE employee_id = 6;


-- 8. Affichez le nom, le département et le bureau de chaque employé.

-- Dans un premier temps, il faut ajouter les informations des bureaux trois bureaux à la table Departments :
INSERT INTO Departments VALUES(1, 'IT', 11, 'Headquarters');
-- Ensuite, on effectue la requête SQL
SELECT (e.first_name || ' ' || e.last_name) AS name, d.department_name, d.location
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id;


-- 9. Affichez, à l’aide d’un filtre, les membres de l’équipe IT, puis le management, puis les ressources humaines.
SELECT (e.first_name || ' ' || e.last_name) AS name, d.department_name
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
ORDER BY d.department_id ;


-- 10. Affichez les départements de SomeCompany dans l’ordre alphabétique, avec les managers respectifs de chaque département.
SELECT d.department_name, (e.first_name || ' ' || e.last_name) AS manager
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
WHERE e.employee_id IN (SELECT department_head FROM Departments)
ORDER BY d.department_id;


-- 11.Ajoutez un nouveau département à la table Department (Marketing peut-être?),

-- J’ai choisi Olivia Garcia, dont le poste est Marketing Manager pour être la nouvelle directrice
-- du département Marketing, son id de département a été édité de 2 à 4.
INSERT INTO Departments VALUES(4, 'Marketing', 8, 'Branch Office London');


-- 12. Créez une nouvelle table Project : project_id (INT, PK), project_name (VARCHAR), departement_id (INT, FK).
-- Ajoutez des observations à cette nouvelle table, analysez la productivité des départements en IT
-- et du nouveau département créé précédemment.
VARCHAR de project_name pourrait être plus bas, peut-être autour de 60
CREATE TABLE Project(project_id INTEGER PRIMARY KEY,
project_name VARCHAR(255),
start_date TEXT,
end_date TEXT,
departement_id INT,
FOREIGN KEY (departement_id) REFERENCES Departments(department_id));

-- Observations :
-- INSERT INTO Project VALUES(5, 'Small Project 2', '2023-12-1', '2022-12-6', 1);

-- 1|Mid Project 1|2023-12-14|In_Progress|4
-- 2|Small Project 2|2023-12-1|2022-12-6|1
-- 3|Mid Project 3|2023-12-17|In_Progress|4
-- 4|small Project 1|2023-12-17|In_Progress|1
-- 5|Mid Project 2|2022-8-3|2022-10-16|1
-- 6|Big Project 2|2023-04-02|In Progress|4
-- 7|Big Project 1|2023-12-1|In Progress|4
-- … + entrées pour Project Management et HR.
--  Il est difficile d’évaluer la productivité du nouveaux service marketing récemment crée en 2022 mais on remarque que les projets de grande ampleur commencent à s’accumuler et ils n’ont encore finit aucun projet. Il est urgent d’opérer un recrutement conséquent ou de procéder à une restructuration du service, avant qu’il ne ternisse l’image de marque de la société ou ne devienne un gouffre financier. Les équipes du département IT semble elles gérer efficacement leur projet et les terminer rapidement. Il pourrait être intéressant de leur demander, ainsi qu’aux autres départements du soutient le temps que le nouveau département prenne ses marques.
