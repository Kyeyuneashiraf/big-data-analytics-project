# Big Data Analytics Project

This repository contains the code and documentation for the Big Data Analytics module (UEL-CN-7031) project.

## Project Structure

- `data/`: Contains the dataset files.
- `notebooks/`: Jupyter notebooks for each task.
- `scripts/`: Shell and Python scripts for data processing and analysis.
- `reports/`: Final report and presentation files.
- `visuals/`: Visualizations and plots generated during the analysis.
- `docs/`: Additional documentation.

## Tasks

1. Understanding Dataset
2. Big Data Query & Analysis by Apache Hive
3. Advanced Analytics using PySpark
4. Individual Assessment

## Setup

1. Clone the repository:
    ```sh
    git clone https://github.com/AnthonyByansi/big-data-analytics-project.git
    cd big-data-analytics-project
    ```

2. Follow the instructions in the `notebooks/` directory to execute the tasks.

## Usage

- Run the shell script to load data into HDFS:
    ```sh
    ./scripts/load_data_to_hdfs.sh
    ```

- Execute the Hive queries:
    ```sh
    hive -f scripts/hive_queries.sql
    ```

- Run the PySpark analysis:
    ```sh
    spark-submit scripts/pyspark_analytics.py
    ```

## License

This project is licensed under the MIT License.
