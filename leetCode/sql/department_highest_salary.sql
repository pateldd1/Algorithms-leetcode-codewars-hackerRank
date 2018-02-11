Select D.Name as Department, Employee.Name as Employee, Employee.Salary as Salary
From
    Employee
    inner join (select DepartmentId, max(Salary) as max
    from Employee
    group by DepartmentId) T on T.DepartmentId = Employee.DepartmentId
    inner join Department D on D.Id = Employee.DepartmentId
Where Employee.Salary = T.max
Order by T.max asc