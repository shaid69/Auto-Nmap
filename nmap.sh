#!/bin/bash

# Nmap Advanced Ethical Hacking Tool - Created by Shaid Mahamud
# Designed for network scanning, penetration testing, and advanced recon

# Color definitions for a colorful user interface
RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[34m"
CYAN="\e[36m"
YELLOW="\e[33m"
MAGENTA="\e[35m"
RESET="\e[0m"

# Display professional banner with improved aesthetics
function show_banner() {
    echo -e "${CYAN}"
    echo " █████╗ ██╗   ██╗████████╗ ██████╗     ███╗   ██╗███╗   ███╗ █████╗ ██████╗ "
    echo "██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗    ████╗  ██║████╗ ████║██╔══██╗██╔══██╗"
    echo "███████║██║   ██║   ██║   ██║   ██║    ██╔██╗ ██║██╔████╔██║███████║██████╔╝"
    echo "██╔══██║██║   ██║   ██║   ██║   ██║    ██║╚██╗██║██║╚██╔╝██║██╔══██║██╔═══╝ "
    echo "██║  ██║╚██████╔╝   ██║   ╚██████╔╝    ██║ ╚████║██║ ╚═╝ ██║██║  ██║██║     "
    echo "╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝     ╚═╝  ╚═══╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝    "
    echo "                     Created by Shaid Mahamud                              "
    echo -e "${RESET}"
}

# Function to display menu options
function show_menu() {
    echo -e "${BLUE}Select a Scan Type for Advanced Ethical Hacking:${RESET}"
    echo -e "${YELLOW}1. Reconnaissance and Discovery"
    echo -e "2. Advanced Port Scanning (TCP/UDP/Combined)"
    echo -e "3. Service & Version Detection"
    echo -e "4. OS Detection and Traceroute"
    echo -e "5. NSE Script Scanning (Vulnerabilities, Malware, etc.)"
    echo -e "6. Firewall/IDS Evasion and Stealth Techniques"
    echo -e "7. Performance Optimization (Timing, Parallelism)"
    echo -e "8. Output Formats and Logging"
    echo -e "9. Multiple Target Scanning"
    echo -e "10. Custom Command Combinations"
    echo -e "11. Exit${RESET}"
}

# Function to prompt for target input
function read_target() {
    echo -e "${GREEN}Enter target IP address, domain, or CIDR (e.g., 192.168.1.0/24):${RESET}"
    read target
}

# Function to prompt for output filename
function read_output_file() {
    echo -e "${GREEN}Enter the output file name (e.g., ethical_scan_results.txt):${RESET}"
    read output_file
}

# Function for Reconnaissance and Discovery
function recon_scan() {
    read_target
    echo -e "${CYAN}Performing basic reconnaissance on $target...${RESET}"
    nmap -sn $target  # Ping scan to discover live hosts
    echo -e "${CYAN}Attempting DNS resolution and Whois lookup...${RESET}"
    nmap -sL $target  # DNS Resolution
    whois $target     # Whois lookup
}

# Function for Advanced Port Scanning (TCP/UDP/Combined)
function port_scan() {
    read_target
    echo -e "${GREEN}Choose Port Scan Type:${RESET}"
    echo -e "${YELLOW}1. Full TCP Scan (-sT)"
    echo -e "2. SYN Stealth Scan (-sS)"
    echo -e "3. UDP Scan (-sU)"
    echo -e "4. Top 100 Ports (-F)"
    echo -e "5. All 65535 Ports (-p-)"
    echo -e "6. Scan Specific Ports${RESET}"
    read port_choice
    case $port_choice in
        1) nmap -sT $target ;;
        2) nmap -sS $target ;;
        3) nmap -sU $target ;;
        4) nmap -F $target ;;
        5) nmap -p- $target ;;
        6)
            echo -e "${GREEN}Enter specific ports to scan (e.g., 22,80,443):${RESET}"
            read ports
            nmap -p $ports $target
            ;;
        *) echo -e "${RED}Invalid choice!${RESET}" ;;
    esac
}

# Function for Service & Version Detection
function service_version_scan() {
    read_target
    echo -e "${CYAN}Detecting services and versions on $target...${RESET}"
    nmap -sV --version-all $target
}

# Function for OS Detection and Traceroute
function os_traceroute_scan() {
    read_target
    echo -e "${CYAN}Detecting OS and performing network mapping on $target...${RESET}"
    nmap -O --traceroute $target
}

# Function for NSE Script Scanning (Vulnerabilities, Malware, etc.)
function nse_script_scan() {
    read_target
    echo -e "${CYAN}Choose a script category to run on $target:${RESET}"
    echo -e "${YELLOW}1. Vulnerability Detection (--script vuln)"
    echo -e "2. Malware Detection (--script malware)"
    echo -e "3. Safe Default Scripts (--script default)"
    echo -e "4. All Scripts (--script all)${RESET}"
    read script_choice
    case $script_choice in
        1) nmap --script vuln $target ;;
        2) nmap --script malware $target ;;
        3) nmap --script default $target ;;
        4) nmap --script all $target ;;
        *) echo -e "${RED}Invalid choice!${RESET}" ;;
    esac
}

# Function for Firewall/IDS Evasion and Stealth Techniques
function evasion_stealth_scan() {
    read_target
    echo -e "${CYAN}Select an evasion technique:${RESET}"
    echo -e "${YELLOW}1. Fragmentation (-f)"
    echo -e "2. Decoy Scan (-D)"
    echo -e "3. MAC Spoofing (--spoof-mac)"
    echo -e "4. Idle Scan (-sI)"
    echo -e "5. Data Length Manipulation (--data-length)${RESET}"
    read evasion_choice
    case $evasion_choice in
        1) nmap -f $target ;;
        2)
            echo -e "${GREEN}Enter decoy IPs (comma separated):${RESET}"
            read decoys
            nmap -D $decoys $target
            ;;
        3)
            echo -e "${GREEN}Enter MAC address to spoof (or use '0' for random):${RESET}"
            read mac_address
            nmap --spoof-mac $mac_address $target
            ;;
        4)
            echo -e "${GREEN}Enter idle host IP:${RESET}"
            read idle_host
            nmap -sI $idle_host $target
            ;;
        5)
            echo -e "${GREEN}Enter custom data length (e.g., 50):${RESET}"
            read data_length
            nmap --data-length $data_length $target
            ;;
        *) echo -e "${RED}Invalid choice!${RESET}" ;;
    esac
}

# Function for Performance Optimization (Timing, Parallelism)
function timing_performance_scan() {
    read_target
    echo -e "${GREEN}Select a timing template (0-5):${RESET}"
    echo -e "${YELLOW}0. Paranoid (T0)"
    echo -e "1. Sneaky (T1)"
    echo -e "2. Polite (T2)"
    echo -e "3. Normal (T3)"
    echo -e "4. Aggressive (T4)"
    echo -e "5. Insane (T5)${RESET}"
    read timing_choice
    case $timing_choice in
        0) nmap -T0 $target ;;
        1) nmap -T1 $target ;;
        2) nmap -T2 $target ;;
        3) nmap -T3 $target ;;
        4) nmap -T4 $target ;;
        5) nmap -T5 $target ;;
        *) echo -e "${RED}Invalid choice!${RESET}" ;;
    esac
}

# Function for Output Formats and Logging
function output_scan() {
    read_target
    read_output_file
    echo -e "${GREEN}Choose output format:${RESET}"
    echo -e "${YELLOW}1. Normal Output (-oN)"
    echo -e "2. XML Output (-oX)"
    echo -e "3. Grepable Output (-oG)"
    echo -e "4. All Formats (-oA)${RESET}"
    read output_choice
    case $output_choice in
        1) nmap -oN $output_file $target ;;
        2) nmap -oX $output_file $target ;;
        3) nmap -oG $output_file $target ;;
        4) nmap -oA $output_file $target ;;
        *) echo -e "${RED}Invalid choice!${RESET}" ;;
    esac
}

# Function for Multiple Target Scanning
function multiple_target_scan() {
    echo -e "${GREEN}Enter target IPs or CIDR (comma-separated or CIDR):${RESET}"
    read targets
    nmap $targets
}

# Function for Custom Command Combinations
function custom_command() {
    echo -e "${GREEN}Enter your custom Nmap command:${RESET}"
    read custom_cmd
    eval "nmap $custom_cmd"
}

# Main loop
show_banner
while true; do
    show_menu
    read choice
    case $choice in
        1) recon_scan ;;
        2) port_scan ;;
        3) service_version_scan ;;
        4) os_traceroute_scan ;;
        5) nse_script_scan ;;
        6) evasion_stealth_scan ;;
        7) timing_performance_scan ;;
        8) output_scan ;;
        9) multiple_target_scan ;;
        10) custom_command ;;
        11) exit 0 ;;
        *) echo -e "${RED}Invalid choice! Please select again.${RESET}" ;;
    esac
done


