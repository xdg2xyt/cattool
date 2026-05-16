#!/usr/bin/env bash
# modules/osint.sh - Instala ferramentas de OSINT
set -euo pipefail

install_osint_tools() {
    log_cat "🐾 Caçando informações (OSINT)..."
    show_separator

    # theHarvester
    if is_installed theHarvester; then
        log_info "theHarvester já presente."
    else
        install_pkg theharvester
    fi

    # Sherlock (clone)
    clone_tool "https://github.com/sherlock-project/sherlock.git" "$HOME/tools/sherlock" "Sherlock"
    ensure_path "$HOME/tools/sherlock"

    # Amass
    install_go_tool "github.com/owasp-amass/amass/v3/..." "amass"

    log_success "Ferramentas OSINT instaladas. 😺 Gatinho farejador satisfeito."
}
