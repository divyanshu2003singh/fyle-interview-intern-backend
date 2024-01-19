-- Write query to find the number of grade A's given by the teacher who has graded the most assignments
SELECT
    t.id AS teacher_id,
    COUNT(DISTINCT a.id) AS count_grade_A_assignments
FROM
    teachers t
JOIN
    assignments a ON t.id = a.teacher_id
WHERE
    a.grade = 'A'
GROUP BY
    t.id
HAVING
    COUNT(DISTINCT a.id) = (
        SELECT
            COUNT(DISTINCT a2.id)
        FROM
            teachers t2
        JOIN
            assignments a2 ON t2.id = a2.teacher_id
        WHERE
            a2.grade = 'A'
        GROUP BY
            t2.id
        ORDER BY
            COUNT(DISTINCT a2.id) DESC
        LIMIT 1
    );
