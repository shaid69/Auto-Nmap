# Auto-Nmap

**Created by Shaid Mahamud**

## Overview

The **Auto-Nmap** tool is a powerful, user-friendly Bash script designed to automate Nmap scans for ethical hacking, network administration, and cybersecurity tasks. This tool features a clean and colorful UI, making it simple for both beginners and professionals to perform reconnaissance, port scanning, OS detection, firewall evasion, and much more.

## Key Features

- **Interactive Menu System**: Easy navigation through various scan types and commands.
- **Advanced Nmap Scans**: Automate a wide range of Nmap commands, from basic recon to complex vulnerability assessments.
- **Firewall/IDS Evasion Techniques**: Implement advanced techniques like fragmentation, decoy, and MAC spoofing.
- **Performance Optimization**: Control scan timing for either stealth or fast scanning needs.
- **Multiple Output Formats**: Save scan results in Normal, XML, Grepable, or all formats at once.
- **Custom Command Execution**: Run custom Nmap commands directly from the script.

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/shaid69/Auto-Nmap.git
   ```

2. **Make the Script Executable**:
   ```bash
   chmod +x nmap.sh
   ```

3. **Run the Script**:
   ```bash
   ./nmap.sh
   ```

## Usage

Once the script is run, it will present an interactive menu with the following options:

1. **Reconnaissance**: Perform basic discovery and recon on targets.
2. **Advanced Port Scanning**: Scan ports using a variety of techniques (TCP, SYN, UDP).
3. **Service and Version Detection**: Identify services running on open ports.
4. **OS Detection & Traceroute**: Detect operating systems and network paths.
5. **NSE Script Scanning**: Leverage Nmap’s scripting engine for deeper analysis.
6. **Firewall Evasion**: Use fragmentation, decoys, and other stealth techniques.
7. **Timing and Performance**: Optimize scan speed for different scenarios.
8. **Output Formats**: Choose how to save scan results (Normal, XML, Grepable, All).
9. **Multiple Target Scanning**: Scan multiple targets in a single operation.
10. **Custom Commands**: Enter your custom Nmap commands.

## Contributing

Feel free to contribute by opening pull requests with enhancements or bug fixes. Follow the standard GitHub flow for contributions.

