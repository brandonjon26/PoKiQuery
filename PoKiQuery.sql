

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


--11.
SELECT count(p.Title) '# of poems by 4th graders'
	FROM Author a
		LEFT JOIN grade g ON g.Id = a.GradeId
		LEFT JOIN Poem p ON a.Id = p.AuthorId
	WHERE g.Name = '4th grade';


--12.
SELECT count(p.Title) '# of poems by grade', g.Name
	FROM Author a
		LEFT JOIN Grade g ON g.Id = a.GradeId
		LEFT JOIN Poem p On a.Id = p.AuthorId
	GROUP BY g.Name
ORDER BY g.Name;


--13
SELECT count(a.Name) '# of authors per grade', g.Name
	FROM Author a
		LEFT JOIN Grade g ON g.Id = a.GradeId
	GROUP BY g.Name
ORDER BY g.Name;


--14.
SELECT TOP 1 p.Title, p.WordCount
	FROM Poem p
ORDER BY p.WordCount DESC;


--15.
SELECT TOP 1 count(p.AuthorId) '# of poems', a.Name
	FROM Author a
		LEFT JOIN Poem p ON p.AuthorId = a.Id
	GROUP BY p.AuthorId, a.Name
ORDER BY count(p.AuthorId) DESC;



