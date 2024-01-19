-- Write query to get number of assignments for each state
SELECT
    state,
    COUNT(id) AS count_assignments
FROM
    assignments
GROUP BY
    state;
