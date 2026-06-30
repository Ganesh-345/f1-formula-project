CREATE VIEW reporting.vw_driver_standing_view AS
WITH driver_stats AS (
    SELECT
        f.season,
        f.driver_id,
        d.driver_name,
        d.nationality,
        COUNT(*) AS race_starts,
        SUM(f.points) AS total_points,
        SUM(CASE WHEN f.is_win = 1 THEN 1 ELSE 0 END) AS total_wins,
        SUM(CASE WHEN f.is_podium = 1 THEN 1 ELSE 0 END) AS total_podiums
    FROM gold_db.gold.vw_fact_session_results f
    INNER JOIN gold_db.gold.vw_dim_drivers d
        ON f.driver_id = d.driver_id
    WHERE f.session_type = 'race'
    GROUP BY f.season, f.driver_id, d.driver_name, d.nationality
)
SELECT
    *,
    ROW_NUMBER() OVER (
        PARTITION BY season
        ORDER BY total_points DESC, total_wins DESC, total_podiums DESC
    ) AS standing_position
FROM driver_stats;
