-- Task: Sample Hive queries for analyzing the UNSW-NB15 dataset

USE big_data_project;

-- Query 1: Average destination bytes (dbytes) for each service type
SELECT service, AVG(dbytes) AS avg_dbytes
FROM unsw_nb15
GROUP BY service;

-- Query 2: Distribution of labels by protocol type
SELECT proto, label, COUNT(*) AS count
FROM unsw_nb15
GROUP BY proto, label
ORDER BY proto, label;

-- Query 3: Top 10 source IPs by the number of connections
SELECT srcip, COUNT(*) AS connections
FROM unsw_nb15
GROUP BY srcip
ORDER BY connections DESC
LIMIT 10;

-- Query 4: Average source bytes (sbytes) for each protocol type
SELECT proto, AVG(sbytes) AS avg_sbytes
FROM unsw_nb15
GROUP BY proto;

-- Query 5: Count of unique destination IPs
SELECT COUNT(DISTINCT dstip) AS unique_dstip_count
FROM unsw_nb15;

-- Query 6: Top 10 services by the number of connections
SELECT service, COUNT(*) AS connections
FROM unsw_nb15
GROUP BY service
ORDER BY connections DESC
LIMIT 10;

-- Query 7: Distribution of attack categories
SELECT attack_cat, COUNT(*) AS count
FROM unsw_nb15
GROUP BY attack_cat
ORDER BY count DESC;

-- Query 8: Average packet size (sttl and dttl) for each label
SELECT label, AVG(sttl) AS avg_sttl, AVG(dttl) AS avg_dttl
FROM unsw_nb15
GROUP BY label;

-- Query 9: Protocol usage statistics
SELECT proto, COUNT(*) AS count
FROM unsw_nb15
GROUP BY proto
ORDER BY count DESC;

-- Query 10: Average duration of connections for each label
SELECT label, AVG(dur) AS avg_dur
FROM unsw_nb15
GROUP BY label;
