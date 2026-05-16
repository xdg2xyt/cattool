#!/usr/bin/env bash
# core/ui.sh - Componentes de interface: banners, spinners, etc.
set -euo pipefail

show_banner() {
    clear
    echo -e "${PINK}"
    cat << "EOF"
╔══════════════════════════════════════════╗
║           🐱  CATTOOL v1.0  🐱          ║
║        Termux Installer & Toolbox       ║
╚══════════════════════════════════════════╝
EOF
    echo -e "${NC}"
    echo -e "${LAVENDER}   /\\_/\\"
    echo -e "  ( o.o )   \"Ronronando pacotes...\""
    echo -e "   > ^ <${NC}"
    echo ""
}

show_spinner() {
    local message="$1"
    local pid="$2"
    local delay=0.1
    local spinstr='|/-\'
    log_info "$message"
    while kill -0 "$pid" 2>/dev/null; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

show_separator() {
    echo -e "${PINK}────────────────────────────────────────${NC}"
}
