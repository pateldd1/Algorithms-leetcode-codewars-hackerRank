SELECT s.Score, (SELECT count(distinct Score)
    from Scores
    where Score >= s.Score) Rank
FROM Scores s
ORDER BY s.Score desc