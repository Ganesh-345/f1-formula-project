CREATE VIEW reporting.vw_constructor_standing_view AS
WITH constructor_stats AS (
    SELECT
        f.season,
        f.constructor_id,
        d.name AS constructor_name,
        d.nationality,
        COUNT(*) AS race_starts,
        SUM(f.points) AS total_points,
        SUM(CASE WHEN f.is_win = 1 THEN 1 ELSE 0 END) AS total_wins,
        SUM(CASE WHEN f.is_podium = 1 THEN 1 ELSE 0 END) AS total_podiums
    FROM gold_db.gold.vw_fact_session_results f
    INNER JOIN gold_db.gold.dim_constructors d
        ON f.constructor_id = d.constructor_id
    WHERE f.session_type = 'race'
    GROUP BY f.season, f.constructor_id, d.name, d.nationality
)
SELECT
    *,
    ROW_NUMBER() OVER (
        PARTITION BY season
        ORDER BY total_points DESC, total_wins DESC, total_podiums DESC
    ) AS standing_position
FROM constructor_stats;
