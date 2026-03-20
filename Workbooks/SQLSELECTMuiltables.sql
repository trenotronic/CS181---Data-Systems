/* Tren Meckel
 * December 2024 */

/* For me to look at */
SHOW TABLES;

DESCRIBE Classes;
DESCRIBE People;
DESCRIBE Registration;
SELECT * FROM Registration r;
SELECT * FROM People p ;
SELECT * FROM Classes c;

/* Problem 1: Show a list of classes taught 
 * by Severus Snape. Print the class title only.
 * Note it is possible to complete this as a 
 * single table query (if you hardcode snape's ID)
 * or as a join where you use Snape's name */ 

SELECT c.Title FROM People AS p
INNER JOIN Classes AS c 
WHERE p.ID = 'HW0018' AND c.Professor = 'HW0018';

/* Problem 2: Show a list of all classes offered 
 * at Hogwarts where you show the class
 * title and also the professor's first and last name */

SELECT c.Title, p.FirstName, p.LastName
FROM Classes c
INNER JOIN People AS p
WHERE p.ID = c.Professor;

/* Problem 3: Create a class list of Snape's 
 * Magical Creatures class where you print class
 * Title and student ID (do not print student name yet). */
 
SELECT c.Title, r.ID
FROM Registration AS r 
INNER JOIN Classes as c
WHERE c.ClassID = 'C04'and r.ClassID = 'C04';

/* Problem 4: Create a class list of Snape's 
 * Magical Creatures class where you print class
 * Title and student first and last name 
 * (this is a 3-way join since you will need information
 * from all three tables) */

SELECT c.Title, p.FirstName, p.LastName
FROM Registration AS r 
INNER JOIN Classes AS c
INNER JOIN People AS p USING(ID)
WHERE c.ClassID = 'C04'and r.ClassID = 'C04';
 
/* Problem 5: Hermione is quite the over achiever. 
 * Print a list of all classes Hermione is
 * taking where you print only the class name */

SELECT c.Title
FROM Registration AS r
INNER JOIN Classes AS c USING(ClassID)
WHERE r.ID = 'HW0524';

/* Problem 6: Print a list of all of Hermione's
 * classes now showing the class title and also
 * the professor's first and last names. (Note this is a 3-way join). */

SELECT c.Title, p.FirstName, p.Lastname
FROM Registration AS r 
INNER JOIN People AS p
INNER JOIN Classes AS c USING(ClassID)
WHERE r.ID = 'HW0524'AND p.ID = c.Professor;

/* Problem 7: For each class, print the class name,
 * professor's name and also the number
 * of students enrolled. Change the name of the column to 
 * Enrollment as shown below. First think about the 3-way join.
 * Next think about using a GROUP BY */

SELECT c.Title, p.FirstName, p.Lastname, COUNT(r.ID) AS Enrollment
FROM Registration AS r 
INNER JOIN Classes AS c ON r.classID = c.ClassID 
INNER JOIN People AS p ON c.Professor = p.ID
GROUP BY c.Title, p.FirstName, p.Lastname;

/* Problem 8: Print a list of all students and 
 * the number of classes they are registered for.
 * Order by number of classes enrolled, from most to least. 
 * Note it is ok to have professors show up in the results 
 * (they can take classes too!). Notice the 0 entries.
 * How did we get these? */

SELECT  p.FirstName, p.Lastname, COUNT(r.ClassID) AS NumClasses
FROM People AS p
LEFT JOIN Registration AS r ON p.ID = r.ID
GROUP BY p.ID
ORDER BY NumClasses DESC, p.Lastname , p.FirstName;



