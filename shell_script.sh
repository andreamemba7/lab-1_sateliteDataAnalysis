#!/bin/bash

# Define fixed base directory
BASE_DIR="/lab_1_sateliteDataAnalysis"

# Set paths based on the fixed base directory
DATAFILE="$BASE_DIR/raw_data/satelite_temperature_data.csv"
ANALYZED_DIR="$BASE_DIR/analyzed_data"
COUNTRY="Mauritius"
OUTPUT_TOP10="$ANALYZED_DIR/highest_temp.csv"
OUTPUT_HUMIDITY="$ANALYZED_DIR/humidity_data_${COUNTRY}.csv"

# Ensure output directory exists
mkdir -p "$ANALYZED_DIR"

# Task 1: Extract top 10 highest temperatures
tail -n +2 "$DATAFILE" | sort -t',' -k4 -nr | head -10 > "$OUTPUT_TOP10"
head -n 1 "$DATAFILE" | cat - "$OUTPUT_TOP10" > temp && mv temp "$OUTPUT_TOP10"

# Task 2: Extract data for selected country, sorted by humidity descending
head -n 1 "$DATAFILE" > "$OUTPUT_HUMIDITY"
grep "^$COUNTRY," "$DATAFILE" | sort -t',' -k5 -nr >> "$OUTPUT_HUMIDITY"

echo "✅ Data analysis complete. Results saved in '$ANALYZED_DIR'"
