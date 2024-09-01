#%%
import dlt
import pandas as pd
from pathlib import Path
import os
#%%
csv_file_path = "C:\\Users\\DIMITRIS\\Downloads\\ifood_df.csv"
df = pd.read_csv(csv_file_path)
#%%
# used for extracting data from source, in this case a local csv file 
@dlt.resource(write_disposition="append")
def load_csv_resource(file_path: str, **kwargs):
    df = pd.read_csv(file_path, **kwargs)
    yield df.to_dict(orient="records")

#%%
if __name__ == "__main__":
    working_directory = Path(__file__).parent
    os.chdir(working_directory)    

    # will use info from secrets.toml
    pipeline = dlt.pipeline(
    pipeline_name="load_snowflake",
    destination="snowflake",
    dataset_name="staging",  # schema
    )
#%%
    data = list(
    load_csv_resource(
        working_directory / "data" / "ifood.csv", encoding="latin1"
    )
)
#%%
