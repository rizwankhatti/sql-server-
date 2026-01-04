import pandas as pd
import numpy as np
from datetime import datetime, timedelta
import random

np.random.seed(42)
random.seed(42)

# Define possible values
sequencing_techs = ['Illumina NovaSeq', 'Illumina HiSeq', 'Illumina MiSeq', 
                    'Nanopore MinION', 'Nanopore GridION', 'PacBio Sequel', 
                    'Ion Torrent', 'BGISEQ-500']

reference_genomes = ['GRCh38', 'GRCh37', 'HG38', 'HG19', 'mm10', 'rn6', 'dm6']
chromosomes = [f'chr{i}' for i in range(1, 23)] + ['chrX', 'chrY', 'chrM']

# Sample IDs
sample_ids = [f'SAMP_{i:05d}' for i in range(1, 501)]

# Generate 50,000 records
n_records = 50000

print("Generating DNA sequences...")
data = {
    'Sequence_ID': [f'SEQ_{i:07d}' for i in range(1, n_records + 1)],
    'DNA_Sequence': [''.join(np.random.choice(['A', 'T', 'C', 'G'], size=random.randint(100, 300))) 
                     for _ in range(n_records)],
    'Sequence_Length': np.random.randint(100, 301, n_records),
    'GC_Content': np.round(np.random.uniform(30.0, 60.0, n_records), 2),
    'Read_Quality': np.round(np.random.uniform(20.0, 40.0, n_records), 2),
    'Sequencing_Technology': np.random.choice(sequencing_techs, n_records),
    'Sample_ID': np.random.choice(sample_ids, n_records),
    'Coverage': np.random.randint(10, 101, n_records),
    'Error_Rate': np.round(np.random.exponential(0.005, n_records), 5),
    'Reference_Genome': np.random.choice(reference_genomes, n_records),
    'Alignment_Position': [f'{random.choice(chromosomes)}:{random.randint(1, 1000000)}-{random.randint(1000001, 2000000)}' 
                          for _ in range(n_records)],
    'Date_Sequenced': [(datetime(2024, 1, 1) + timedelta(days=random.randint(0, 365))).strftime('%Y-%m-%d') 
                      for _ in range(n_records)]
}

# Create DataFrame
df = pd.DataFrame(data)
print(f"DataFrame created with {len(df)} records")

# Calculate actual GC content from generated sequences
def calculate_gc_content(seq):
    gc_count = seq.count('G') + seq.count('C')
    return round((gc_count / len(seq)) * 100, 2)

print("Calculating actual GC content...")
df['GC_Content'] = df['DNA_Sequence'].apply(calculate_gc_content)

# Adjust error rate based on technology
tech_error_rates = {
    'Nanopore MinION': 0.01,
    'Nanopore GridION': 0.008,
    'PacBio Sequel': 0.005,
    'Illumina MiSeq': 0.001,
    'Illumina HiSeq': 0.0008,
    'Illumina NovaSeq': 0.0005,
    'Ion Torrent': 0.002,
    'BGISEQ-500': 0.0015
}

print("Adjusting error rates by technology...")
for tech, base_rate in tech_error_rates.items():
    mask = df['Sequencing_Technology'] == tech
    tech_count = mask.sum()
    if tech_count > 0:
        df.loc[mask, 'Error_Rate'] = np.abs(np.random.normal(base_rate, base_rate/2, tech_count))
        # Ensure minimum error rate
        df.loc[mask, 'Error_Rate'] = df.loc[mask, 'Error_Rate'].clip(lower=0.00001)

# Adjust quality based on error rate (avoid division by zero)
print("Calculating read quality...")
df['Read_Quality'] = np.round(-10 * np.log10(df['Error_Rate'].clip(lower=0.0000001)), 2)

# Save to CSV
print("Saving to CSV...")
df.to_csv('dna_sequencing_dataset_50k.csv', index=False)
print(f"✓ Dataset with {len(df)} records saved to 'dna_sequencing_dataset_50k.csv'")

# Try to save to Excel if openpyxl is available, otherwise skip
try:
    import openpyxl
    print("Saving to Excel...")
    with pd.ExcelWriter('dna_sequencing_dataset_50k.xlsx', engine='openpyxl') as writer:
        # Split into chunks for Excel
        chunks = [df.iloc[i:i+10000] for i in range(0, len(df), 10000)]
        for i, chunk in enumerate(chunks):
            chunk.to_excel(writer, sheet_name=f'Data_{i+1}', index=False)
        
        # Create a summary sheet
        summary = pd.DataFrame({
            'Metric': ['Total Records', 'Unique Samples', 'Technologies', 'Date Range', 
                      'Avg GC Content', 'Avg Coverage', 'Avg Quality'],
            'Value': [len(df), df['Sample_ID'].nunique(), 
                     ', '.join(df['Sequencing_Technology'].unique()[:3]) + '...',
                     f"{df['Date_Sequenced'].min()} to {df['Date_Sequenced'].max()}",
                     f"{df['GC_Content'].mean():.2f}%",
                     f"{df['Coverage'].mean():.1f}x",
                     f"{df['Read_Quality'].mean():.2f}"]
        })
        summary.to_excel(writer, sheet_name='Summary', index=False)
    
    print("✓ Excel file 'dna_sequencing_dataset_50k.xlsx' created")
except ImportError:
    print("⚠ openpyxl not installed. Skipping Excel export.")
    print("To install: pip install openpyxl")
    # Save as multiple CSV files instead
    chunks = [df.iloc[i:i+10000] for i in range(0, len(df), 10000)]
    for i, chunk in enumerate(chunks):
        chunk.to_csv(f'dna_sequencing_part_{i+1}.csv', index=False)
    print(f"✓ Split into {len(chunks)} CSV files")

# Print dataset summary
print("\n" + "="*50)
print("DATASET SUMMARY")
print("="*50)
print(f"Total records: {len(df):,}")
print(f"Unique samples: {df['Sample_ID'].nunique()}")
print(f"Technologies: {', '.join(df['Sequencing_Technology'].unique())}")
print(f"Date range: {df['Date_Sequenced'].min()} to {df['Date_Sequenced'].max()}")
print(f"GC Content range: {df['GC_Content'].min():.1f}% to {df['GC_Content'].max():.1f}%")
print(f"Coverage range: {df['Coverage'].min()}x to {df['Coverage'].max()}x")
print(f"Quality range: {df['Read_Quality'].min():.1f} to {df['Read_Quality'].max():.1f}")
print("="*50)