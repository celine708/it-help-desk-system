CREATE DATABASE help_desk;
USE help_desk;

CREATE TABLE departments (
  department_id INT PRIMARY KEY AUTO_INCREMENT,
  department_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE employees (
  employee_id INT PRIMARY KEY AUTO_INCREMENT,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  department_id INT NOT NULL,
  FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE technicians (
  technician_id INT PRIMARY KEY AUTO_INCREMENT,
  full_name VARCHAR(100) NOT NULL,
  specialty VARCHAR(50)
);

CREATE TABLE categories (
  category_id INT PRIMARY KEY AUTO_INCREMENT,
  category_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE priorities (
  priority_id INT PRIMARY KEY AUTO_INCREMENT,
  priority_name VARCHAR(20) NOT NULL UNIQUE,
  target_hours INT NOT NULL
);

CREATE TABLE tickets (
  ticket_id INT PRIMARY KEY AUTO_INCREMENT,
  employee_id INT NOT NULL,
  technician_id INT NOT NULL,
  category_id INT NOT NULL,
  priority_id INT NOT NULL,
  title VARCHAR(150) NOT NULL,
  description TEXT,
  status VARCHAR(20) NOT NULL,
  opened_at DATETIME NOT NULL,
  resolved_at DATETIME NULL,
  resolution_note TEXT NULL,
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
  FOREIGN KEY (technician_id) REFERENCES technicians(technician_id),
  FOREIGN KEY (category_id) REFERENCES categories(category_id),
  FOREIGN KEY (priority_id) REFERENCES priorities(priority_id),
  CHECK (status IN ('Open','In Progress','Resolved','Closed'))
);

-- Fixed lookup data (taken from your requirements document)
INSERT INTO departments (department_name) VALUES
  ('Sales'),('Accounting'),('HR'),('Operations'),('Management');

INSERT INTO categories (category_name) VALUES
  ('Email'),('Hardware'),('Network'),('Software'),
  ('Accounts and Passwords'),('Printer');

INSERT INTO priorities (priority_name, target_hours) VALUES
  ('Critical',4),('High',8),('Medium',24),('Low',72);