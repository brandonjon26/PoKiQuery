

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
SELECT  TOP 76 a.Name, a.Id
	FROM Author a
		LEFT JOIN Grade g On g.Id = a.GradeId
ORDER BY Name;


