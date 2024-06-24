-- Task: Create a Hive table for the UNSW-NB15 dataset

CREATE DATABASE IF NOT EXISTS big_data_project;

USE big_data_project;

DROP TABLE IF EXISTS unsw_nb15;

CREATE EXTERNAL TABLE unsw_nb15 (
  srcip STRING,
  sport INT,
  dstip STRING,
  dsport INT,
  proto STRING,
  state STRING,
  dur FLOAT,
  sbytes INT,
  dbytes INT,
  sttl INT,
  dttl INT,
  sloss INT,
  dloss INT,
  service STRING,
  Sload FLOAT,
  Dload FLOAT,
  Spkts INT,
  Dpkts INT,
  swin INT,
  dwin INT,
  stcpb BIGINT,
  dtcpb BIGINT,
  smeansz INT,
  dmeansz INT,
  trans_depth INT,
  res_bdy_len INT,
  Sjit FLOAT,
  Djit FLOAT,
  Stime BIGINT,
  Ltime BIGINT,
  Sintpkt FLOAT,
  Dintpkt FLOAT,
  tcprtt FLOAT,
  synack FLOAT,
  ackdat FLOAT,
  is_sm_ips_ports INT,
  ct_state_ttl INT,
  ct_flw_http_mthd INT,
  is_ftp_login INT,
  ct_ftp_cmd INT,
  ct_srv_src INT,
  ct_srv_dst INT,
  ct_dst_ltm INT,
  ct_src_ltm INT,
  ct_src_dport_ltm INT,
  ct_dst_sport_ltm INT,
  ct_dst_src_ltm INT,
  attack_cat STRING,
  label INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/hadoop/unsw_nb15'
TBLPROPERTIES ("skip.header.line.count"="1");
