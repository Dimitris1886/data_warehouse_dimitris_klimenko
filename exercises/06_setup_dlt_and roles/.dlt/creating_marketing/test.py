#%% Import necessary libraries
import dlt
import pandas as pd
from pathlib import Path
import os

#%% Define the CSV file path
csv_file_path = Path("C:/Users/DIMITRIS/Downloads/ifood_df.csv")

# Optional: Read the CSV file to check its contents
# This is just for verification; it won't affect the DLT pipeline
#df = pd.read_csv(csv_file_path)
#print(df.head())  # Print the first few rows to check

#%% Define the DLT resource to load the CSV data
@dlt.resource(write_disposition="append")
def load_csv_resource(file_path: str, **kwargs):
    df = pd.read_csv(file_path, **kwargs)
    yield df.to_dict(orient="records")

#%% Main block to run the pipeline
if __name__ == "__main__":
    # Set the working directory to the script's location
    csv_file_path = Path(__file__).parent
    os.chdir(csv_file_path)

    # Define the DLT pipeline configuration
    pipeline = dlt.pipeline(
        pipeline_name="load_snowflake",
        destination="snowflake",
        dataset_name="staging",  # Specify the schema name
    )

    # Load the data using the resource
    data = list(
        load_csv_resource(
            file_path=csv_file_path,  # Use the correct file path
            encoding="latin1"))

    # Print the data to verify it's loaded correctly
    print(data)
#%%
    # Run the pipeline and load data into Snowflake
    load_info = pipeline.run(data, table_name="ifood_data")

    # Print information about the data loading process
    print(load_info)

# %%
