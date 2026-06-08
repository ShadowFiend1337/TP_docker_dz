import csv
import random
import os
import sys

NUM_ROWS = 4


COLUMNS = ["ID", "AGE", "HEIGHT", "WEIGHT"]

def generate_row():

    return {
        "ID": random.randint(0, 100),
        "AGE": random.randint(0, 80),
        "HEIGHT": random.randint(0, 200),
        "WEIGHT": random.randint(0, 80),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)

