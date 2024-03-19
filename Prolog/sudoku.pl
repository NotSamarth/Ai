import serial
import time
import csv
from datetime import datetime

# Configure the serial port
ser = serial.Serial('COM5', 9600, timeout=1)  # Replace 'COM5' with the appropriate port on your system
time.sleep(2)  # Wait for the Arduino to reset

# Open or create a CSV file to store the sensor readings
filename = "sensor_readings.csv"
with open(filename, mode='a', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(["Timestamp", "Sensor Value"])  # Write header row

# Target time interval between readings (in seconds)
target_interval = 0.1  # 10 readings per second

start_time = time.perf_counter()
while True:
    # Read data from the Arduino
    ser.write(b'r')  # Send 'r' to request data
    data = ser.readline().decode().strip()

    # Process the received data
    if data:
        sensor_value = int(data)
        print(f"Received sensor value: {sensor_value}")

        # Get the current timestamp
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S.%f")

        # Perform operations on the sensor value
        # ...

        # Send a signal to the Arduino based on the operations
        if sensor_value > 500:
            ser.write(b'h')  # Send 'h' for high signal
            print("Sent high signal to Arduino")
        else:
            ser.write(b'l')  # Send 'l' for low signal
            print("Sent low signal to Arduino")

        # Store the sensor reading and timestamp in the CSV file
        with open(filename, mode='a', newline='') as file:
            writer = csv.writer(file)
            writer.writerow([timestamp, sensor_value])

    # Calculate the time elapsed since the last reading
    elapsed_time = time.perf_counter() - start_time

    # Wait for the remaining time to maintain the target interval
    remaining_time = target_interval - elapsed_time
    if remaining_time > 0:
        time.sleep(remaining_time)

    # Update the start time for the next iteration
    start_time = time.perf_counter()