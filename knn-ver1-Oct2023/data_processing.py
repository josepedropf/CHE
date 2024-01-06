import os
import csv

SCENARIOS = ['A1a', 'A1b', 'A1c', 'A2', 'A3']
CASES = ['original', 'nonloop', 'fullyoptimized']
FLAGSET = ['noflags', 'vect', 'O3', 'openmp']

NSCENARIO = 2
NCASE = 2
NFLAG = 3

SCENARIO = SCENARIOS[NSCENARIO]
CASE = CASES[NCASE]
FLAGS = FLAGSET[NFLAG]

folder_path = '/stats/' + SCENARIO + '/' + CASE + '/' + FLAGS
parent_dir = os.path.abspath(os.path.join(os.getcwd(), os.pardir))
abs_folder_path = parent_dir + folder_path

def get_csv_values(folder_path, value_string, last_file_index=10):
    # Iterate through files in the folder
    csv_values = []
    for i in range(1, last_file_index + 1):
        file_name = f"power{i}.csv"
        file_path = os.path.join(folder_path, file_name)
        
        # Check if the file exists
        if os.path.exists(file_path):
            # Open the CSV file and read the specific column
            with open(file_path, 'r') as csv_file:
                csv_reader = csv.reader(csv_file)
                for row in csv_reader:
                    try:
                        if str(row[0])[:len(value_string)] == value_string:
                            splitted =row[0].split('=')[1][1:]
                            csv_values.append(float(splitted))
                    except: continue
                # Print or process the column values
                #print(f"Values from {file_name}, Column A{column_index + 1}: {column_values}")
        else:
            print(f"File {file_name} not found. With path {file_path}")
    return csv_values

def get_text_values(folder_path, last_file_index=10):
    
    txt_values = []
    for i in range(1, last_file_index + 1):
        file_name = f"time{i}.txt"
        file_path = os.path.join(folder_path, file_name)
        
        # Check if the file exists
        if os.path.exists(file_path):
            with open(file_path, 'r') as txt_file:
                for line in txt_file:
                    try:
                        if line[:5] == "Time:":
                            splitted = line[7:].split(' ')[0]
                            txt_values.append(float(splitted))
                    except: continue
    return txt_values

processor_energies = get_csv_values(abs_folder_path, "Cumulative Processor Energy_0 (Joules)")
processor_powers = get_csv_values(abs_folder_path, "Average Processor Power_0 (Watt)")
execution_times = get_text_values(abs_folder_path)

print(processor_energies)
print(processor_powers)
print(execution_times)

avg_processor_energy = sum(processor_energies) / len(processor_energies)
avg_processor_power = sum(processor_powers) / len(processor_powers)
avg_execution_time = sum(execution_times) / len(execution_times)

print(f"Average execution time: {avg_execution_time}")
print(f"Average processor energy: {avg_processor_energy}")
print(f"Average processor power: {avg_processor_power}")

