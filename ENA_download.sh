#!/bin/bash

# CSV file with the eccession names of the metagenomic samples
input_file="path/for/the/acession/file.csv"
# Directory of the the result's output 
output_dir="path/for/the/output/dir"
# Directory of where the SRAtoolkit is located
fastq_dump="~/sratoolkit.3.1.1-ubuntu64/bin/fastq-dump"
# Directory of where the PhaseFinder.py algo is found
phasefinder_path="~/PhaseFinder/PhaseFinder.py"

# A counter for number of processed files
count=0

# Loop through each accession in the CSV file
while IFS= read -r accession; do
    # Make sure the accession is exist 
    if [[ -n "$accession" ]]; then
        echo "Processing $accession"
        
        # Run fastq-dump to download the ERR files
        "$fastq_dump" --split-files "$accession" --outdir "$output_dir"
        
        # Check if fastq-dump was successful and log it to the CSV file
        if [[ $? -eq 0 ]]; then
            echo "$accession,Success" >> "$output_dir/download_log.csv"
            echo "$accession downloaded successfully."

            # Running PhaseFinder algo.
            python "$phasefinder_path" ratio \
            -i "${phasefinder_path}/phase_bacts_fa/bact1.ID.fasta" \
            -1 "${output_dir}/${accession}_1.fastq" -2 "${output_dir}/${accession}_2.fastq" \
            -p 16 -o "${output_dir}/out_${accession}"

            # Add count
            count=$((count+1))

            # Print count and remove the row files.
            echo "finished count: ${count}"
            echo "remove fastq files..."
            rm "${output_dir}/${accession}_1.fastq"
            rm "${output_dir}/${accession}_2.fastq"

        else
            echo "$accession,Failure" >> "$output_dir/download_log.csv"
            echo "Failed to download $accession."
        fi
    fi
done < "$input_file"