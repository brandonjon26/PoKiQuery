

--1.
SELECT * FROM Grade;


--2.
SELECT * FROM Emotion;


--3.
SELECT count(p.Title) '# of poems'
	FROM Poem p;


--4.
SELECT  TOP 76 a.Name, a.Id
	FROM Author a
ORDER BY Name;


--5.
SELECT  TOP 76 a.Name author, g.Name grade, a.Id
	FROM Author a
		LEFT JOIN Grade g ON a.GradeId = g.Id
ORDER BY a.Name;


--6.
SELECT  TOP 76 a.Name author, g.Name grade, n.Name gender, a.Id
	FROM Author a
		LEFT JOIN Grade g ON g.Id = a.GradeId
		LEFT JOIN Gender n ON n.Id = a.GenderId
ORDER BY a.Name;


--7.
SELECT sum(p.WordCount) '# of words'
FROM Poem p;


--8.
SELECT TOP 1 p.Title, p.CharCount
	FROM Poem p
ORDER BY p.CharCount;


--9.
SELECT count(a.Name) '# of 3rd grade authors'
	FROM Author a
		LEFT JOIN Grade g ON g.Id = a.GradeId
	WHERE g.Name = '3rd Grade';


--10.
SELECT count(a.Name) '# of 1st-3rd grade authors'
	FROM Author a
		LEFT JOIN Grade g ON g.Id = a.GradeId
	WHERE g.Name = '1st grade' OR g.Name = '2nd grade' OR g.Name = '3rd grade';




