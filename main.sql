select points from scores where assignmentID=31;
SELECT MAX(POINTS) FROM scores WHERE assignmentID=31;
SELECT MIN(POINTS) FROM scores WHERE assignmentID=31;
SELECT AVG(POINTS) FROM scores WHERE assignmentID=31;

SELECT s.* 
    FROM registration e
    JOIN students s ON e.studentID = s.studentID
    WHERE e.courseID = 3;

SELECT st.*, s.fName, s.lName, s.major  
FROM scores st 
JOIN students s ON s.studentID = st.studentID 
JOIN registration e ON e.studentID = st.studentID 
WHERE e.courseID=3;

INSERT into assignments (distributionID, instance, pointsPossible) VALUES (1, 5, 200);
select * from distribution;
update distribution
    set percent=35
    where distributionID=12;
select * from distribution;
update distribution
    set percent=25
    where distributionID=16;
select * from distribution;

select * from scores where assignmentID=5;
UPDATE scores
    SET points = points + 2
    WHERE assignmentID = 5;
select * from scores where assignmentID=5;

select * from scores where assignmentID=53;
select * from students where studentID=5;

UPDATE scores st 
    join students s on s.studentID = st.studentID 
    set points = points + 2 
    where assignmentID = 53 
    and s.lName like '%Q%';
select * from scores where assignmentID=53;

/* get count */
select count(*) from scores s left join assignments a on s.assignmentID = a.assignmentID join distribution d on d.distributionID = a.distributionID where courseID=3 and studentID=1
    group by d.distributionID;

select * from scores s left 
    join assignments a on s.assignmentID = a.assignmentID 
    join distribution d on d.distributionID = a.distributionID 
    where courseID=3 and studentID=1;

/* task11 */
select sum((s.points/a.pointsPossible) * (d.percent/c.counter)) as final_grade
from scores s 
left join assignments a on s.assignmentID = a.assignmentID 
join distribution d on d.distributionID = a.distributionID 
join (select d.distributionID, count(*) as counter from scores s 
        left join assignments a on s.assignmentID = a.assignmentID 
        join distribution d on d.distributionID = a.distributionID 
        where courseID=3 and studentID=1 group by d.distributionID) 
        c on c.distributionID= d.distributionID 
where courseID=3 
and studentID=1;

/* experiment */
select if(
    (d.category='Project' and s.points/a.pointsPossible<=lw.low), 
    'true', 'false')
from scores s 
left join assignments a on s.assignmentID = a.assignmentID 
join distribution d on d.distributionID = a.distributionID 
join (select d.distributionID, count(*) as counter from scores s 
        left join assignments a on s.assignmentID = a.assignmentID 
        join distribution d on d.distributionID = a.distributionID 
        where courseID=3 and studentID=1 group by d.distributionID) 
        c on c.distributionID= d.distributionID 
join (select d.distributionID, min(s.points/a.pointsPossible) as low from scores s 
        left join assignments a on s.assignmentID = a.assignmentID 
        join distribution d on d.distributionID = a.distributionID 
        where courseID=3 and studentID=1 group by d.distributionID) 
        lw on lw.distributionID= d.distributionID 
where courseID=3 
and studentID=1;

/* task12 */
select sum(
    if(
        (d.category='Project' and s.points/a.pointsPossible<=lw.low), 
        d.percent/c.counter, 
        (s.points/a.pointsPossible) * (d.percent/c.counter)
    )
) as final_grade
from scores s 
left join assignments a on s.assignmentID = a.assignmentID 
join distribution d on d.distributionID = a.distributionID 
join (select d.distributionID, count(*) as counter from scores s 
        left join assignments a on s.assignmentID = a.assignmentID 
        join distribution d on d.distributionID = a.distributionID 
        where courseID=3 and studentID=1 group by d.distributionID) 
        c on c.distributionID= d.distributionID 
join (select d.distributionID, min(s.points/a.pointsPossible) as low from scores s 
        left join assignments a on s.assignmentID = a.assignmentID 
        join distribution d on d.distributionID = a.distributionID 
        where courseID=3 and studentID=1 group by d.distributionID) 
        lw on lw.distributionID= d.distributionID 
where courseID=3 
and studentID=1;



