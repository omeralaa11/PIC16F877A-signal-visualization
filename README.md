
# PIC16F877A Signal Visualization

This project demonstrates real-time signal acquisition and visualization using the PIC16F877A microcontroller. Analog signals are read via the microcontroller's ADC, transmitted over UART, and visualized using a Processing-based desktop application. This setup is ideal for educational purposes, signal analysis, and embedded systems experimentation.

---

## 📁 Project Structure

* **`project/`**: Contains the mikroC source code for the PIC16F877A microcontroller.
* **`processing IDE code.pde`**: Processing sketch for real-time signal visualization on a PC.
* **`Simulation circuit.jpg`**: Proteus simulation schematic illustrating the hardware setup.
* **`mikroC code.jpg`**: Screenshot of the mikroC code interface.
* **`test video.mp4`**: Demonstration video showcasing the system in action.([GitHub][1], [GitHub][2])

---

## 🛠️ Requirements

### Hardware

* **PIC16F877A** microcontroller
* **Analog signal source** (e.g., function generator or potentiometer)
* **UART-to-USB converter** (e.g., FTDI module)
* **PC** with a USB port

### Software

* [mikroC PRO for PIC](https://www.mikroe.com/mikroc/pic)
* [Processing IDE](https://processing.org/download)
* [Proteus Design Suite](https://www.labcenter.com/) (for simulation)([GitHub][3])

---

## ⚙️ How It Works

1. **Signal Acquisition**: The PIC16F877A reads analog input signals using its built-in 10-bit ADC.
2. **Data Transmission**: The digitized signal values are sent over UART to a connected PC.
3. **Real-Time Visualization**: The Processing application receives the data and plots the signal waveform in real-time, providing a visual representation of the analog input.

---

## 🚀 Getting Started

### 1. Microcontroller Setup

* Open the `project/` folder in mikroC PRO for PIC.
* Compile and upload the code to the PIC16F877A microcontroller.
* Ensure the analog signal source is connected to the appropriate ADC input pin.

### 2. PC Visualization

* Open `processing IDE code.pde` in the Processing IDE.
* Modify the serial port settings in the code to match your system's configuration.
* Run the Processing sketch to start visualizing incoming data.([Gist][4])

### 3. Simulation (Optional)

* Use `Simulation circuit.jpg` as a reference to recreate the circuit in Proteus.
* Load the compiled `.hex` file into the PIC16F877A component within Proteus.
* Run the simulation to test the system virtually.([GitHub][2])

---

## 📷 Preview

![Simulation Circuit](https://github.com/omeralaa11/PIC16F877A-signal-visualization/blob/main/Simulation%20circuit.jpg)

![mikroC Code](https://github.com/omeralaa11/PIC16F877A-signal-visualization/blob/main/mikroC%20code.jpg)

---

## 📹 Demonstration Video

A demonstration video (`test video.mp4`) is included in the repository, showcasing the real-time signal visualization in action.
