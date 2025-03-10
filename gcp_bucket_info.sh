#!/bin/bash

# Array of project IDs
projects=("project-001" "project-002")

# Output CSV file name
output_file="buckets_info.csv"

# CSV file headers
echo "Project,Bucket,Size,Storage Class" > $output_file

# Iterate over each project ID
for project in "${projects[@]}"; do
  echo "Processing project: $project"

  # List the project's buckets
  buckets=$(gsutil ls -p $project)

  # Iterate over each bucket
  for bucket in $buckets; do
    echo "Processing bucket: $bucket"

    # Get the bucket size
    # gcloud storage du gs://us.artifacts.xertica-support-host.appspot.com --summarize --readable-sizes
    size=$(gsutil du -sh $bucket | awk '{print $1, $2}')
    #size=$(gcloud storage du $bucket --summarize --readable-sizes | awk '{print $1}')

    # Get the storage class of the bucket
    storage_class=$(gcloud storage buckets describe $bucket --format="json(default_storage_class)" | jq -r '.default_storage_class')

    # Save the information in the CSV file
    echo "$project,$bucket,$size,$storage_class" >> $output_file
  done
done

echo "Information collected in $output_file"
