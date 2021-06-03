

--1. What grades are stored in the database?
SELECT * FROM Grade;


--2. What emotions may be associated with a poem?
SELECT * FROM Emotion;


--3. How many poems are in the database?
SELECT count(p.Title) '# of poems'
	FROM Poem p;


--4. Sort authors alphabetically by name. What are the names of the top 76 authors?
SELECT  TOP 76 a.Name, a.Id
	FROM Author a
ORDER BY Name;


--5. Starting with the above query, add the grade of each of the authors.
SELECT  TOP 76 a.Name author, g.Name grade, a.Id
	FROM Author a
		LEFT JOIN Grade g ON a.GradeId = g.Id
ORDER BY a.Name;


--6. Starting with the above query, add the recorded gender of each of the authors.
SELECT  TOP 76 a.Name author, g.Name grade, n.Name gender, a.Id
	FROM Author a
		LEFT JOIN Grade g ON g.Id = a.GradeId
		LEFT JOIN Gender n ON n.Id = a.GenderId
ORDER BY a.Name;


--7. What is the total number of words in all poems in the database?
SELECT sum(p.WordCount) '# of words'
FROM Poem p;


--8. Which poem has the fewest characters?
SELECT TOP 1 p.Title, p.CharCount
	FROM Poem p
ORDER BY p.CharCount;


--9. How many authors are in the third grade?
SELECT count(a.Name) '# of 3rd grade authors'
	FROM Author a
		LEFT JOIN Grade g ON g.Id = a.GradeId
	WHERE g.Name = '3rd Grade';


--10. How many total authors are in the first through third grades?
SELECT count(a.Name) '# of 1st-3rd grade authors'
	FROM Author a
		LEFT JOIN Grade g ON g.Id = a.GradeId
	WHERE g.Name = '1st grade' OR g.Name = '2nd grade' OR g.Name = '3rd grade';


--11. What is the total number of poems written by fourth graders?
SELECT count(p.Title) '# of poems by 4th graders'
	FROM Author a
		LEFT JOIN grade g ON g.Id = a.GradeId
		LEFT JOIN Poem p ON a.Id = p.AuthorId
	WHERE g.Name = '4th grade';


--12. How many poems are there per grade?
SELECT count(p.Title) '# of poems by grade', g.Name
	FROM Author a
		LEFT JOIN Grade g ON g.Id = a.GradeId
		LEFT JOIN Poem p On a.Id = p.AuthorId
	GROUP BY g.Name
ORDER BY g.Name;


--13. How many authors are in each grade? (Order your results by grade starting with 1st Grade)
SELECT count(a.Name) '# of authors per grade', g.Name
	FROM Author a
		LEFT JOIN Grade g ON g.Id = a.GradeId
	GROUP BY g.Name
ORDER BY g.Name;


--14. What is the title of the poem that has the most words?
SELECT TOP 1 p.Title, p.WordCount
	FROM Poem p
ORDER BY p.WordCount DESC;


--15. Which author(s) have the most poems? (Remember authors can have the same name.)
SELECT TOP 1 count(p.AuthorId) '# of poems', a.Name
	FROM Author a
		LEFT JOIN Poem p ON p.AuthorId = a.Id
	GROUP BY p.AuthorId, a.Name
ORDER BY count(p.AuthorId) DESC;


--16. How many poems have an emotion of sadness?
SELECT count(p.Id) 'sad poems'
	From Poem p
		LEFT JOIN PoemEmotion pe ON pe.PoemId = p.Id
		LEFT JOIN Emotion e ON pe.EmotionId = e.Id
	WHERE e.Name = 'sadness';


--17. How many poems are not associated with any emotion?
SELECT count(p.Id) 'poems with no emotion'
	FROM Poem p
		LEFT JOIN PoemEmotion pe ON pe.PoemId = p.Id
	WHERE pe.Id IS NULL;


--18. Which emotion is associated with the least number of poems?
SELECT TOP 1 e.Name, count(pe.EmotionId) 'least emotion count'
	FROM PoemEmotion pe
		LEFT JOIN Emotion e ON pe.EmotionId = e.Id
	GROUP BY pe.EmotionId, e.Name
ORDER BY count(pe.EmotionId);


--19. Which grade has the largest number of poems with an emotion of joy?
SELECT TOP 1 g.Name, count(a.gradeId) '# of joy poems'
	FROM Poem p
		LEFT JOIN Author a ON a.id = p.AuthorId
		LEFT JOIN Grade g ON g.id = a.GradeId
		LEFT JOIN PoemEmotion pe ON p.id = pe.PoemId
		LEFT JOIN Emotion e ON e.id = pe.EmotionId
	WHERE e.Name = 'joy'
GROUP BY a.GradeId, g.Name
ORDER BY count(a.gradeId) DESC;


--20. Which gender has the least number of poems with an emotion of fear?
SELECT TOP 1 g.Name, count(a.genderId) '# of fear poems'
	FROM Poem p
		LEFT JOIN Author a ON a.id = p.AuthorId
		LEFT JOIN Gender g ON g.id = a.GenderId
		LEFT JOIN PoemEmotion pe ON p.id = pe.PoemId
		LEFT JOIN Emotion e ON e.id = pe.EmotionId
	WHERE e.Name = 'fear'
GROUP BY a.GradeId, g.Name
ORDER BY count(a.GenderId);



