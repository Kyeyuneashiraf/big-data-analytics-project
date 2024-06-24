# Task: Analyzing the UNSW-NB15 dataset using PySpark

from pyspark.sql import SparkSession
from pyspark.sql.functions import col, avg, count
import matplotlib.pyplot as plt
import seaborn as sns

# Initialize Spark session
spark = SparkSession.builder \
    .appName("UNSW-NB15 Analytics") \
    .getOrCreate()

# Load the dataset into a Spark DataFrame
data_path = '../data/UNSW-NB15.csv'  # Adjust the path if necessary
df = spark.read.csv(data_path, header=True, inferSchema=True)

# Display the schema of the DataFrame
df.printSchema()

# Display the first few rows of the DataFrame
df.show(5)

# Count the number of records in the dataset
total_records = df.count()
print(f"Total number of records in the dataset: {total_records}")

# Count the number of records for each label
label_counts = df.groupBy("label").count().toPandas()
print(label_counts)

# Visualize the distribution of labels
plt.figure(figsize=(10, 6))
sns.barplot(x='label', y='count', data=label_counts)
plt.title('Distribution of Labels')
plt.xlabel('Label')
plt.ylabel('Count')
plt.show()

# Calculate the average source bytes (sbytes) for each label
avg_sbytes = df.groupBy("label").agg(avg("sbytes").alias("avg_sbytes")).toPandas()
print(avg_sbytes)

# Visualize the average source bytes for each label
plt.figure(figsize=(10, 6))
sns.barplot(x='label', y='avg_sbytes', data=avg_sbytes)
plt.title('Average Source Bytes for Each Label')
plt.xlabel('Label')
plt.ylabel('Average Source Bytes')
plt.show()

# Identify the top 10 source IPs by number of connections
top_src_ips = df.groupBy("srcip").agg(count("*").alias("connections")) \
    .orderBy(col("connections").desc()).limit(10).toPandas()
print(top_src_ips)

# Visualize the top 10 source IPs by number of connections
plt.figure(figsize=(12, 8))
sns.barplot(x='connections', y='srcip', data=top_src_ips)
plt.title('Top 10 Source IPs by Number of Connections')
plt.xlabel('Number of Connections')
plt.ylabel('Source IP')
plt.show()

# Stop the Spark session
spark.stop()
