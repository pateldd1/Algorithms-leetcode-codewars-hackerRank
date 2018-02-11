SELECT FirstName, LastName, City, State
FROM Person
    LEFT OUTER JOIN Address ON Address.PersonId=Person.PersonId;