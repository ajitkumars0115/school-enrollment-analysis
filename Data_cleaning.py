import pandas as pd

# Load the raw dataset
df = pd.read_excel("school_enrollment.xlsx")

# Anonymize school names for data privacy
df["School_Name"] = ["School_" + str(i + 1) for i in range(len(df))]

# Convert numeric columns to proper numbers and replace missing values with 0
numeric_columns = ["Class_1", "Class_9", "Class_10", "Class_11", "Total_Enrollment"]
for col in numeric_columns:
    if col in df.columns:
        df[col] = pd.to_numeric(df[col], errors="coerce").fillna(0)

# Remove duplicate entries
df = df.drop_duplicates()

# Export the cleaned data to CSV
df.to_csv("school_enrollment_clean.csv", index=False)
print("Data cleaned and saved successfully.")