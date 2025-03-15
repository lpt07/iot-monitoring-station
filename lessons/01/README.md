# Installation Guide

This README provides detailed installation instructions for **Python 3.10**, **Docker**, **Docker Desktop**, and **Paho-MQTT for Python** across different operating systems: **Windows**, **Linux**, and **MacOS**.

### Table of Contents:
1. **Prerequisites**
2. **Python 3.10 Installation**
    - Windows
    - Linux (Debian-based)
    - MacOS
3. **Docker Installation**
    - Windows
    - Linux (Debian-based)
    - MacOS
4. **Docker Desktop Installation**
    - Windows
    - MacOS
5. **Install Paho-MQTT for Python**
    - Using `pip` (All Operating Systems)
6. **Official Links**
7. **Troubleshooting**
8. **Installing WSL 2 on Windows**

---

## 1. Prerequisites

Before beginning, ensure that you have:

- A stable internet connection to download the required software.
- Administrative access to your computer (for installing system packages).
- Command-line tools such as **Terminal** on Mac/Linux or **PowerShell/Command Prompt** on Windows.

---

## 2. Python 3.10 Installation

### Windows

1. Visit the [Python Downloads page](https://www.python.org/downloads/release/python-3100/).
2. Download the **Windows installer (64-bit or 32-bit)**.
3. Run the installer.
    - **Important:** Ensure that you check the box **Add Python to PATH** at the beginning of the installation process.
4. Click **Install Now**.
5. Verify Python 3.10 installation by opening **Command Prompt** and running:
    ```bash
    python --version
    ```
    This should output `Python 3.10.x`.

### Linux (Debian-based)

1. Update the package list:
    ```bash
    sudo apt update
    ```
2. Install Python 3.10 using the following commands:
    ```bash
    sudo apt install python3.10
    ```
3. Optionally, install `python3.10-venv` and `python3.10-dev` for development tools:
    ```bash
    sudo apt install python3.10-venv python3.10-dev
    ```
4. Verify the installation:
    ```bash
    python3.10 --version
    ```
    You should see `Python 3.10.x`.

### MacOS

1. Install **Homebrew** if it's not already installed. Homebrew is a package manager for macOS. To install Homebrew, open **Terminal** and run:
    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```
2. Once Homebrew is installed, use it to install Python 3.10:
    ```bash
    brew install python@3.10
    ```
3. Verify the installation:
    ```bash
    python3.10 --version
    ```
    This should output `Python 3.10.x`.

---

## 3. Docker Installation

### Windows

1. Visit the [Docker Desktop for Windows page](https://www.docker.com/products/docker-desktop).
2. Download **Docker Desktop for Windows**.
3. Run the installer and follow the on-screen instructions.
4. **Enable WSL 2 (Windows Subsystem for Linux)** if prompted during installation. Docker Desktop requires WSL 2 to run containers on Windows.
5. Once the installation is complete, open Docker Desktop from the Start menu.
6. Verify Docker installation by running the following command in **Command Prompt** or **PowerShell**:
    ```bash
    docker --version
    ```

### Linux (Debian-based)

1. Update the package list:
    ```bash
    sudo apt update
    ```
2. Install required dependencies:
    ```bash
    sudo apt install apt-transport-https ca-certificates curl software-properties-common
    ```
3. Add Docker's official GPG key:
    ```bash
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    ```
4. Add Docker’s official repository:
    ```bash
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    ```
5. Update the package list again:
    ```bash
    sudo apt update
    ```
6. Install Docker:
    ```bash
    sudo apt install docker-ce
    ```
7. Start and enable the Docker service:
    ```bash
    sudo systemctl start docker
    sudo systemctl enable docker
    ```
8. Verify Docker installation:
    ```bash
    docker --version
    ```

### MacOS

1. Visit the [Docker Desktop for Mac page](https://www.docker.com/products/docker-desktop).
2. Download **Docker Desktop for Mac**.
3. Open the downloaded `.dmg` file and drag Docker into the **Applications** folder.
4. Launch Docker from the **Applications** folder.
5. Once Docker starts, verify installation by running the following in **Terminal**:
    ```bash
    docker --version
    ```

---

## 4. Docker Desktop Installation

### Windows

Docker Desktop includes Docker Engine and a GUI to interact with containers. It can be installed using the instructions for **Docker** on Windows above.

### MacOS

Docker Desktop for Mac includes the GUI for managing containers. Follow the instructions above for **Docker** on MacOS.

---

## 5. Install Paho-MQTT for Python

To use Paho-MQTT, a Python library for MQTT messaging, follow the steps below to install it using `pip`.

### Using `pip` (All Operating Systems)

1. Open **Terminal** (Linux/macOS) or **Command Prompt** (Windows).
2. Install **Paho-MQTT** via `pip`:
    ```bash
    python3.10 -m pip install paho-mqtt
    ```
3. Verify the installation:
    ```bash
    python3.10 -c "import paho.mqtt.client as mqtt; print(mqtt.__version__)"
    ```
    This should display the installed version of Paho-MQTT.

---

## 6. Official Links

- [Python Downloads](https://www.python.org/downloads/)
- [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop)
- [Docker Desktop for Mac](https://www.docker.com/products/docker-desktop)
- [Docker Engine for Linux](https://docs.docker.com/engine/install/)
- [Paho-MQTT Documentation](https://www.eclipse.org/paho/)

---

## 7. Troubleshooting

### Common Issues and Solutions:

#### **Issue:** `python3.10` command not found
- Ensure Python 3.10 is installed properly and added to your system’s PATH.
- On Windows, ensure you checked **Add Python to PATH** during installation.
  
#### **Issue:** Docker fails to start on Windows/Mac
- Ensure **Hyper-V** is enabled (Windows) or **Virtualization** is enabled in BIOS/UEFI.
- On Windows, ensure **WSL 2** is enabled as part of Docker Desktop installation.

#### **Issue:** Paho-MQTT installation fails
- Try upgrading `pip` before installing:
    ```bash
    python3.10 -m pip install --upgrade pip
    ```

---

## 8. Installing WSL 2 on Windows

WSL 2 (Windows Subsystem for Linux version 2) is not installed by default on Windows, and you need to enable it manually. Here are the steps to enable and install WSL 2 on Windows:

1. **Enable the WSL feature:**
   - Open **PowerShell** as **Administrator** (right-click and select "Run as Administrator").
   - Run the following command to enable the WSL feature:
     ```bash
     wsl --install
     ```
     This command will install both WSL and WSL 2 automatically if you're on **Windows 10 version 2004** (Build 19041) or higher. It will also install the latest Ubuntu distribution by default.

2. **If you have an older version of Windows or need to manually install WSL 2:**
   - First, ensure that the **Virtual Machine Platform** and **Windows Subsystem for Linux** features are enabled:
     ```bash
     dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
     dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
     ```
   - Restart your computer.

3. **Set WSL 2 as the default version:**
   - Run this command in PowerShell (Admin) to set WSL 2 as your default version:
     ```bash
     wsl --set-default-version 2
     ```

4. **Install a Linux distribution:**
   - After setting WSL 2 as the default version, install a Linux distribution from the Microsoft Store (e.g., Ubuntu).
   - Simply open the **Microsoft Store**, search for the Linux distribution you want (e.g., Ubuntu), and click **Install**.

5. **Verify the installation:**
   - Once installed, you can verify that WSL 2 is running by checking the version with the following command in PowerShell:
     ```bash
     wsl --list --verbose
     ```
     This will show the installed distributions along with their WSL versions.

For more detailed instructions, refer to the official Microsoft guide:  
[Install WSL](https://docs.microsoft.com/en-us/windows/wsl/install)
