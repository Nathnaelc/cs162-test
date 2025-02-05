PRAGMA automatic_index=off;
.mode column
.headers on

-- CREATE SOME TABLES
CREATE TABLE TEST1 (
    id INT,
    x INT DEFAULT(ABS(RANDOM() / 17592186044416)),
    y INT DEFAULT(ABS(RANDOM() / 17592186044416)),
    z INT DEFAULT(ABS(RANDOM() / 17592186044416))
);
CREATE TABLE TEST2 (
    id INT,
    x INT DEFAULT(ABS(RANDOM() / 17592186044416)),
    y INT DEFAULT(ABS(RANDOM() / 17592186044416)),
    z INT DEFAULT(ABS(RANDOM() / 17592186044416))
);
CREATE TABLE TEST3 (
    id INT,
    x INT DEFAULT(ABS(RANDOM() / 17592186044416)),
    y INT DEFAULT(ABS(RANDOM() / 17592186044416)),
    z INT DEFAULT(ABS(RANDOM() / 17592186044416))
);

-- PUT RANDOM DATA IN THEM
INSERT INTO TEST1 (id) WITH TempIDs(id) AS
  (VALUES(1) UNION ALL SELECT id+1 FROM TempIDs WHERE id < 10000 )
  SELECT id FROM TempIDs;

INSERT INTO TEST2 (id) WITH TempIDs(id) AS
  (VALUES(1) UNION ALL SELECT id+1 FROM TempIDs WHERE id < 10000 )
  SELECT id FROM TempIDs;

INSERT INTO TEST3 (id) WITH TempIDs(id) AS
  (VALUES(1) UNION ALL SELECT id+1 FROM TempIDs WHERE id < 10000 )
  SELECT id FROM TempIDs;


-- Now we have 3 large tables with random numbers in them
SELECT COUNT(*) AS TEST1SIZE FROM TEST1;
SELECT COUNT(*) AS TEST2SIZE FROM TEST2;
SELECT COUNT(*) AS TEST3SIZE FROM TEST3;

SELECT * FROM TEST1 LIMIT 10;

----------------------------------------------------------------
-- Add some indexes
----------------------------------------------------------------
CREATE INDEX idx_test2_x ON TEST2 (x);
CREATE INDEX idx_test3_y ON TEST3 (y);

SELECT "INDEX QUERY";
----------------------------------------------------------------
----------------------------------------------------------------

EXPLAIN QUERY PLAN SELECT COUNT(*) FROM TEST1 t1
    JOIN TEST2 t2 ON (t1.x) = (t2.x)
    JOIN TEST3 t3 ON (t1.y) = (t3.y)
    WHERE t3.z > t1.z;

.timer ON
SELECT COUNT(*) FROM TEST1 t1
    JOIN TEST2 t2 ON (t1.x) = (t2.x)
    JOIN TEST3 t3 ON (t1.y) = (t3.y)
    WHERE t3.z > t1.z;
