
CREATE VIEW reporting.vw_constructor_dominance_view AS
WITH constructor_metric AS (
    SELECT
        constructor_name,
        SUM(race_starts) AS race_starts,
        SUM(total_wins) AS total_wins,
        SUM(total_podiums) AS total_podiums,
        SUM(CASE WHEN standing_position = 1 THEN 1 ELSE 0 END) AS total_championships
    FROM reporting.vw_constructor_standing_view
    GROUP BY constructor_name
    HAVING SUM(CASE WHEN standing_position = 1 THEN 1 ELSE 0 END) > 1
)
SELECT
    constructor_name,
    race_starts,
    total_wins,
    total_podiums,
    total_championships,
    (total_championships * 100) + (total_wins * 10) + (total_podiums * 3) AS greatness_score
FROM constructor_metric;



