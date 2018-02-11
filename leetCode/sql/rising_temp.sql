select A.Id from Weather A
where A.Temperature > (
    Select B.Temperature
    from Weather B
    where subdate(A.Date, 1) = B.Date
)