# create a new directory
mkdir filesystem_local_pipeline
cd filesystem_local_pipeline
# initialize a new pipeline with your source and destination
dlt init filesystem snowflake
# install the required dependencies
pip install -r requirements.txt