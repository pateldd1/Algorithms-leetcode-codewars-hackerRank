SELECT employee.Name as Employee
FROM Employee employee, Employee manager
WHERE employee.ManagerId = manager.Id and employee.Salary > manager.Salary;