# Google Cloud Storage Bucket Info Collector

## Overview
This script retrieves information about Google Cloud Storage buckets within specified projects and saves the details into a CSV file.

## Features
- Lists all buckets in given Google Cloud projects.
- Retrieves bucket size and storage class.
- Saves the collected information into a structured CSV file.

## Prerequisites
Ensure you have the following installed and configured:
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- [gsutil](https://cloud.google.com/storage/docs/gsutil)
- [jq](https://stedolan.github.io/jq/) for JSON parsing

Additionally, you must have authentication set up with Google Cloud to access project storage details.

## Usage
1. Clone this repository:
   ```sh
   git clone <repository_url>
   cd <repository_directory>
   ```
2. Modify the script to include the project IDs you want to query:
   ```sh
   projects=("your-project-id-1" "your-project-id-2")
   ```
3. Run the script:
   ```sh
   chmod +x bucket_info.sh
   ./bucket_info.sh
   ```
4. Check the output file `buckets_info.csv` for the results.

## Important Considerations
- **Execution Time:** The script may take a long time to run if the buckets contain a large number of objects. Instead of using the script, it is recommended to check the bucket size directly in the Google Cloud Console under the **Cloud Monitoring** service.
- The script assumes `gsutil` and `gcloud` are properly authenticated.
- Modify the script as needed to add more metadata or adjust formatting.

## Example Output
```
Project,Bucket,Size,Storage Class
project-001,gs://my-bucket,10MB,STANDARD
project-002,gs://another-bucket,25MB,NEARLINE
```

## License
This project is open-source. Feel free to use and modify it as needed.

